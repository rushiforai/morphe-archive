/**
 * Writes NOTICE into a Java constant, so the Licenses row shows exactly the file the repository
 * ships. Morphe's section 7b notice has to reach the person using the app, and a hand-kept copy
 * would drift from NOTICE the first time either changed.
 */
abstract class GenerateLicenseNotice : DefaultTask() {
    @get:InputFile
    @get:PathSensitive(PathSensitivity.RELATIVE)
    abstract val notice: RegularFileProperty

    @get:OutputDirectory
    abstract val outputDir: DirectoryProperty

    @TaskAction
    fun generate() {
        val text = notice.get().asFile.readText(Charsets.UTF_8).replace("\r\n", "\n")
        val literal = buildString {
            for (ch in text) {
                when (ch) {
                    '\\' -> append("\\\\")
                    '"' -> append("\\\"")
                    '\n' -> append("\\n")
                    else -> if (ch.code < 0x20 || ch.code > 0x7e) append("\\u%04x".format(ch.code)) else append(ch)
                }
            }
        }
        val directory = outputDir.get().asFile.resolve("app/hushgram/extension/instagram/settings")
        directory.mkdirs()
        directory.resolve("LicenseNotice.java").writeText(
            "package app.hushgram.extension.instagram.settings;\n\n" +
                "/** Generated from NOTICE by :extensions:instagram:generateLicenseNotice. Do not edit. */\n" +
                "public final class LicenseNotice {\n" +
                "    public static final String TEXT = \"$literal\";\n\n" +
                "    private LicenseNotice() {\n    }\n}\n",
            Charsets.UTF_8,
        )
    }
}

val generateLicenseNotice = tasks.register<GenerateLicenseNotice>("generateLicenseNotice") {
    notice.set(rootProject.layout.projectDirectory.file("NOTICE"))
    outputDir.set(layout.buildDirectory.dir("generated/source/licenseNotice"))
}

extensions.getByType<com.android.build.api.variant.ApplicationAndroidComponentsExtension>().onVariants { variant ->
    variant.sources.java?.addGeneratedSourceDirectory(generateLicenseNotice, GenerateLicenseNotice::outputDir)
}

// Robolectric 4.17 asks for Bouncy Castle 1.85 twice: by name, through the bc-jdk18on-bom it
// imports, and with no version of its own for the bcprov module that BOM governs. Every request
// in this module is rewritten to the reviewed release so related test libraries cannot resolve
// at mixed versions. No production configuration contains this group, so none of it reaches
// the MPE payload.
//
// Checking the resolved graph afterwards would prove nothing: the rewrite above guarantees the
// answer, so a "wrong resolved version" branch could never run. What the rewrite hides, and what
// is worth failing on, is the request underneath it. When Robolectric moves to a version nobody
// has looked at, this build stops instead of quietly rewriting it away.
val safeBouncyCastleVersion = libs.versions.bouncycastle.get()
// 1.85 was checked on 2026-09-15 against the six advisories the catalog names: CVE-2025-8916
// ends at 1.78, CVE-2026-5588 at 1.83, CVE-2025-14813 and CVE-2026-0636 at 1.84, and
// CVE-2026-8763 and CVE-2026-13506 at 1.85. It is rewritten
// all the same, because one reviewed release in the graph is easier to hold than two.
// Resolving every graph also reaches AGP's device-test tooling, which requests 1.79.
// Its known affected range is reviewed in settings.gradle.kts; the common override
// selects 1.86 here too. This records the request without permitting the old result.
val reviewedBouncyCastleRequests = setOf("1.79", "1.85", safeBouncyCastleVersion)
// Modules Robolectric declares with no version of its own, because the BOM it imports carries
// the version for them. Reviewing that BOM is what covers these, so they are named here rather
// than by a version: the BOM's own request is reviewed above, and a module that turns up here
// without one is a request nothing in this file chose the version for.
//
// Reading the constraint behind such a request instead was tried on 2026-09-15 and is worthless:
// the rewrite has already moved the BOM to the reviewed release by then, so every constraint it
// contributes names that release and the check can never fail. Same trap as the resolved-version
// check described above.
val reviewedVersionlessBouncyCastleModules = setOf("bcprov-jdk18on")
// Guarded by hand rather than by a synchronized wrapper: in a Kotlin build script `java` is the
// Java extension, so the java.util package cannot be named here.
val requestedBouncyCastleVersions = sortedSetOf<String>()
// Module names, kept apart from the versions above so a name can never end up in the reviewed
// version set by someone pasting it in.
val unversionedBouncyCastleRequests = sortedSetOf<String>()
// GHSA-xxph-c9ww-hj94 covers every Guava before 33.7.2, and Robolectric's test graph asks for
// 33.6.0. Rewritten to the catalog's release, as :patches does for the patcher's graph.
val safeGuavaVersion = libs.versions.guava.get()

configurations.configureEach {
    resolutionStrategy.eachDependency {
        if (requested.group == "org.bouncycastle") {
            // Recorded whatever it is, including a request that carries no version of its own.
            // A ?.let dropped those: one arriving through a platform or a BOM was rewritten to
            // the reviewed release like any other and then counted nowhere, so the unreviewed
            // set stayed empty for it and the gate below had nothing to fail on. A request with
            // no version is the one most worth reading, because nothing in this file chose
            // what it would otherwise have resolved to.
            // Blank as well as null. A declaration with no version at all reports "" rather
            // than null, so a plain null check counted it as a version and the failure read
            // "asks for Bouncy Castle , which nobody has reviewed": it stopped the build, which
            // is the point, but said nothing a reader could act on.
            val asked = requested.version?.takeIf { it.isNotBlank() }
            if (asked != null) {
                synchronized(requestedBouncyCastleVersions) { requestedBouncyCastleVersions.add(asked) }
            } else {
                synchronized(unversionedBouncyCastleRequests) { unversionedBouncyCastleRequests.add(requested.name) }
            }
            useVersion(safeBouncyCastleVersion)
            because("The Robolectric test graph must use the reviewed security release.")
        }
        if (requested.group == "com.google.guava" && requested.name == "guava") {
            useVersion(safeGuavaVersion)
            because("GHSA-xxph-c9ww-hj94 covers every Guava before 33.7.2.")
        }
    }
}

val verifyBouncyCastleTestGraph = tasks.register("verifyBouncyCastleTestGraph") {
    group = "verification"
    description = "Checks the unit-test graphs for unreviewed Bouncy Castle requests."

    doLast {
        // Resolving is what runs the rewrite above, so the requests are collected here rather
        // than being read from a set that nothing has filled yet.
        val classpaths = configurations
            .filter { it.name.endsWith("UnitTestRuntimeClasspath") && it.isCanBeResolved }
            .sortedBy { it.name }
        if (classpaths.isEmpty()) {
            throw GradleException("This module has no unit-test runtime classpath to inspect.")
        }

        for (classpath in classpaths) {
            val modules = classpath.incoming.resolutionResult.allComponents
                .mapNotNull { component ->
                    component.moduleVersion?.takeIf { it.group == "org.bouncycastle" }
                }
                .distinctBy { "${it.group}:${it.name}:${it.version}" }
                .sortedBy { it.name }

            if (modules.isEmpty()) {
                throw GradleException("${classpath.name} contains no Bouncy Castle module.")
            }
            logger.lifecycle(
                "Bouncy Castle in ${classpath.name}: " +
                    modules.joinToString(", ") { "${it.name}:${it.version}" }
            )
        }

        val requested = synchronized(requestedBouncyCastleVersions) {
            requestedBouncyCastleVersions.toSet()
        }
        val unversioned = synchronized(unversionedBouncyCastleRequests) {
            unversionedBouncyCastleRequests.toSet()
        }
        val unreviewed = (requested - reviewedBouncyCastleRequests).sorted() +
            (unversioned - reviewedVersionlessBouncyCastleModules).sorted()
                .map { "$it with no version of its own" }
        if (unreviewed.isNotEmpty()) {
            throw GradleException(
                "The test graph now asks for Bouncy Castle " + unreviewed.joinToString(", ") +
                    ", which nobody has reviewed. It is being rewritten to $safeBouncyCastleVersion. " +
                    "Check the advisory for the requested release, then add a version to " +
                    "reviewedBouncyCastleRequests, or a module asking for no version of its own " +
                    "to reviewedVersionlessBouncyCastleModules once you have read what carries " +
                    "its version, or move the pin."
            )
        }
    }
}

// By type rather than by the one name. This module builds unit tests for debug only today, so
// testDebugUnitTest is the whole of it, but a second unit-test variant would otherwise start a
// test JVM on a graph nothing had looked at.
tasks.withType<Test>().configureEach {
    dependsOn(verifyBouncyCastleTestGraph)
}

// A filtered run or robolectric.enabledSdks can silently omit a platform. The matrix's actual
// behavioral cases must all have passed, including the dialog cases that assert SDK_INT itself.
tasks.register("verifyAndroidBoundaries") {
    group = "verification"
    description = "Requires passing Android 9/10/17 settings, recovery, storage and Cancel cases."
    dependsOn("testDebugUnitTest")
    val results = layout.buildDirectory.dir("test-results/testDebugUnitTest")
    inputs.dir(results)
    doLast {
        val required = mapOf(
            "app.hushgram.extension.instagram.settings.OverrideDocumentsTest" to listOf(
                "installedDeveloperPatchOffersReadOnlyDocumentActions[28]", "installedDeveloperPatchOffersReadOnlyDocumentActions",
                "missingDeveloperPatchHasNoOverrideDocumentActions[28]", "missingDeveloperPatchHasNoOverrideDocumentActions",
                "exportUsesTheResolvedSessionStoreAndClosesTheDocumentBeforeSuccess[28]", "exportUsesTheResolvedSessionStoreAndClosesTheDocumentBeforeSuccess",
                "changedValidFileIsValidatedOnlyAndLeavesNativeBytesUntouched[28]", "changedValidFileIsValidatedOnlyAndLeavesNativeBytesUntouched",
                "cancellationWrongUriAndMissingPickerKeepControlsUsableWithoutNativeReads[28]", "cancellationWrongUriAndMissingPickerKeepControlsUsableWithoutNativeReads",
                "malformedOversizedAndBuildMismatchedDocumentsAreRefusedWithoutWrites[28]", "malformedOversizedAndBuildMismatchedDocumentsAreRefusedWithoutWrites",
                "inputReadAndCloseFailuresCannotReportValidatedSuccess[28]", "inputReadAndCloseFailuresCannotReportValidatedSuccess",
                "outputWriteAndCloseFailuresCannotReportExportedSuccess[28]", "outputWriteAndCloseFailuresCannotReportExportedSuccess",
                "unsupportedSessionNativeFailureAndRelativePathRefuseBeforeDocumentOutput[28]", "unsupportedSessionNativeFailureAndRelativePathRefuseBeforeDocumentOutput",
                "absentNativeFileExportsEmptyValuesWithoutCreatingIt[28]", "absentNativeFileExportsEmptyValuesWithoutCreatingIt"),
            "app.hushgram.extension.instagram.comment.CommentCopyTest" to listOf(
                "explicitTapCopiesTheOriginalVerbatimAndMarksItSensitive[28]", "explicitTapCopiesTheOriginalVerbatimAndMarksItSensitive",
                "immutableAndRepeatedMenusKeepStockIdentityAndOnlyOneOwnedRow[28]", "immutableAndRepeatedMenusKeepStockIdentityAndOnlyOneOwnedRow",
                "offPausedUnreadyAndUnsupportedMenusAreUntouched[28]", "offPausedUnreadyAndUnsupportedMenusAreUntouched",
                "emptyTextGetsNoRowAndWhitespaceIsNeverTrimmed[28]", "emptyTextGetsNoRowAndWhitespaceIsNeverTrimmed",
                "discoveryAndClipboardFailuresReturnToNativeDismissal[28]", "discoveryAndClipboardFailuresReturnToNativeDismissal",
                "emptyOrNullCurrentTextRemovesStaleOwnedRowsFromImmutableMenus[28]", "emptyOrNullCurrentTextRemovesStaleOwnedRowsFromImmutableMenus",
                "staleMenusAreUntouchedWhileOffPausedOrUnreadyAndFailuresRemainContained[28]", "staleMenusAreUntouchedWhileOffPausedOrUnreadyAndFailuresRemainContained"),
            "app.hushgram.extension.instagram.comment.CommentPhotoTest" to listOf(
                "explicitTapSavesAnImmutableSnapshotAndReturnsForDismissal[28]", "explicitTapSavesAnImmutableSnapshotAndReturnsForDismissal",
                "immutableRepeatedAndChangedMenusKeepStockRowsAndOneOwnedRow[28]", "immutableRepeatedAndChangedMenusKeepStockRowsAndOneOwnedRow",
                "noPhotoNowRemovesOnlyStaleOwnedRows[28]", "noPhotoNowRemovesOnlyStaleOwnedRows",
                "eachFamilyAloneAndTogetherKeepDistinctOwnedRows[28]", "eachFamilyAloneAndTogetherKeepDistinctOwnedRows",
                "offPausedUnreadyAndMissingInputsLeaveStockUntouched[28]", "offPausedUnreadyAndMissingInputsLeaveStockUntouched",
                "getterRowAndQueueFailuresStayContainedAndRespectALateSwitch[28]", "getterRowAndQueueFailuresStayContainedAndRespectALateSwitch"),
            "app.hushgram.extension.instagram.download.CommentPhotoSaveTest" to listOf(
                "explicitCommentPhotoTapSavesTheLargestSuppliedRenditionAndCleansUp[28]", "explicitCommentPhotoTapSavesTheLargestSuppliedRenditionAndCleansUp",
                "commentPhotoCancelUsesTheExistingControlAndRemovesAllTemporaryState[28]", "commentPhotoCancelUsesTheExistingControlAndRemovesAllTemporaryState",
                "deniedLegacyStoragePermissionLeavesNoPendingPhoto"),
            "app.hushgram.extension.instagram.download.CommentPhotoDownloadTest" to listOf(
                "onlySuppliedMetaPhotoAddressesAreCopiedVerbatim[28]", "onlySuppliedMetaPhotoAddressesAreCopiedVerbatim",
                "missingModelsGetNoImageFallback[28]", "missingModelsGetNoImageFallback",
                "copyIsDetachedAndUnmodifiable[28]", "copyIsDetachedAndUnmodifiable",
                "aSaveThatCannotStartSaysSoAndNeverThrows[28]", "aSaveThatCannotStartSaysSoAndNeverThrows"),
            "app.hushgram.extension.instagram.profile.ProfileSuggestionsTest" to listOf(
                "offPausedAndUnreadyLeaveInstagramsAnswers[28]", "offPausedAndUnreadyLeaveInstagramsAnswers",
                "aButtonHiddenEarlierComesBackWhenTheSwitchGoesOff[28]", "aButtonHiddenEarlierComesBackWhenTheSwitchGoesOff",
                "aButtonThatThrowsIsLeftAndReported[28]", "aButtonThatThrowsIsLeftAndReported"),
            "app.hushgram.extension.instagram.profile.ProfileHighlightsTest" to listOf(
                "withTheSwitchOnTheRowIsLeftOut[28]", "withTheSwitchOnTheRowIsLeftOut",
                "offToStartAndOffKeepsTheRow[28]", "offToStartAndOffKeepsTheRow",
                "offPausedAndUnreadyKeepTheRow[28]", "offPausedAndUnreadyKeepTheRow",
                "aThrowingSwitchKeepsTheRowAndIsReported[28]", "aThrowingSwitchKeepsTheRowAndIsReported"),
            "app.hushgram.extension.instagram.settings.ProfileHighlightsSettingsTest" to listOf(
                "missingPatchHasNoHighlightsSwitch[28]", "missingPatchHasNoHighlightsSwitch",
                "highlightsSwitchStartsOffPersistsAndHonorsPause[28]", "highlightsSwitchStartsOffPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.feed.SwipeToCreateTest" to listOf(
                "withTheSwitchOnASwipeTowardTheCameraIsHeld[28]", "withTheSwitchOnASwipeTowardTheCameraIsHeld",
                "everyOtherMoveGoesOn[28]", "everyOtherMoveGoesOn",
                "offPausedAndUnreadyLetTheSwipeGo[28]", "offPausedAndUnreadyLetTheSwipeGo",
                "aThrowingSwitchLetsTheSwipeGoAndIsReported[28]", "aThrowingSwitchLetsTheSwipeGoAndIsReported"),
            "app.hushgram.extension.instagram.settings.SwipeToCreateSettingsTest" to listOf(
                "missingPatchHasNoSwipeSwitch[28]", "missingPatchHasNoSwipeSwitch",
                "swipeSwitchStartsOffPersistsAndHonorsPause[28]", "swipeSwitchStartsOffPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.reels.ReelScrollingTest" to listOf(
                "withTheSwitchOnAReelsPagerStaysPut[28]", "withTheSwitchOnAReelsPagerStaysPut",
                "otherPagersAreLeftAlone[28]", "otherPagersAreLeftAlone",
                "aPagerSetUpWhileOffIsHeldOnceOn[28]", "aPagerSetUpWhileOffIsHeldOnceOn",
                "offPausedAndUnreadyKeepReelsScrolling[28]", "offPausedAndUnreadyKeepReelsScrolling",
                "aThrowingSwitchKeepsReelsScrollingAndIsReported[28]", "aThrowingSwitchKeepsReelsScrollingAndIsReported"),
            "app.hushgram.extension.instagram.settings.ReelScrollingSettingsTest" to listOf(
                "missingPatchHasNoReelScrollingSwitch[28]", "missingPatchHasNoReelScrollingSwitch",
                "reelScrollingSwitchStartsOffPersistsAndHonorsPause[28]", "reelScrollingSwitchStartsOffPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.profile.FollowingListTest" to listOf(
                "ownFollowingListMarksOnlyWhoDoesNotFollowBack[28]", "ownFollowingListMarksOnlyWhoDoesNotFollowBack",
                "aRowWithNoNameShowsTheMarkOnItsOwn[28]", "aRowWithNoNameShowsTheMarkOnItsOwn",
                "anUnknownAnswerStaysUnmarked[28]", "anUnknownAnswerStaysUnmarked",
                "otherListsStayUnmarked[28]", "otherListsStayUnmarked",
                "offPausedAndUnreadyKeepInstagramsRow[28]", "offPausedAndUnreadyKeepInstagramsRow",
                "aThrowingReaderOrSwitchKeepsTheRowAndIsReported[28]", "aThrowingReaderOrSwitchKeepsTheRowAndIsReported",
                "aRecycledRowLosesItsStaleMark[28]", "aRecycledRowLosesItsStaleMark"),
            "app.hushgram.extension.instagram.stories.StoryMarksTest" to listOf(
                "unmarkedStoriesNeverReachTheRequest[28]", "unmarkedStoriesNeverReachTheRequest",
                "aMarkedStoryGoesOnceAndOnlyOnce[28]", "aMarkedStoryGoesOnceAndOnlyOnce",
                "severalMarksGoTogether[28]", "severalMarksGoTogether",
                "aMarkForAStoryNotInTheBatchWaitsThenLapses[28]", "aMarkForAStoryNotInTheBatchWaitsThenLapses",
                "aStoryHeldBackBeforeItsMarkGoesWithTheNextSend[28]", "aStoryHeldBackBeforeItsMarkGoesWithTheNextSend",
                "anUndoneMarkSendsNothing[28]", "anUndoneMarkSendsNothing",
                "keysOfAnotherShapeStayHeldBack[28]", "keysOfAnotherShapeStayHeldBack",
                "offPausedUnreadyOrThrowingKeepsStockBehavior[28]", "offPausedUnreadyOrThrowingKeepsStockBehavior",
                "theSwitchesFollowTheSettingsAndThePause[28]", "theSwitchesFollowTheSettingsAndThePause",
                "throwingDiagnosticsNeverLetTheWholeBatchOut[28]", "throwingDiagnosticsNeverLetTheWholeBatchOut",
                "aMarkBelongsToTheAccountItWasMadeOn[28]", "aMarkBelongsToTheAccountItWasMadeOn",
                "withNoAccountNothingIsMarkedKeptOrSent[28]", "withNoAccountNothingIsMarkedKeptOrSent",
                "aBatchThatCantStartEmptyKeepsTheMarkedStoriesForLater[28]", "aBatchThatCantStartEmptyKeepsTheMarkedStoriesForLater",
                "aRetriedBatchHeldBackGoesOutEmpty[28]", "aRetriedBatchHeldBackGoesOutEmpty"),
            "app.hushgram.extension.instagram.stories.StorySeenButtonTest" to listOf(
                "theButtonGoesBeforeTheMenuAndSaysWhatItDoes[28]", "theButtonGoesBeforeTheMenuAndSaysWhatItDoes",
                "aTapMarksTheStoryAndASecondTapUndoesIt[28]", "aTapMarksTheStoryAndASecondTapUndoesIt",
                "aTapOnAStoryAlreadyHeldBackSendsItRightAway[28]", "aTapOnAStoryAlreadyHeldBackSendsItRightAway",
                "aRecycledHeaderFollowsItsNewStory[28]", "aRecycledHeaderFollowsItsNewStory",
                "aStoryThatIsntAPostHasNoButton[28]", "aStoryThatIsntAPostHasNoButton",
                "offPausedOrUnreadyShowsNoButton[28]", "offPausedOrUnreadyShowsNoButton",
                "aHeaderWithoutTheRowIsReported[28]", "aHeaderWithoutTheRowIsReported",
                "aThrowingReaderOrSwitchIsReportedAndLeavesTheHeader[28]", "aThrowingReaderOrSwitchIsReportedAndLeavesTheHeader",
                "aMarkOnOneAccountIsNeverSentForAnother[28]", "aMarkOnOneAccountIsNeverSentForAnother",
                "withoutTheAccountThereIsNoButton[28]", "withoutTheAccountThereIsNoButton",
                "aHiddenButtonForgetsItsStory[28]", "aHiddenButtonForgetsItsStory"),
            "app.hushgram.extension.instagram.reels.ReelsSuggestionsTest" to listOf(
                "offPausedAndUnreadyKeepEveryItem[28]", "offPausedAndUnreadyKeepEveryItem",
                "aThrowingReaderOrSwitchKeepsTheItemAndIsReported[28]", "aThrowingReaderOrSwitchKeepsTheItemAndIsReported"),
            "app.hushgram.extension.instagram.reels.ReelSeekBarTest" to listOf(
                "offPausedAndUnreadyLeaveInstagramsAnswers[28]", "offPausedAndUnreadyLeaveInstagramsAnswers",
                "aThrowingSwitchLeavesInstagramsAnswersAndIsReported[28]", "aThrowingSwitchLeavesInstagramsAnswersAndIsReported",
                "rightToLeftPutsTheLabelAtTheLeftEnd[28]", "rightToLeftPutsTheLabelAtTheLeftEnd",
                "twiceTheTextSizeStillFits[28]", "twiceTheTextSizeStillFits",
                "aContainerWithNoRoomPutsTheWholeLabelOnTheViewAboveIt[28]",
                "aContainerWithNoRoomPutsTheWholeLabelOnTheViewAboveIt",
                "aBarSetBeforeItsLayoutGetsItsLabelOnceLaidOut[28]", "aBarSetBeforeItsLayoutGetsItsLabelOnceLaidOut",
                "theLabelLeavesWithItsBar[28]", "theLabelLeavesWithItsBar",
                "theLabelHidesWithItsBarOrAnyViewAbove[28]", "theLabelHidesWithItsBarOrAnyViewAbove",
                "aHostRecycledForAnItemWithNoBarKeepsNoLabel[28]", "aHostRecycledForAnItemWithNoBarKeepsNoLabel",
                "aReplacedBarLeavesOneLabelOnItsHost[28]", "aReplacedBarLeavesOneLabelOnItsHost",
                "aBarWithNoRoomKeepsOneLabelAndOneListener[28]", "aBarWithNoRoomKeepsOneLabelAndOneListener",
                "anOrdinaryReelBoundAgainKeepsItsLabelUp[28]", "anOrdinaryReelBoundAgainKeepsItsLabelUp",
                "twoBarsSharingAHostKeepOneLabelAcrossAMove[28]", "twoBarsSharingAHostKeepOneLabelAcrossAMove",
                "aBarFurtherDownItsContainerStillCounts[28]", "aBarFurtherDownItsContainerStillCounts",
                "adsAndOtherScreensGetNoLabel[28]", "adsAndOtherScreensGetNoLabel"),
            "app.hushgram.extension.instagram.settings.CommentCopySettingsTest" to listOf(
                "missingPatchHasNoCommentSwitch[28]", "missingPatchHasNoCommentSwitch",
                "commentsSwitchStartsOffPersistsAndHonorsPause[28]", "commentsSwitchStartsOffPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.settings.CommentPhotoSettingsTest" to listOf(
                "missingPatchHasNoCommentPhotoSwitch[28]", "missingPatchHasNoCommentPhotoSwitch",
                "commentPhotoSwitchStartsOffPersistsAndHonorsPause[28]", "commentPhotoSwitchStartsOffPersistsAndHonorsPause",
                "bothCommentSwitchesShareOneCategoryAndStayIndependent[28]", "bothCommentSwitchesShareOneCategoryAndStayIndependent"),
            "app.hushgram.extension.instagram.settings.FollowingListSettingsTest" to listOf(
                "missingPatchHasNoFollowingListSwitch[28]", "missingPatchHasNoFollowingListSwitch",
                "followingListSwitchStartsOffPersistsAndHonorsPause[28]", "followingListSwitchStartsOffPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.reels.ReelAutoScrollTest" to listOf(
                "anOnAnswerIsRememberedAndOutlivesInstagramsOff[28]", "anOnAnswerIsRememberedAndOutlivesInstagramsOff",
                "turningItOffIsRemembered[28]", "turningItOffIsRemembered",
                "turningItOnWaitsForInstagram[28]", "turningItOnWaitsForInstagram",
                "aChoiceInstagramKeepsIsRememberedAtOnce[28]", "aChoiceInstagramKeepsIsRememberedAtOnce",
                "aStaleSavedOnDoesNotTurnItBackOn[28]", "aStaleSavedOnDoesNotTurnItBackOn",
                "theSavedPreferenceIsAnsweredButNeverRemembered[28]", "theSavedPreferenceIsAnsweredButNeverRemembered",
                "nothingIsWrittenWhenTheChoiceIsUnchanged[28]", "nothingIsWrittenWhenTheChoiceIsUnchanged",
                "offPausedAndUnreadyKeepInstagramsAnswer[28]", "offPausedAndUnreadyKeepInstagramsAnswer",
                "aThrowingSwitchOrMemoryKeepsInstagramsAnswerAndIsReported[28]", "aThrowingSwitchOrMemoryKeepsInstagramsAnswerAndIsReported"),
            "app.hushgram.extension.instagram.settings.ReelAutoScrollSettingsTest" to listOf(
                "missingPatchHasNoAutoScrollSwitch[28]", "missingPatchHasNoAutoScrollSwitch",
                "autoScrollSwitchStartsOnPersistsAndHonorsPause[28]", "autoScrollSwitchStartsOnPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.media.TapToPlayTest" to listOf(
                "autoScrollStartsTheReelItMovesToAndArmsIt[28]", "autoScrollStartsTheReelItMovesToAndArmsIt",
                "aMoveStartsOnePlayerOnly[28]", "aMoveStartsOnePlayerOnly",
                "aStartLaterThanALoadAfterTheMoveIsHeld[28]", "aStartLaterThanALoadAfterTheMoveIsHeld",
                "anArmedPlayerOrNoPlayerLeavesTheMoveToTheNextReel[28]", "anArmedPlayerOrNoPlayerLeavesTheMoveToTheNextReel",
                "aSwipeEndsAMoveNoStartHasUsed[28]", "aSwipeEndsAMoveNoStartHasUsed",
                "theAutoScrollHookStartsTheNextReelThroughTheGate[28]", "theAutoScrollHookStartsTheNextReelThroughTheGate",
                "offPausedOrNotReadyAMoveRecordsNothing[28]", "offPausedOrNotReadyAMoveRecordsNothing",
                "aFailingMoveRecordsNothingAndTheReportSaysSo[28]", "aFailingMoveRecordsNothingAndTheReportSaysSo"),
            "app.hushgram.extension.instagram.settings.StorySeenSettingsTest" to listOf(
                "missingPatchHasNoMarkAsSeenSwitch[28]", "missingPatchHasNoMarkAsSeenSwitch",
                "markAsSeenSwitchStartsOffPersistsAndHonorsPause[28]", "markAsSeenSwitchStartsOffPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.stories.StoryTimeTest" to listOf(
                "aTwelveHourPhoneGetsTheDateAndTimeWithPm[28]", "aTwelveHourPhoneGetsTheDateAndTimeWithPm",
                "aTwentyFourHourPhoneGetsTheTwentyFourHourTime[28]", "aTwentyFourHourPhoneGetsTheTwentyFourHourTime",
                "theLabelFollowsThePhonesLanguage[28]", "theLabelFollowsThePhonesLanguage",
                "offPausedAndUnreadyKeepInstagramsLabel[28]", "offPausedAndUnreadyKeepInstagramsLabel"),
            "app.hushgram.extension.instagram.settings.StoryTimeSettingsTest" to listOf(
                "missingPatchHasNoStoryTimeSwitch[28]", "missingPatchHasNoStoryTimeSwitch",
                "storyTimeSwitchStartsOnUnderStoriesPersistsAndHonorsPause[28]", "storyTimeSwitchStartsOnUnderStoriesPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.stories.StoryLoopTest" to listOf(
                "onEveryStoryLoops[28]", "onEveryStoryLoops",
                "offPausedAndUnreadyKeepInstagramsAnswer[28]", "offPausedAndUnreadyKeepInstagramsAnswer",
                "bothOnAStoryThatCanLoopLoops[28]", "bothOnAStoryThatCanLoopLoops",
                "bothOnAStoryThatCantLoopIsStillHeld[28]", "bothOnAStoryThatCantLoopIsStillHeld",
                "stopAloneHoldsEveryStory[28]", "stopAloneHoldsEveryStory",
                "loopAloneLeavesStopOutOfIt[28]", "loopAloneLeavesStopOutOfIt",
                "pausedAndUnreadyHoldNothing[28]", "pausedAndUnreadyHoldNothing",
                "withoutTheLoopPatchStopHoldsAsBefore[28]", "withoutTheLoopPatchStopHoldsAsBefore"),
            "app.hushgram.extension.instagram.settings.StoryLoopSettingsTest" to listOf(
                "missingPatchHasNoStoryLoopSwitch[28]", "missingPatchHasNoStoryLoopSwitch",
                "storyLoopSwitchStartsOnUnderStoriesPersistsAndHonorsPause[28]", "storyLoopSwitchStartsOnUnderStoriesPersistsAndHonorsPause"),
            "app.hushgram.extension.instagram.settings.OverrideNavigationTest" to listOf(
                "missingPatchHasNoNativeAction[28]", "missingPatchHasNoNativeAction",
                "unavailableSessionOrNavigationKeepsTheDialogAndShowsRecovery[28]", "unavailableSessionOrNavigationKeepsTheDialogAndShowsRecovery",
                "successfulNavigationClosesTheDialogWithoutEnablingLongPress[28]", "successfulNavigationClosesTheDialogWithoutEnablingLongPress",
                "finishingDestroyedOrSavedHostsNeverCallNativeNavigation[28]", "finishingDestroyedOrSavedHostsNeverCallNativeNavigation"),
            "app.hushgram.extension.instagram.settings.SettingsDialogBoundaryTest" to listOf(
                "sdk28DialogKeepsLegacyBarsOutsideLargeTextContent", "sdk37DialogKeepsSystemBarsOutsideLargeTextContent",
                "sdk28DialogMirrorsItsLargeTextHeader", "sdk37DialogMirrorsItsLargeTextHeader",
                "diagnosticChooserClosesWithItsSettingsPage[28]", "diagnosticChooserClosesWithItsSettingsPage[29]", "diagnosticChooserClosesWithItsSettingsPage",
                "aLateReportTapCannotOpenAChooserAfterPageTeardown[28]", "aLateReportTapCannotOpenAChooserAfterPageTeardown[29]", "aLateReportTapCannotOpenAChooserAfterPageTeardown"),
            "app.hushgram.extension.instagram.settings.SignInNoticeTest" to listOf(
                "aFailedDismissalKeepsTheNoticeAndExplainsTheFailure[28]", "aFailedDismissalKeepsTheNoticeAndExplainsTheFailure[29]",
                "aFailedDismissalKeepsTheNoticeAndExplainsTheFailure[30]", "aFailedDismissalKeepsTheNoticeAndExplainsTheFailure",
                "aFailedDismissalDoesNotClaimAnUnprovenRollback[28]", "aFailedDismissalDoesNotClaimAnUnprovenRollback[29]",
                "aFailedDismissalDoesNotClaimAnUnprovenRollback[30]", "aFailedDismissalDoesNotClaimAnUnprovenRollback"),
            "app.hushgram.extension.instagram.settings.PauseRecoveryTest" to listOf(
                "aWorkerCommitDisablesBothRecoveryInputsAndIgnoresDuplicateTaps[28]", "aWorkerCommitDisablesBothRecoveryInputsAndIgnoresDuplicateTaps[29]", "aWorkerCommitDisablesBothRecoveryInputsAndIgnoresDuplicateTaps",
                "aFailedCommitKeepsTheSavedPauseAndRestoresTheRetryControls[28]", "aFailedCommitKeepsTheSavedPauseAndRestoresTheRetryControls[29]", "aFailedCommitKeepsTheSavedPauseAndRestoresTheRetryControls",
                "aFailedRollbackShowsThePauseValueThatActuallySurvived[28]", "aFailedRollbackShowsThePauseValueThatActuallySurvived[29]", "aFailedRollbackShowsThePauseValueThatActuallySurvived",
                "aFullWorkerQueueLeavesPauseSavedAndBothControlsReadyToRetry[28]", "aFullWorkerQueueLeavesPauseSavedAndBothControlsReadyToRetry[29]", "aFullWorkerQueueLeavesPauseSavedAndBothControlsReadyToRetry",
                "recoveryFinishesAfterTeardownWithoutUpdatingDetachedControlsOrAcceptingALateTap[28]", "recoveryFinishesAfterTeardownWithoutUpdatingDetachedControlsOrAcceptingALateTap[29]", "recoveryFinishesAfterTeardownWithoutUpdatingDetachedControlsOrAcceptingALateTap"),
            "app.hushgram.extension.instagram.settings.SettingsEntryOpenTest" to listOf(
                "movesToAScreenInstagramOpensOverIt[28]", "movesToAScreenInstagramOpensOverIt",
                "staysClosedOnceThePersonClosedIt[28]", "staysClosedOnceThePersonClosedIt"),
            "app.hushgram.extension.instagram.settings.SettingsScreenRowLayoutTest" to listOf(
                "theTitleWrapsAtTwiceTheTextSize[28]", "theTitleWrapsAtTwiceTheTextSize",
                "rightToLeftPutsTheMarkOnTheRight[28]", "rightToLeftPutsTheMarkOnTheRight"),
            "app.hushgram.extension.shared.settings.HushgramPauseTest" to listOf(
                "android9CountsOnlyTheHandlersMark", "android11CountsCrashesNativeCrashesAndHangsButNotBeingSwipedAway"),
            "app.hushgram.extension.shared.settings.preference.LogBufferManagerExportTest" to listOf(
                "android9SavesTheReportInInstagramsOwnFolder", "noExitOnRecordMeansNoLastExitSection[28]",
                "theReportSaysWhyTheProcessWentAwayLastTime", "repeatedExportsEachGetTheirOwnDownloadsEntry",
                "reportRowAndChooserNameTheFolderThatTheWriterUses[28]", "reportRowAndChooserNameTheFolderThatTheWriterUses[29]", "reportRowAndChooserNameTheFolderThatTheWriterUses"),
            "app.hushgram.extension.instagram.download.MediaSaveTest" to listOf(
                "onAndroid9ASaveWritesTheFileIntoTheFolderItself",
                "onAndroid9OverlappingSavesOwnSeparateWorkFilesAndLedgerRows",
                "onAndroid9ARefusedLedgerRemovesOnlyItsReservedWorkFile",
                "onAndroid9ConcurrentCommitsKeepEveryCompletedFile"),
            "app.hushgram.extension.instagram.download.SaveInterruptionTest" to listOf(
                "sdk28InterruptedSaveRemovesItsHiddenStorageFileBeforeNotice",
                "anInaccessibleAbsentRowRetiresAfterAnExactQuery[30]", "anInaccessibleAbsentRowRetiresAfterAnExactQuery",
                "anInaccessiblePublishedRowIsKeptButItsStaleLedgerRetires[30]", "anInaccessiblePublishedRowIsKeptButItsStaleLedgerRetires",
                "aDeleteExceptionNeverAcknowledgesAStillPendingRow[30]", "aDeleteExceptionNeverAcknowledgesAStillPendingRow",
                "aDeleteExceptionWithUnknownQueryStateKeepsTheRetryRecord[30]", "aDeleteExceptionWithUnknownQueryStateKeepsTheRetryRecord"),
            "app.hushgram.extension.instagram.settings.SettingsSearchTest" to listOf(
                "clearingRestoresTheOriginalObjectsOrderAndChoices[28]", "clearingRestoresTheOriginalObjectsOrderAndChoices",
                "hiddenRowsStillSynchronizeStoredChangesAndParentAvailability[28]", "hiddenRowsStillSynchronizeStoredChangesAndParentAvailability",
                "noMatchIsLocalizedWhilePauseAndRecoveryStayReachable[28]", "noMatchIsLocalizedWhilePauseAndRecoveryStayReachable",
                "typingAndClearUseTheInlineAccessibleControls[28]", "typingAndClearUseTheInlineAccessibleControls",
                "frameworkStateDoesNotRetainTheSearchQuery[28]", "frameworkStateDoesNotRetainTheSearchQuery",
                "theLiveInlineControlsFitAndMirrorAtTwiceTheTextSize[28]", "theLiveInlineControlsFitAndMirrorAtTwiceTheTextSize",
                "aSaveStartedDuringFilteringKeepsOneWorkingCancelRow[28]", "aSaveStartedDuringFilteringKeepsOneWorkingCancelRow",
                "aCarouselKeepsItsCancelIdentityAcrossFilteredPageChanges[28]", "aCarouselKeepsItsCancelIdentityAcrossFilteredPageChanges",
                "aCompleteCarouselOutcomeSurvivesFilteringAndReopeningSettings[28]", "aCompleteCarouselOutcomeSurvivesFilteringAndReopeningSettings",
                "aCancelledCarouselShowsEveryCountAndQualityWarningAtLargeText[28]", "aCancelledCarouselShowsEveryCountAndQualityWarningAtLargeText"),
            "app.hushgram.extension.instagram.download.CarouselSaveTest" to listOf(
                "aMixedBatchPreservesOrderSnapshotsAndQuality", "failedAndDisabledPagesHaveExactCountsAndNoRetry",
                "tooManyPagesAreRejectedAndTheExactLimitIsAccepted", "oneCancelStopsTheTransferAndAllRemainingPages",
                "cancelBeforeCommitRemovesThePendingRowAndKeepsEarlierFiles", "aBatchUsesOneSlotAndNeverQueuesPastTheExistingLimit",
                "currentPageDownloadAndSaveAllReadDifferentSnapshots", "theSeparateMenuActionUsesItsLabelAndKeepsNativeOptionsIntact",
                "exhaustedPreferenceRetirementDoesNotTurnTheBatchIntoAnInterruption", "cancellationSurvivesExhaustedPreferenceRetirementToo",
                "completeCountsArePublishedBeforeTheRowEndsAndRefusedStartsKeepThem",
                "theSameNotificationCancelSurvivesEveryPageAndPhase[28]", "theSameNotificationCancelSurvivesEveryPageAndPhase"),
            "app.hushgram.extension.instagram.download.SaveProgressTest" to listOf(
                "aSaveShowsItsProgressAtOnceAndCancelStopsIt[28]", "aSaveShowsItsProgressAtOnceAndCancelStopsIt",
                "belowAndroid13TheCancelReceiverIsRegisteredWithNoFlag", "onAndroid17TheCancelReceiverIsNotExported",
                "aFinishedSaveTakesItsNotificationAwayAndLeavesNoRowPending", "startingInstagramRemovesWhatAStoppedSaveLeft",
                "aPendingRowSweepRetriesAfterTheGalleryThrows"),
            "app.hushgram.extension.instagram.misc.InstagramSignatureTest" to listOf(
                "thisAppStillGetsInstagramsTwoCertificates[28]", "thisAppStillGetsInstagramsTwoCertificates",
                "aRecordThatOnlyNamesThisAppSeedsNoSigners[28]", "aRecordThatOnlyNamesThisAppSeedsNoSigners",
                "aSameKeyThreadsGetsThreadsMetaCertificate[28]", "aSameKeyThreadsGetsThreadsMetaCertificate",
                "aSameKeyFacebookOrMessengerGetsFacebooksMetaCertificate[28]", "aSameKeyFacebookOrMessengerGetsFacebooksMetaCertificate",
                "ownSignersAreReadFromPackageManagerWhenNotSeenYet[28]", "ownSignersAreReadFromPackageManagerWhenNotSeenYet",
                "aMissingSigningInfoIsReadAgainFromPackageManager[28]", "aMissingSigningInfoIsReadAgainFromPackageManager",
                "anOldSignaturesEntryDoesNotOutlastARotation[28]", "anOldSignaturesEntryDoesNotOutlastARotation",
                "aMissingSigningInfoThatCantBeReadAgainGivesNoTrust[28]", "aMissingSigningInfoThatCantBeReadAgainGivesNoTrust",
                "aRotatedFamilyAppIsJudgedByItsCurrentSigner[28]", "aRotatedFamilyAppIsJudgedByItsCurrentSigner",
                "severalSignersHaveToMatchExactly[28]", "severalSignersHaveToMatchExactly",
                "aFamilyAppWithAnotherKeyIsLeftToInstagram[28]", "aFamilyAppWithAnotherKeyIsLeftToInstagram",
                "anyOtherPackageIsLeftToInstagram[28]", "anyOtherPackageIsLeftToInstagram",
                "aMetaSignedBuildLeavesFamilyAppsToInstagram[28]", "aMetaSignedBuildLeavesFamilyAppsToInstagram",
                "unknownOwnSignersGiveNoTrust[28]", "unknownOwnSignersGiveNoTrust",
                "aThrowingSignerIsReportedAndLeftToInstagram[28]", "aThrowingSignerIsReportedAndLeftToInstagram",
                "aThrowingPackageManagerIsReportedAndLeftToInstagram[28]", "aThrowingPackageManagerIsReportedAndLeftToInstagram")
        )
        val factory = javax.xml.parsers.DocumentBuilderFactory.newInstance()
        factory.setFeature(javax.xml.XMLConstants.FEATURE_SECURE_PROCESSING, true)
        factory.setAttribute(javax.xml.XMLConstants.ACCESS_EXTERNAL_DTD, "")
        factory.setAttribute(javax.xml.XMLConstants.ACCESS_EXTERNAL_SCHEMA, "")
        for ((suiteName, names) in required) {
            val file = results.get().file("TEST-$suiteName.xml").asFile
            if (!file.isFile) throw GradleException("Missing Android boundary results: $suiteName. Run the unfiltered tests.")
            val suite = factory.newDocumentBuilder().parse(file).documentElement
            for (attribute in listOf("failures", "errors", "skipped")) {
                if (suite.getAttribute(attribute).toIntOrNull() != 0) {
                    throw GradleException("Android boundary suite $suiteName has $attribute=${suite.getAttribute(attribute)}.")
                }
            }
            val cases = suite.getElementsByTagName("testcase")
            for (name in names) {
                val matching = (0 until cases.length).map { cases.item(it) as org.w3c.dom.Element }
                    .filter { it.getAttribute("name") == name }
                if (matching.size != 1 || listOf("failure", "error", "skipped").any {
                        matching.singleOrNull()?.getElementsByTagName(it)?.length != 0
                    }) throw GradleException("Android boundary case did not pass exactly once: $suiteName.$name")
            }
        }
        logger.lifecycle("Verified Android API 28/29/37 boundary cases with the Instagram 449 target SDK (36).")
    }
}

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(libs.annotation)
    testImplementation(project(":extensions:shared:library"))
    compileOnly(libs.kotlin.stdlib)
    testImplementation(libs.kotlin.stdlib)
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.17")
}

extension {
    name = "extensions/instagram.mpe"
}

android {
    namespace = "app.hushgram.extension.instagram"

    defaultConfig {
        // Instagram 449 declares minSdk 28, so nothing below it can run this code.
        minSdk = 28
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    // The payload runs inside Instagram. javac and Robolectric run on a modern JDK, so a call above
    // Instagram's floor is green all the way to a phone, where it throws. NewApi reads the SDK_INT
    // guards; ObsoleteSdkInt catches a guard at or below the floor.
    lint {
        checkOnly += "NewApi"
        error += "NewApi"
        checkOnly += "ObsoleteSdkInt"
        error += "ObsoleteSdkInt"
        abortOnError = true
    }
    testOptions {
        unitTests.isIncludeAndroidResources = true
        unitTests.all {
            it.maxHeapSize = "1g"
            // LicenseNoticeTest holds NOTICE against the copy generated into the payload, and
            // NOTICE is outside this module, so without this Gradle calls the task up to date
            // after NOTICE changes and the comparison never runs.
            it.inputs.file(rootProject.layout.projectDirectory.file("NOTICE"))
                .withPropertyName("licenseNotice")
                .withPathSensitivity(PathSensitivity.RELATIVE)
            // PatchStatusWiringTest reads each patch's enableStatus call from the patch sources, so
            // a patch-only change (a misspelled status name) has to rerun these tests too.
            it.inputs.dir(rootProject.layout.projectDirectory.dir("patches/src/main/kotlin"))
                .withPropertyName("patchSources")
                .withPathSensitivity(PathSensitivity.RELATIVE)
            it.jvmArgs(
                "--add-opens=java.base/java.lang=ALL-UNNAMED",
                "--add-opens=java.base/java.util=ALL-UNNAMED",
                "--add-opens=java.base/java.io=ALL-UNNAMED",
                "--add-opens=java.base/java.net=ALL-UNNAMED",
                "--add-opens=java.base/java.security=ALL-UNNAMED",
                "--add-opens=java.base/java.text=ALL-UNNAMED",
                // Robolectric's FileDescriptor interceptor reaches the fd through SharedSecrets.
                "--add-opens=java.base/jdk.internal.access=ALL-UNNAMED",
                "--add-opens=java.desktop/java.awt.font=ALL-UNNAMED",
                "--add-opens=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
            )
        }
    }
}
