package app.xposed.patches.twitter.badges

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.matchSingle
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import app.xposed.patches.twitter.Constants.MODEL_BRIDGE_CLASS
import app.xposed.patches.twitter.util.argumentRegisters
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.field
import app.xposed.patches.twitter.util.fieldRef
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.stringRef
import app.xposed.patches.twitter.util.toStringFields
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val RETURNS = setOf(Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)

/**
 * Writes ModelBridge, which reads X's models for the filters, and hooks the constructors of
 * CanonicalPost and ProfileUser, which carry the post language and the profile details that
 * timeline users lack. Everything is found from toString() labels and checked by type.
 */
internal fun BytecodePatchContext.writeModelBridge(user: UserModel, availablePost: ClassDef, postFields: Map<String, FieldReference>) {
    // User interface accessors, found through the getters MinimalUser implements them with.
    val minimal = MinimalUserToStringFingerprint.matchSingle()
    val minimalClass = minimal.originalClassDef
    if (user.type !in minimalClass.interfaces) throw PatchException("MinimalUser does not implement ${user.type}")
    val minimalFields = toStringFields(minimal.originalMethod)
    fun accessor(label: String, type: String? = null): MethodReference {
        val field = minimalFields.field("MinimalUser", label, type)
        return interfaceAccessor(user.type, minimalClass, field)
    }
    val name = accessor("name", STRING)
    val bio = accessor("profileDescription", STRING)
    val verifiedType = accessor("verifiedType")
    val userLabel = accessor("userLabel")
    val entities = accessor("entities")
    val counts = accessor("relationshipCounts")
    val pcf = accessor("parodyCommentaryFanLabel")
    val friendship = accessor("friendship")
    // For the account sheet.
    val avatar = accessor("profileImageUrl", STRING)
    val avatarShape = accessor("profileImageShape")
    val isProtected = accessor("isProtected", "Z")
    val createdAt = accessor("createdAt")

    val verification = enumConstants(verifiedType.returnType, "Government", "Business", "User", "NotVerified")
    val labels = enumConstants(pcf.returnType, "Parody", "Commentary", "Fan")
    val square = enumConstants(avatarShape.returnType, "Square").getValue("Square")

    val countFields = toStringFields(RelationshipCountsToStringFingerprint.matchSingle().originalMethod)
    val following = countFields.field("RelationshipCounts", "following", "J")
    val followers = countFields.field("RelationshipCounts", "followers", "J")
    requireDefinedIn(following, counts.returnType)
    requireDefinedIn(followers, counts.returnType)
    val labelFields = toStringFields(UserLabelToStringFingerprint.matchSingle().originalMethod)
    val labelDescription = labelFields.field("UserLabel", "description", STRING)
    val labelBadge = labelFields.field("UserLabel", "badgeImageUrl", STRING)
    val labelLink = labelFields.field("UserLabel", "onClickOpenUrl")
    requireDefinedIn(labelDescription, userLabel.returnType)
    requireDefinedIn(labelBadge, userLabel.returnType)
    requireDefinedIn(labelLink, userLabel.returnType)
    // What a label opens: web pages and deep links carry a plain URL; X's own screens don't.
    val linkUrls = listOf(ExternalUrlToStringFingerprint to "ExternalUrl", DeeplinkToStringFingerprint to "Deeplink").map { (fingerprint, label) ->
        val match = fingerprint.matchSingle()
        if (match.originalClassDef.superclass != labelLink.type) throw PatchException("$label isn't a ${labelLink.type}")
        toStringFields(match.originalMethod).field(label, "url", STRING)
    }
    val (instantSeconds, instantNanos) = instantFields(createdAt.returnType)
    val urls = toStringFields(PostEntityListToStringFingerprint.matchSingle().originalMethod)
        .field("PostEntityList", "urls", "Ljava/util/List;")
    requireDefinedIn(urls, entities.returnType)
    val urlEntity = UrlEntityToStringFingerprint.matchSingle()
    val expandedUrl = toStringFields(urlEntity.originalMethod).field("UrlEntity", "expandedUrl", STRING)
    // "isFollowedByMe": the signed-in account follows this one (relationship_perspectives.following).
    val followedByMe = toStringFields(FriendshipToStringFingerprint.matchSingle().originalMethod)
        .field("Friendship", "isFollowedByMe", "Z")
    requireDefinedIn(followedByMe, friendship.returnType)

    val profile = ProfileUserToStringFingerprint.matchSingle()
    val profileClass = profile.originalClassDef.type
    if (user.type !in profile.originalClassDef.interfaces) throw PatchException("ProfileUser does not implement ${user.type}")
    val profileFields = toStringFields(profile.originalMethod)
    val location = profileFields.field("ProfileUser", "location", STRING)
    val website = profileFields.field("ProfileUser", "website", urlEntity.originalClassDef.type)
    val tweetCounts = profileFields.field("ProfileUser", "tweetCounts", "Ljava/lang/Long;")

    val postId = postFields.field("AvailablePost", "postId")
    val viewer = postFields.field("AvailablePost", "currentUserIdentifier", user.getId.returnType)
    val postAuthor = postFields.field("AvailablePost", "author", user.type)
    // The quoted post's item: an AvailablePost, or an UnavailablePost without an author.
    val quotePostState = postFields.field("AvailablePost", "quotePostState")
    if (quotePostState.type !in availablePost.interfaces) throw PatchException("quotePostState isn't a post item")
    val postIdValue = instanceField(postId.type, "long id field of ${postId.type}") { it.type == "J" }

    // Relations X-Posed follows to hide replies and quotes of filtered posts.
    val canonical = CanonicalPostToStringFingerprint.matchSingle()
    val canonicalClass = canonical.originalClassDef.type
    val canonicalFields = toStringFields(canonical.originalMethod)
    val canonicalId = canonicalFields.field("CanonicalPost", "id", postId.type)
    val language = canonicalFields.field("CanonicalPost", "language", STRING)
    val canonicalAuthor = canonicalFields.field("CanonicalPost", "author")
    if (canonicalAuthor.type != user.type && user.type !in classDefBy(canonicalAuthor.type).interfaces) {
        throw PatchException("CanonicalPost.author isn't a ${user.type}")
    }
    val repliedPostId = canonicalFields.field("CanonicalPost", "repliedPostId", "Ljava/lang/Long;")
    val repliedToHandle = canonicalFields.field("CanonicalPost", "repliedToUserScreenName", STRING)
    val quotedStatusId = canonicalFields.field("CanonicalPost", "quotedStatusId", postId.type)

    // The post card: times, the text as X shows it, photos and action counts.
    val instant = instantSeconds.definingClass
    val postTime = postFields.field("AvailablePost", "timestamp", instant)
    val canonicalTime = canonicalFields.field("CanonicalPost", "timestamp", instant)
    val text = canonicalFields.field("CanonicalPost", "text", STRING)
    val textRange = canonicalFields.field("CanonicalPost", "displayTextRange")
    val rangeFields = toStringFields(DisplayTextRangeToStringFingerprint.matchSingle().originalMethod)
    val rangeStart = rangeFields.field("DisplayTextRange", "startIdx", "I")
    val rangeEnd = rangeFields.field("DisplayTextRange", "endIdx", "I")
    requireDefinedIn(rangeStart, textRange.type)
    requireDefinedIn(rangeEnd, textRange.type)
    val postEntities = canonicalFields.field("CanonicalPost", "entityList")
    requireDefinedIn(urls, postEntities.type)
    val shortUrl = toStringFields(urlEntity.originalMethod).field("UrlEntity", "url", STRING)
    val media = canonicalFields.field("CanonicalPost", "media")
    val image = MediaContentImageToStringFingerprint.matchSingle()
    val imageClass = image.originalClassDef.type
    val imageFields = toStringFields(image.originalMethod)
    val imageUrl = imageFields.field("MediaContentImage", "imageUrl", STRING)
    val imageWidth = imageFields.field("MediaContentImage", "originalImgWidth", "J")
    val imageHeight = imageFields.field("MediaContentImage", "originalImgHeight", "J")
    val sensitiveWarning = imageFields.field("MediaContentImage", "sensitiveMediaWarning")
    val actions = canonicalFields.field("CanonicalPost", "inlineActionEntry")
    val entry = InlineActionEntryToStringFingerprint.matchSingle()
    val entryClass = entry.originalClassDef.type
    val entryFields = toStringFields(entry.originalMethod)
    val actionType = entryFields.field("InlineActionEntry", "actionType")
    val countedActions = enumConstants(actionType.type, "Reply", "Retweet", "UndoRetweet", "Favorite", "Unfavorite", "ViewCount")
    val actionCount = entryFields.field("InlineActionEntry", "count", "Ljava/lang/Long;")
    listOf(media, actions).forEach { list ->
        if ("Ljava/util/List;" !in classDefBy(list.type).interfaces) throw PatchException("CanonicalPost.${list.name} isn't a List")
    }
    listOf(imageUrl, imageWidth, imageHeight, sensitiveWarning).forEach { requireDefinedIn(it, imageClass) }
    listOf(actionType, actionCount).forEach { requireDefinedIn(it, entryClass) }

    requirePublic(
        name, bio, verifiedType, userLabel, entities, counts, pcf, friendship, following, labelDescription, urls,
        expandedUrl, followedByMe, location, website, tweetCounts, postId, viewer, postAuthor, quotePostState, postIdValue,
        canonicalId, language, canonicalAuthor, repliedPostId, repliedToHandle, quotedStatusId,
        avatar, avatarShape, isProtected, createdAt, square, followers, labelBadge, labelLink, *linkUrls.toTypedArray(),
        instantSeconds, instantNanos,
        *verification.values.toTypedArray(), *labels.values.toTypedArray(),
        postTime, canonicalTime, text, textRange, rangeStart, rangeEnd, postEntities, shortUrl, media, imageClass,
        imageUrl, imageWidth, imageHeight, sensitiveWarning, actions, entryClass, actionType, actionCount,
        *countedActions.values.toTypedArray(),
    )

    fun stub(name: String, locals: Int, smali: String) = replaceStub(MODEL_BRIDGE_CLASS, name, locals, smali)
    fun userCall(accessor: MethodReference) = "check-cast p0, ${user.type}\ninvoke-interface { p0 }, ${accessor.descriptor}"

    stub("screenName", 1, "${userCall(user.screenName)}\nmove-result-object v0\nreturn-object v0")
    stub(
        "userId", 2,
        """
        ${userCall(user.getId)}
        move-result-object v0
        if-eqz v0, :unknown
        iget-wide v0, v0, ${user.idValue.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    stub("displayName", 1, "${userCall(name)}\nmove-result-object v0\nreturn-object v0")
    stub("bio", 1, "${userCall(bio)}\nmove-result-object v0\nreturn-object v0")
    stub(
        "label", 2,
        """
        ${userCall(pcf)}
        move-result-object v0
        sget-object v1, ${labels.getValue("Parody").descriptor}
        if-ne v0, v1, :not_parody
        const-string v0, "parody"
        return-object v0
        :not_parody
        sget-object v1, ${labels.getValue("Commentary").descriptor}
        if-ne v0, v1, :not_commentary
        const-string v0, "commentary"
        return-object v0
        :not_commentary
        sget-object v1, ${labels.getValue("Fan").descriptor}
        if-ne v0, v1, :none
        const-string v0, "fan"
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "following", 2,
        """
        ${userCall(counts)}
        move-result-object v0
        if-eqz v0, :unknown
        iget-wide v0, v0, ${following.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, -0x1
        return-wide v0
        """,
    )
    stub(
        "followedByMe", 1,
        """
        ${userCall(friendship)}
        move-result-object v0
        if-eqz v0, :unknown
        iget-boolean v0, v0, ${followedByMe.descriptor}
        return v0
        :unknown
        const/4 v0, 0x0
        return v0
        """,
    )
    // Each path returns its own register: ART types a register merged from the label and its
    // String field as Object, and rejects the whole bridge class for returning that as String.
    stub(
        "affiliation", 1,
        """
        ${userCall(userLabel)}
        move-result-object v0
        if-eqz v0, :none
        iget-object v0, v0, ${labelDescription.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "bioLinks", 1,
        """
        ${userCall(entities)}
        move-result-object v0
        if-eqz v0, :none
        iget-object v0, v0, ${urls.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    // The account sheet: header, activity counts and account age.
    stub("avatarUrl", 1, "${userCall(avatar)}\nmove-result-object v0\nreturn-object v0")
    stub(
        "squareAvatar", 2,
        """
        ${userCall(avatarShape)}
        move-result-object v0
        sget-object v1, ${square.descriptor}
        if-ne v0, v1, :circle
        const/4 v0, 0x1
        return v0
        :circle
        const/4 v0, 0x0
        return v0
        """,
    )
    // Codes of ModelBridge.verification: X's blue (User), gold (Business) and grey (Government) checks.
    stub(
        "verification", 2,
        """
        ${userCall(verifiedType)}
        move-result-object v0
        sget-object v1, ${verification.getValue("User").descriptor}
        if-ne v0, v1, :not_blue
        const/4 v0, 0x1
        return v0
        :not_blue
        sget-object v1, ${verification.getValue("Business").descriptor}
        if-ne v0, v1, :not_business
        const/4 v0, 0x2
        return v0
        :not_business
        sget-object v1, ${verification.getValue("Government").descriptor}
        if-ne v0, v1, :not_government
        const/4 v0, 0x3
        return v0
        :not_government
        if-eqz v0, :none
        sget-object v1, ${verification.getValue("NotVerified").descriptor}
        if-eq v0, v1, :none
        const/4 v0, 0x4
        return v0
        :none
        const/4 v0, 0x0
        return v0
        """,
    )
    stub("isProtected", 1, "${userCall(isProtected)}\nmove-result v0\nreturn v0")
    stub("createdAt", 1, "${userCall(createdAt)}\nmove-result-object v0\nreturn-object v0")
    stub(
        "instantMillis", 6,
        """
        if-eqz p0, :unknown
        check-cast p0, ${instantSeconds.definingClass}
        iget-wide v0, p0, ${instantSeconds.descriptor}
        const-wide/16 v2, 0x3e8
        mul-long/2addr v0, v2
        iget v2, p0, ${instantNanos.descriptor}
        const v3, 0xf4240
        div-int/2addr v2, v3
        int-to-long v4, v2
        add-long/2addr v0, v4
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    stub(
        "followers", 2,
        """
        ${userCall(counts)}
        move-result-object v0
        if-eqz v0, :unknown
        iget-wide v0, v0, ${followers.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, -0x1
        return-wide v0
        """,
    )
    stub(
        "labelBadgeUrl", 1,
        """
        ${userCall(userLabel)}
        move-result-object v0
        if-eqz v0, :none
        iget-object v0, v0, ${labelBadge.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "labelUrl", 2,
        buildString {
            appendLine(userCall(userLabel))
            appendLine("move-result-object v0")
            appendLine("if-eqz v0, :none")
            appendLine("iget-object v0, v0, ${labelLink.descriptor}")
            linkUrls.forEachIndexed { i, url ->
                appendLine("instance-of v1, v0, ${url.definingClass}")
                appendLine("if-eqz v1, :not_$i")
                appendLine("check-cast v0, ${url.definingClass}")
                appendLine("iget-object v0, v0, ${url.descriptor}")
                appendLine("return-object v0")
                appendLine(":not_$i")
            }
            appendLine(":none")
            appendLine("const/4 v0, 0x0")
            appendLine("return-object v0")
        },
    )
    val urlEntityClass = urlEntity.originalClassDef.type
    stub(
        "expandedUrl", 1,
        """
        instance-of v0, p0, $urlEntityClass
        if-eqz v0, :none
        check-cast p0, $urlEntityClass
        iget-object v0, p0, ${expandedUrl.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "profileLocation", 1,
        """
        instance-of v0, p0, $profileClass
        if-eqz v0, :none
        check-cast p0, $profileClass
        iget-object v0, p0, ${location.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "website", 1,
        """
        instance-of v0, p0, $profileClass
        if-eqz v0, :none
        check-cast p0, $profileClass
        iget-object v0, p0, ${website.descriptor}
        if-eqz v0, :none
        iget-object v0, v0, ${expandedUrl.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "postCount", 2,
        """
        instance-of v0, p0, $profileClass
        if-eqz v0, :unknown
        check-cast p0, $profileClass
        iget-object v0, p0, ${tweetCounts.descriptor}
        if-eqz v0, :unknown
        invoke-virtual { v0 }, Ljava/lang/Long;->longValue()J
        move-result-wide v0
        return-wide v0
        :unknown
        const-wide/16 v0, -0x1
        return-wide v0
        """,
    )
    fun idStub(name: String, owner: String, field: FieldReference, value: FieldReference) = stub(
        name, 2,
        """
        check-cast p0, $owner
        iget-object v0, p0, ${field.descriptor}
        if-eqz v0, :unknown
        iget-wide v0, v0, ${value.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    idStub("postId", availablePost.type, postId, postIdValue)
    idStub("viewerId", availablePost.type, viewer, user.idValue)
    idStub("canonicalPostId", canonicalClass, canonicalId, postIdValue)
    idStub("quotedPostId", canonicalClass, quotedStatusId, postIdValue)
    fun fieldStub(name: String, owner: String, field: FieldReference) = stub(
        name, 1,
        """
        check-cast p0, $owner
        iget-object v0, p0, ${field.descriptor}
        return-object v0
        """,
    )
    fieldStub("language", canonicalClass, language)
    fieldStub("canonicalAuthor", canonicalClass, canonicalAuthor)
    fieldStub("repliedToHandle", canonicalClass, repliedToHandle)
    fieldStub("postAuthor", availablePost.type, postAuthor)
    stub(
        "repliedPostId", 2,
        """
        check-cast p0, $canonicalClass
        iget-object v0, p0, ${repliedPostId.descriptor}
        if-eqz v0, :unknown
        invoke-virtual { v0 }, Ljava/lang/Long;->longValue()J
        move-result-wide v0
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    stub(
        "quotedPost", 1,
        """
        check-cast p0, ${availablePost.type}
        iget-object v0, p0, ${quotePostState.descriptor}
        instance-of p0, v0, ${availablePost.type}
        if-nez p0, :available
        const/4 v0, 0x0
        :available
        return-object v0
        """,
    )

    fieldStub("postTime", availablePost.type, postTime)
    fieldStub("canonicalTime", canonicalClass, canonicalTime)
    fieldStub("postText", canonicalClass, text)
    fieldStub("postMedia", canonicalClass, media)
    fieldStub("postActions", canonicalClass, actions)
    fun rangeStub(name: String, bound: FieldReference) = stub(
        name, 1,
        """
        check-cast p0, $canonicalClass
        iget-object v0, p0, ${textRange.descriptor}
        if-eqz v0, :none
        iget v0, v0, ${bound.descriptor}
        return v0
        :none
        const/4 v0, -0x1
        return v0
        """,
    )
    rangeStub("textStart", rangeStart)
    rangeStub("textEnd", rangeEnd)
    stub(
        "postLinks", 1,
        """
        check-cast p0, $canonicalClass
        iget-object v0, p0, ${postEntities.descriptor}
        if-eqz v0, :none
        iget-object v0, v0, ${urls.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "linkUrl", 1,
        """
        instance-of v0, p0, $urlEntityClass
        if-eqz v0, :none
        check-cast p0, $urlEntityClass
        iget-object v0, p0, ${shortUrl.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "photoUrl", 1,
        """
        instance-of v0, p0, $imageClass
        if-eqz v0, :none
        check-cast p0, $imageClass
        iget-object v0, p0, ${imageUrl.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    fun sizeStub(name: String, field: FieldReference) = stub(
        name, 2,
        """
        instance-of v0, p0, $imageClass
        if-eqz v0, :unknown
        check-cast p0, $imageClass
        iget-wide v0, p0, ${field.descriptor}
        return-wide v0
        :unknown
        const-wide/16 v0, 0x0
        return-wide v0
        """,
    )
    sizeStub("photoWidth", imageWidth)
    sizeStub("photoHeight", imageHeight)
    stub(
        "photoSensitive", 1,
        """
        instance-of v0, p0, $imageClass
        if-eqz v0, :no
        check-cast p0, $imageClass
        iget-object v0, p0, ${sensitiveWarning.descriptor}
        if-eqz v0, :no
        const/4 v0, 0x1
        return v0
        :no
        const/4 v0, 0x0
        return v0
        """,
    )
    stub(
        "actionName", 2,
        """
        instance-of v0, p0, $entryClass
        if-eqz v0, :none
        check-cast p0, $entryClass
        iget-object v0, p0, ${actionType.descriptor}
        ${countedActions.entries.joinToString("\n") { (name, constant) ->
            """
            sget-object v1, ${constant.descriptor}
            if-ne v0, v1, :not_$name
            const-string v0, "$name"
            return-object v0
            :not_$name
            """
        }}
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "actionCount", 2,
        """
        instance-of v0, p0, $entryClass
        if-eqz v0, :unknown
        check-cast p0, $entryClass
        iget-object v0, p0, ${actionCount.descriptor}
        if-eqz v0, :unknown
        invoke-virtual { v0 }, Ljava/lang/Long;->longValue()J
        move-result-wide v0
        return-wide v0
        :unknown
        const-wide/16 v0, -0x1
        return-wide v0
        """,
    )
    writeQuoteArgs(postId.type)
    hookConstructors(canonicalClass, "onCanonicalPost")
    hookConstructors(profileClass, "onProfileUser")
}

/** Calls Hooks.[hook](this) at the end of every constructor of [type]. */
private fun BytecodePatchContext.hookConstructors(type: String, hook: String) {
    val constructors = mutableClassDefBy(type).methods.filter { it.name == "<init>" }
    if (constructors.isEmpty()) throw PatchException("$type has no constructor")
    constructors.forEach { constructor ->
        constructor.instructionList
            .mapIndexedNotNull { i, instruction -> i.takeIf { instruction.opcode == Opcode.RETURN_VOID } }
            .reversed()
            .forEach { constructor.addInstructions(it, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->$hook(Ljava/lang/Object;)V") }
    }
}

/**
 * The method of interface [interfaceType] that [implementation] answers by returning [field].
 * R8 keeps interface methods callable by name, so the extension calls them with invoke-interface.
 */
private fun BytecodePatchContext.interfaceAccessor(interfaceType: String, implementation: ClassDef, field: FieldReference): MethodReference {
    val declared = classDefBy(interfaceType).methods.filter { it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val getter = implementation.methods.filter { method ->
        val instructions = method.instructionList
        method.parameterTypes.isEmpty() && instructions.size == 2 && instructions[1].opcode in RETURNS &&
            instructions[0].fieldRef?.descriptor == field.descriptor &&
            (instructions[0] as TwoRegisterInstruction).registerB == method.implementation!!.registerCount - 1 &&
            declared.any { it.name == method.name && it.returnType == method.returnType }
    }.single("getter of ${field.descriptor} declared by $interfaceType")
    return declared.first { it.name == getter.name && it.returnType == getter.returnType }
}

/** The static fields holding the constants [names] of enum [type], read from its static initializer. */
internal fun BytecodePatchContext.enumConstants(type: String, vararg names: String): Map<String, FieldReference> {
    val classDef = classDefBy(type)
    if (!AccessFlags.ENUM.isSet(classDef.accessFlags)) throw PatchException("$type is not an enum")
    val initializer: Method = classDef.methods.firstOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$type has no static initializer")
    val strings = mutableMapOf<Int, String>()
    val created = mutableMapOf<Int, String>()
    val constants = mutableMapOf<String, FieldReference>()
    initializer.instructionList.forEach { instruction ->
        when (instruction.opcode) {
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO ->
                strings[(instruction as OneRegisterInstruction).registerA] = instruction.stringRef!!

            Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> {
                val reference = instruction.methodRef!!
                if (reference.definingClass == type && reference.name == "<init>" && reference.parameterTypes.firstOrNull()?.toString() == STRING) {
                    val registers = instruction.argumentRegisters()
                    strings.remove(registers[1])?.let { created[registers[0]] = it }
                }
            }

            Opcode.SPUT_OBJECT -> {
                val field = instruction.fieldRef!!
                val register = (instruction as OneRegisterInstruction).registerA
                if (field.definingClass == type && field.type == type) created.remove(register)?.let { constants.putIfAbsent(it, field) }
            }

            else -> {}
        }
    }
    val wanted = names.associateWith { constants[it] ?: throw PatchException("$type has no constant $it (has ${constants.keys})") }
    if (wanted.values.map { it.name }.toSet().size != wanted.size) throw PatchException("$type constants $names share a field")
    return wanted
}

private fun requireDefinedIn(field: FieldReference, type: String) {
    if (field.definingClass != type) throw PatchException("${field.descriptor} is not a field of $type")
}

/** The epoch seconds (long) and nanoseconds (int) of kotlin.time.Instant, [type]. */
private fun BytecodePatchContext.instantFields(type: String): Pair<FieldReference, FieldReference> {
    val fields = classDefBy(type).fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    return fields.filter { it.type == "J" }.single("long field of $type") to fields.filter { it.type == "I" }.single("int field of $type")
}
