import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class VerifyExtensionsDexTest {
    static final String MENUS = VerifyExtensionsDex.MENU_BRIDGE;
    static final String CHIPS = VerifyExtensionsDex.CHIP_BRIDGE;
    static final String SHUFFLE = VerifyExtensionsDex.NOW_PLAYING_SHUFFLE;
    static final String PROVIDER = VerifyExtensionsDex.PLAYLIST_MENU_PROVIDER;
    static final List<String> LIST_MENU = List.of("Lp/y3w0;", "Lp/vz1;", "Ljava/util/List;", "Ljava/util/List;", "Lp/a94;");
    static final String FILTERS = VerifyExtensionsDex.HIDE_PODCASTS;
    static final String OBJECT = "Ljava/lang/Object;", LIST = "Ljava/util/List;", ARRAY_LIST = "Ljava/util/ArrayList;";
    static final String CHIP_BUILDER = "Lp/k770;";

    enum Change {
        NONE, NO_HOOKS, MISSING_HOOK, SECOND_HOOK, WRONG_CALLER, WRONG_REGISTER, BEFORE_SCHEDULING, PRIVATE_TARGET,
        MISSING_TRACK_HOOK, TRACK_PASSES_ANOTHER_ROW, TRACK_RESULT_DROPPED, TRACK_AFTER_MODEL, TRACK_BEFORE_FREEZE,
        TRACK_AFTER_ANOTHER_LIST, TRACK_BEFORE_ANOTHER_MODEL, TRACK_IN_ANOTHER_CLASS, ARTIST_WITHOUT_ITS_ROW,
        ARTIST_FROM_ANOTHER_ROW, ARTIST_IN_TRACK_MENU, MISSING_MENU_TARGET, PRIVATE_TRACK_TARGET, CAPABILITY_OFF,
        CAPABILITY_ON, MISSING_CHIPS_HOOK, CHIPS_IN_ANOTHER_CLASS, CHIPS_PASS_ANOTHER_REGISTER, CHIPS_RESULT_DROPPED,
        CHIPS_BEFORE_THE_REWRITE, CHIPS_AFTER_THE_COPY, MISSING_TAP_HOOK, TAP_IN_ANOTHER_CLASS,
        TAP_PASSES_ANOTHER_REGISTER, TAP_ANSWER_IGNORED, TAP_SKIPS_ELSEWHERE, TAP_AFTER_THE_SEND,
        TAP_BEFORE_THE_EVENT, MISSING_CHIP_TARGET, PRIVATE_TAP_TARGET, CHIPS_AFTER_ANOTHER_CALL,
        CHIPS_BEFORE_ANOTHER_COPY, TAP_AFTER_ANOTHER_EVENT, TAP_BRANCHES_ON_ANOTHER_REGISTER, TAP_BEFORE_SOMETHING_ELSE,
        MISSING_SHUFFLE_HOOK, SHUFFLE_IN_ANOTHER_CLASS, SHUFFLE_IN_ANOTHER_METHOD, SHUFFLE_PASSES_ANOTHER_REGISTER,
        SHUFFLE_BEFORE_THE_STORE, SHUFFLE_AFTER_ANOTHER_FIELD, SHUFFLE_AFTER_ANOTHER_REGISTERS_STORE,
        SHUFFLE_BEFORE_SOMETHING_ELSE, MISSING_SHUFFLE_TARGET, PRIVATE_SHUFFLE_TARGET,
        MISSING_PROVIDERS_HOOK, PROVIDERS_IN_ANOTHER_CLASS, PROVIDERS_IN_ANOTHER_METHOD, PROVIDERS_PASS_ANOTHER_REGISTER,
        PROVIDERS_RESULT_DROPPED, PROVIDERS_AFTER_THE_STORE, PROVIDERS_BEFORE_ANOTHER_STORE, PROVIDERS_STORED_ELSEWHERE,
        MISSING_PROVIDERS_TARGET, PRIVATE_PROVIDERS_TARGET, ONLY_FILTERS, MISSING_FILTER, SECOND_FILTER, FILTER_ELSEWHERE, FILTER_PASSES_THIS,
        FILTER_RESULT_DROPPED, GATE_INVERTED, GATE_SKIPS_TOO_FAR, GATE_AFTER_MAPPING, ITEMS_BEFORE_THEIR_FIELD,
        CHIPS_BEFORE_THE_BUILDER, SEARCH_CHIPS_BEFORE_SUPER, PRIVATE_FILTER, FILTER_WRONG_SIGNATURE,
        GATE_TESTS_ANOTHER_REGISTER, GATE_RETURNS_ONE, BRIDGE_ONLY
    }

    @Test void acceptsEveryHook() throws Exception { check(Change.NONE, true); }
    @Test void acceptsNoHookWithoutThePatch() throws Exception { check(Change.NO_HOOKS, false); }
    @Test void acceptsTheBridgeHookAloneWithHomePins() throws Exception { check(Change.BRIDGE_ONLY, false, true); }
    @Test void acceptsEveryHookWithHomePinsToo() throws Exception { check(Change.NONE, true, true); }
    @Test void rejectsMenuHooksWithHomePinsAlone() { assertThrows(AssertionError.class, () -> check(Change.NONE, false, true)); }
    @Test void rejectsHomePinsWithoutTheBridgeHook() { assertThrows(AssertionError.class, () -> check(Change.NO_HOOKS, false, true)); }
    @Test void rejectsTheBridgeHookAloneWithoutHomePins() {
        assertThrows(AssertionError.class, () -> check(Change.BRIDGE_ONLY, false, false));
    }
    @Test void rejectsAMissingHook() { rejects(Change.MISSING_HOOK); }
    @Test void rejectsHooksWithoutThePatch() { assertThrows(AssertionError.class, () -> check(Change.NONE, false)); }
    @Test void rejectsASecondHook() { rejects(Change.SECOND_HOOK); }
    @Test void rejectsAHookInAnotherClass() { rejects(Change.WRONG_CALLER); }
    @Test void rejectsAHookThatPassesAnotherRegister() { rejects(Change.WRONG_REGISTER); }
    @Test void rejectsAHookBeforeTheRouterSchedules() { rejects(Change.BEFORE_SCHEDULING); }
    @Test void rejectsATargetSpotifyCantCall() { rejects(Change.PRIVATE_TARGET); }
    @Test void rejectsAMissingMenuHook() { rejects(Change.MISSING_TRACK_HOOK); }
    @Test void rejectsAMenuHookThatPassesAnotherRow() { rejects(Change.TRACK_PASSES_ANOTHER_ROW); }
    @Test void rejectsAMenuHookWhoseListIsDropped() { rejects(Change.TRACK_RESULT_DROPPED); }
    @Test void rejectsAMenuHookAfterTheModelIsBuilt() { rejects(Change.TRACK_AFTER_MODEL); }
    @Test void rejectsAMenuHookBeforeTheListIsFrozen() { rejects(Change.TRACK_BEFORE_FREEZE); }
    @Test void rejectsAMenuHookAfterAnotherList() { rejects(Change.TRACK_AFTER_ANOTHER_LIST); }
    @Test void rejectsAMenuHookBeforeAnotherModel() { rejects(Change.TRACK_BEFORE_ANOTHER_MODEL); }
    @Test void rejectsAMenuHookInAnotherClass() { rejects(Change.TRACK_IN_ANOTHER_CLASS); }
    @Test void rejectsAnArtistHookWithoutTheArtist() { rejects(Change.ARTIST_WITHOUT_ITS_ROW); }
    @Test void rejectsAnArtistHookThatPassesAnotherRow() { rejects(Change.ARTIST_FROM_ANOTHER_ROW); }
    @Test void rejectsAnArtistHookInTheTrackMenu() { rejects(Change.ARTIST_IN_TRACK_MENU); }
    @Test void rejectsAMissingMenuBridge() { rejects(Change.MISSING_MENU_TARGET); }
    @Test void rejectsAPrivateMenuTarget() { rejects(Change.PRIVATE_TRACK_TARGET); }
    @Test void rejectsTheCapabilityOffWithThePatch() { rejects(Change.CAPABILITY_OFF); }
    @Test void rejectsTheCapabilityOnWithoutThePatch() { assertThrows(AssertionError.class, () -> check(Change.CAPABILITY_ON, false)); }
    @Test void rejectsAMissingChipsHook() { rejects(Change.MISSING_CHIPS_HOOK); }
    @Test void rejectsAChipsHookInAnotherClass() { rejects(Change.CHIPS_IN_ANOTHER_CLASS); }
    @Test void rejectsAChipsHookThatPassesAnotherRegister() { rejects(Change.CHIPS_PASS_ANOTHER_REGISTER); }
    @Test void rejectsAChipsHookWhoseListIsDropped() { rejects(Change.CHIPS_RESULT_DROPPED); }
    @Test void rejectsAChipsHookBeforeSpotifyRewritesTheChips() { rejects(Change.CHIPS_BEFORE_THE_REWRITE); }
    @Test void rejectsAChipsHookAfterTheChipsAreCopied() { rejects(Change.CHIPS_AFTER_THE_COPY); }
    @Test void rejectsAMissingTapHook() { rejects(Change.MISSING_TAP_HOOK); }
    @Test void rejectsATapHookInAnotherClass() { rejects(Change.TAP_IN_ANOTHER_CLASS); }
    @Test void rejectsATapHookThatPassesAnotherRegister() { rejects(Change.TAP_PASSES_ANOTHER_REGISTER); }
    @Test void rejectsATapHookWhoseAnswerIsIgnored() { rejects(Change.TAP_ANSWER_IGNORED); }
    @Test void rejectsATapHookThatSkipsElsewhere() { rejects(Change.TAP_SKIPS_ELSEWHERE); }
    @Test void rejectsATapHookAfterTheTapIsSent() { rejects(Change.TAP_AFTER_THE_SEND); }
    @Test void rejectsATapHookBeforeTheTapsEvent() { rejects(Change.TAP_BEFORE_THE_EVENT); }
    @Test void rejectsAMissingChipBridge() { rejects(Change.MISSING_CHIP_TARGET); }
    @Test void rejectsAPrivateTapTarget() { rejects(Change.PRIVATE_TAP_TARGET); }
    @Test void rejectsAChipsHookAfterAnotherCall() { rejects(Change.CHIPS_AFTER_ANOTHER_CALL); }
    @Test void rejectsAChipsHookBeforeAnotherCopy() { rejects(Change.CHIPS_BEFORE_ANOTHER_COPY); }
    @Test void rejectsATapHookAfterAnotherEvent() { rejects(Change.TAP_AFTER_ANOTHER_EVENT); }
    @Test void rejectsATapHookThatBranchesOnAnotherRegister() { rejects(Change.TAP_BRANCHES_ON_ANOTHER_REGISTER); }
    @Test void rejectsATapHookBeforeSomethingElse() { rejects(Change.TAP_BEFORE_SOMETHING_ELSE); }
    @Test void rejectsAMissingShuffleHook() { rejects(Change.MISSING_SHUFFLE_HOOK); }
    @Test void rejectsAShuffleHookInAnotherClass() { rejects(Change.SHUFFLE_IN_ANOTHER_CLASS); }
    @Test void rejectsAShuffleHookInAnotherMethod() { rejects(Change.SHUFFLE_IN_ANOTHER_METHOD); }
    @Test void rejectsAShuffleHookThatPassesAnotherRegister() { rejects(Change.SHUFFLE_PASSES_ANOTHER_REGISTER); }
    @Test void rejectsAShuffleHookBeforeTheButtonIsStored() { rejects(Change.SHUFFLE_BEFORE_THE_STORE); }
    @Test void rejectsAShuffleHookAfterAnotherFieldIsStored() { rejects(Change.SHUFFLE_AFTER_ANOTHER_FIELD); }
    @Test void rejectsAShuffleHookAfterAnotherRegisterIsStored() { rejects(Change.SHUFFLE_AFTER_ANOTHER_REGISTERS_STORE); }
    @Test void rejectsAShuffleHookBeforeSomethingElse() { rejects(Change.SHUFFLE_BEFORE_SOMETHING_ELSE); }
    @Test void rejectsAMissingShuffleTarget() { rejects(Change.MISSING_SHUFFLE_TARGET); }
    @Test void rejectsAPrivateShuffleTarget() { rejects(Change.PRIVATE_SHUFFLE_TARGET); }
    @Test void rejectsAMissingPlaylistMenuHook() { rejects(Change.MISSING_PROVIDERS_HOOK); }
    @Test void rejectsAPlaylistMenuHookInAnotherClass() { rejects(Change.PROVIDERS_IN_ANOTHER_CLASS); }
    @Test void rejectsAPlaylistMenuHookInAnotherMethod() { rejects(Change.PROVIDERS_IN_ANOTHER_METHOD); }
    @Test void rejectsAPlaylistMenuHookThatPassesAnotherRegister() { rejects(Change.PROVIDERS_PASS_ANOTHER_REGISTER); }
    @Test void rejectsAPlaylistMenuHookWhoseProvidersAreDropped() { rejects(Change.PROVIDERS_RESULT_DROPPED); }
    @Test void rejectsAPlaylistMenuHookAfterTheProvidersAreStored() { rejects(Change.PROVIDERS_AFTER_THE_STORE); }
    @Test void rejectsAPlaylistMenuHookBeforeAnotherStore() { rejects(Change.PROVIDERS_BEFORE_ANOTHER_STORE); }
    @Test void rejectsAPlaylistMenuHookWhoseProvidersGoElsewhere() { rejects(Change.PROVIDERS_STORED_ELSEWHERE); }
    @Test void rejectsAMissingPlaylistMenuProvider() { rejects(Change.MISSING_PROVIDERS_TARGET); }
    @Test void rejectsAPrivatePlaylistMenuTarget() { rejects(Change.PRIVATE_PROVIDERS_TARGET); }
    @Test void rejectsAPodcastFilterWithoutThePatch() {
        assertThrows(AssertionError.class, () -> check(Change.ONLY_FILTERS, false));
    }
    @Test void rejectsAMissingPodcastFilter() { rejects(Change.MISSING_FILTER); }
    @Test void rejectsASecondPodcastFilter() { rejects(Change.SECOND_FILTER); }
    @Test void rejectsAPodcastFilterInAnotherMethod() { rejects(Change.FILTER_ELSEWHERE); }
    @Test void rejectsAPodcastFilterThatPassesAnotherRegister() { rejects(Change.FILTER_PASSES_THIS); }
    @Test void rejectsAPodcastFilterWhoseResultIsDropped() { rejects(Change.FILTER_RESULT_DROPPED); }
    @Test void rejectsAGateThatDropsWhatItShouldKeep() { rejects(Change.GATE_INVERTED); }
    @Test void rejectsAGateThatSkipsSpotifysCode() { rejects(Change.GATE_SKIPS_TOO_FAR); }
    @Test void rejectsAGateAfterSpotifyMapsTheSection() { rejects(Change.GATE_AFTER_MAPPING); }
    @Test void rejectsAShelfFilterBeforeItsItems() { rejects(Change.ITEMS_BEFORE_THEIR_FIELD); }
    @Test void rejectsALibraryChipFilterBeforeTheChipsAreBuilt() { rejects(Change.CHIPS_BEFORE_THE_BUILDER); }
    @Test void rejectsASearchChipFilterBeforeTheSuperConstructor() { rejects(Change.SEARCH_CHIPS_BEFORE_SUPER); }
    @Test void rejectsAPrivatePodcastFilter() { rejects(Change.PRIVATE_FILTER); }
    @Test void rejectsAPodcastFilterCalledWithAnotherSignature() { rejects(Change.FILTER_WRONG_SIGNATURE); }
    @Test void rejectsAGateThatTestsAnotherRegister() { rejects(Change.GATE_TESTS_ANOTHER_REGISTER); }
    @Test void rejectsAGateThatReturnsSomethingButNull() { rejects(Change.GATE_RETURNS_ONE); }

    void rejects(Change change) {
        assertThrows(AssertionError.class, () -> check(change, true));
    }

    void check(Change change, boolean enabled) throws Exception {
        check(change, enabled, false);
    }

    void check(Change change, boolean enabled, boolean homePins) throws Exception {
        var classes = new ArrayList<ImmutableClassDef>();
        classes.add(definition(VerifyExtensionsDex.SERVICE, service(change)));
        classes.add(definition(VerifyExtensionsDex.BRIDGE, target(VerifyExtensionsDex.BRIDGE, "onCosmos",
            List.of("Ljava/lang/Object;"), "V", change == Change.PRIVATE_TARGET ? 0x0a : 0x09)));
        boolean moved = change == Change.TRACK_IN_ANOTHER_CLASS;
        classes.add(definition("Lp/b9p0;", menu("Lp/b9p0;", moved ? Change.MISSING_TRACK_HOOK : change, false)));
        if (moved) classes.add(definition("Lp/other;", menu("Lp/other;", Change.NONE, false)));
        classes.add(definition("Lp/lr5;", menu("Lp/lr5;", change, true)));
        if (change != Change.MISSING_MENU_TARGET) {
            classes.add(new ImmutableClassDef(MENUS, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(
                target(MENUS, "track", List.of("Ljava/util/List;", "Ljava/lang/Object;"), "Ljava/util/List;",
                    change == Change.PRIVATE_TRACK_TARGET ? 0x0a : 0x09),
                target(MENUS, "artist", List.of("Ljava/util/List;", "Ljava/lang/Object;"), "Ljava/util/List;", 0x09))));
        }
        boolean capability = change == Change.CAPABILITY_ON || enabled && change != Change.CAPABILITY_OFF;
        classes.add(definition(VerifyExtensionsDex.INSTALLED, method(VerifyExtensionsDex.INSTALLED, "extensions", List.of(), "Z",
            0x09, 1, List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, capability ? 1 : 0), new ImmutableInstruction11x(Opcode.RETURN, 0)))));
        boolean chipsMoved = change == Change.CHIPS_IN_ANOTHER_CLASS;
        classes.add(definition("Lp/qrl;", feeds("Lp/qrl;", chipsMoved ? Change.MISSING_CHIPS_HOOK : change)));
        if (chipsMoved) classes.add(definition("Lp/elsewhere;", feeds("Lp/elsewhere;", Change.NONE)));
        boolean tapMoved = change == Change.TAP_IN_ANOTHER_CLASS;
        classes.add(definition("Lp/a4v;", chipEvents("Lp/a4v;", tapMoved ? Change.MISSING_TAP_HOOK : change)));
        if (tapMoved) classes.add(definition("Lp/somewhere;", chipEvents("Lp/somewhere;", Change.NONE)));
        if (change != Change.MISSING_CHIP_TARGET) {
            classes.add(new ImmutableClassDef(CHIPS, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(
                target(CHIPS, "chips", List.of("Ljava/util/List;"), "Ljava/util/List;", 0x09),
                method(CHIPS, "onTap", List.of("Ljava/lang/String;"), "Z", change == Change.PRIVATE_TAP_TARGET ? 0x0a : 0x09,
                    2, List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN, 0))))));
        }
        boolean buttonMoved = change == Change.SHUFFLE_IN_ANOTHER_CLASS;
        classes.add(shuffleButton("Lp/xkp;", buttonMoved ? Change.MISSING_SHUFFLE_HOOK : change));
        if (buttonMoved) classes.add(shuffleButton("Lp/otherbutton;", Change.NONE));
        if (change != Change.MISSING_SHUFFLE_TARGET) {
            classes.add(definition(SHUFFLE, target(SHUFFLE, "onButton", List.of("Landroid/view/View;"), "V",
                change == Change.PRIVATE_SHUFFLE_TARGET ? 0x0a : 0x09)));
        }
        boolean menuMoved = change == Change.PROVIDERS_IN_ANOTHER_CLASS;
        classes.add(listMenu("Lp/sv70;", menuMoved ? Change.MISSING_PROVIDERS_HOOK : change));
        if (menuMoved) classes.add(listMenu("Lp/othermenu;", Change.NONE));
        if (change != Change.MISSING_PROVIDERS_TARGET) {
            classes.add(definition(PROVIDER, target(PROVIDER, "providers", List.of("Ljava/util/List;"), "Ljava/util/List;",
                change == Change.PRIVATE_PROVIDERS_TARGET ? 0x0a : 0x09)));
        }
        classes.addAll(podcastFilters(change));
        if (change == Change.SECOND_HOOK || change == Change.WRONG_CALLER) {
            classes.add(definition("Lp/other;", method("Lp/other;", "run", List.of(), "V", 0x09, 4,
                List.of(schedule(), bridgeHook(1), new ImmutableInstruction10x(Opcode.RETURN_VOID)))));
        }
        var dex = Files.createTempFile("extensions-verifier-", ".dex");
        try {
            DexPool.writeTo(dex.toString(), new ImmutableDexFile(Opcodes.getDefault(), classes));
            VerifyExtensionsDex.main(new String[]{dex.toString(), enabled ? "1" : "0", homePins ? "1" : "0"});
        } finally {
            Files.deleteIfExists(dex);
        }
    }

    /**
     * Hide podcasts' six hooks, each in a stand-in for the Spotify method it sits in, and the filters they
     * call. P1 and P4 come first and return null for a dropped section or result; the others put the
     * filtered list back where Spotify reads it.
     */
    List<ImmutableClassDef> podcastFilters(Change change) {
        boolean hooked = !unhooked(change) && change != Change.BRIDGE_ONLY;
        var classes = new ArrayList<ImmutableClassDef>();
        // P1: g0(Section), 6 registers, so this is v4 and the section v5.
        var section = new ArrayList<Instruction>();
        var mapping = List.of(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 4, 5, 0, 0, 0,
                new ImmutableMethodReference("Lp/mz1;", "O", List.of("Lcom/spotify/casita/v1/resolved/Section;"), "Lp/n920;")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        if (change == Change.GATE_AFTER_MAPPING) section.addAll(mapping);
        if (hooked && change != Change.FILTER_ELSEWHERE) {
            section.addAll(gate("hideHomeSection", change == Change.FILTER_PASSES_THIS ? 4 : 5, false, change));
        }
        if (change != Change.GATE_AFTER_MAPPING) section.addAll(mapping);
        section.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        classes.add(definition("Lp/mz1;", method("Lp/mz1;", "g0", List.of("Lcom/spotify/casita/v1/resolved/Section;"),
            "Lp/n920;", 0x01, 6, section)));
        if (change == Change.FILTER_ELSEWHERE) {
            classes.add(definition("Lp/other;", method("Lp/other;", "g0", List.of("Lcom/spotify/casita/v1/resolved/Section;"),
                "Lp/n920;", 0x01, 6, gate("hideHomeSection", 5, true, change))));
        }
        // P2: Provided.getItemsList(), 2 registers: the items in v0, this in v1.
        var items = new ArrayList<Instruction>();
        var field = new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1,
            new ImmutableFieldReference("Lcom/spotify/casita/v1/resolved/Provided;", "items_", "Lp/ih40;"));
        boolean early = change == Change.ITEMS_BEFORE_THEIR_FIELD;
        if (!early) items.add(field);
        if (hooked) items.addAll(filter("filterHomeItems", LIST, LIST, 0, 0));
        if (early) items.add(field);
        items.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        classes.add(definition("Lcom/spotify/casita/v1/resolved/Provided;", method("Lcom/spotify/casita/v1/resolved/Provided;",
            "getItemsList", List.of(), LIST, 0x11, 2, items)));
        // P3: the static xqw.a(List), 12 registers, so the chips are v11.
        var homeChips = new ArrayList<Instruction>();
        if (hooked) homeChips.addAll(filter("filterHomeChips", change == Change.FILTER_WRONG_SIGNATURE ? "Ljava/util/Collection;" : LIST,
            LIST, 11, change == Change.FILTER_RESULT_DROPPED ? 0 : 11));
        homeChips.add(new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, new ImmutableTypeReference(ARRAY_LIST)));
        homeChips.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        classes.add(definition("Lp/xqw;", method("Lp/xqw;", "a", List.of(LIST), ARRAY_LIST, 0x19, 12, homeChips)));
        // P4: bzw0.b(Entity), 48 registers, so the entity is v47, past what invoke-static can name.
        var entity = new ArrayList<Instruction>();
        if (hooked) entity.addAll(gate("hideSearchEntity", 47, true, change));
        entity.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 46));
        entity.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        classes.add(definition("Lp/bzw0;", method("Lp/bzw0;", "b", List.of("Lcom/spotify/searchview/proto/Entity;"),
            "Lp/onu;", 0x11, 48, entity)));
        // P5: ipy's constructor, 2 registers: this in v0, the chips in v1.
        var searchChips = new ArrayList<Instruction>();
        var init = new ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 1, 0, 0, 0, 0, 0,
            new ImmutableMethodReference(OBJECT, "<init>", List.of(), "V"));
        boolean beforeSuper = change == Change.SEARCH_CHIPS_BEFORE_SUPER;
        if (!beforeSuper) searchChips.add(init);
        if (hooked) searchChips.addAll(filter("filterSearchChips", ARRAY_LIST, ARRAY_LIST, 1, 1));
        if (beforeSuper) searchChips.add(init);
        searchChips.add(new ImmutableInstruction22c(Opcode.IPUT_OBJECT, 1, 0, new ImmutableFieldReference("Lp/ipy;", "a", ARRAY_LIST)));
        searchChips.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        classes.add(definition("Lp/ipy;", method("Lp/ipy;", "<init>", List.of(ARRAY_LIST), "V", 0x10001, 2, searchChips)));
        // P6: b90.invoke, 15 registers, where the chip builder's list lands in v8 on its way to Lp/j290;.
        var libraryChips = new ArrayList<Instruction>();
        var build = List.of(new ImmutableInstruction3rc(Opcode.INVOKE_INTERFACE_RANGE, 6, 6, new ImmutableMethodReference(
                CHIP_BUILDER, "a", List.of("Z", "Z", "Lspotify/your_library/esperanto/proto/YourLibraryResponseHeader;", LIST, LIST), LIST)),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 8));
        boolean beforeBuilder = change == Change.CHIPS_BEFORE_THE_BUILDER;
        if (!beforeBuilder) libraryChips.addAll(build);
        if (hooked && change != Change.MISSING_FILTER) libraryChips.addAll(filter("filterLibraryChips", LIST, LIST, 8, 8));
        if (change == Change.SECOND_FILTER) libraryChips.addAll(filter("filterLibraryChips", LIST, LIST, 8, 8));
        if (beforeBuilder) libraryChips.addAll(build);
        libraryChips.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 8));
        classes.add(definition("Lp/b90;", method("Lp/b90;", "invoke", List.of(OBJECT, OBJECT), OBJECT, 0x11, 15, libraryChips)));
        // The extension's own settings call HidePodcasts too, for the audiobook switch, in every APK the settings
        // patch builds. Those calls aren't hooks.
        var settings = "Lapp/spicetify/extension/spotify/settings/ExtensionSettings;";
        classes.add(definition(settings, method(settings, "open", List.of("Landroid/content/Context;"), "V", 0x08, 2, List.of(
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 1, 0, 0, 0, 0,
                new ImmutableMethodReference(FILTERS, "audiobooksHidden", List.of("Landroid/content/Context;"), "Z")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 2, 1, 0, 0, 0, 0,
                new ImmutableMethodReference(FILTERS, "setAudiobooksHidden", List.of("Landroid/content/Context;", "Z"), "V")),
            new ImmutableInstruction10x(Opcode.RETURN_VOID)))));
        classes.add(new ImmutableClassDef(FILTERS, 1, OBJECT, List.of(), null, Set.of(), List.of(), List.of(
            target(FILTERS, "hideHomeSection", List.of(OBJECT), "Z", 0x09),
            target(FILTERS, "filterHomeItems", List.of(LIST), LIST, 0x09),
            target(FILTERS, "filterHomeChips", List.of(LIST), LIST, 0x09),
            target(FILTERS, "hideSearchEntity", List.of(OBJECT), "Z", 0x09),
            target(FILTERS, "filterSearchChips", List.of(ARRAY_LIST), ARRAY_LIST, 0x09),
            target(FILTERS, "filterLibraryChips", List.of(LIST), LIST, change == Change.PRIVATE_FILTER ? 0x0a : 0x09))));
        return classes;
    }

    /** `invoke-static {vArgument}, filter`, then `move-result-object vResult`. */
    List<Instruction> filter(String name, String parameter, String result, int argument, int resultRegister) {
        return List.of(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, argument, 0, 0, 0, 0,
                new ImmutableMethodReference(FILTERS, name, List.of(parameter), result)),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, resultRegister));
    }

    /** P1's and P4's gate: ask the filter, and return null when it says to drop, else skip to Spotify's code. */
    List<Instruction> gate(String name, int argument, boolean range, Change change) {
        var reference = new ImmutableMethodReference(FILTERS, name, List.of(OBJECT), "Z");
        return List.of(range ? new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, argument, 1, reference)
                : new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, argument, 0, 0, 0, 0, reference),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            new ImmutableInstruction21t(change == Change.GATE_INVERTED && range ? Opcode.IF_NEZ : Opcode.IF_EQZ,
                change == Change.GATE_TESTS_ANOTHER_REGISTER && range ? 1 : 0,
                change == Change.GATE_SKIPS_TOO_FAR && range ? 6 : 4),
            new ImmutableInstruction11n(Opcode.CONST_4, 0, change == Change.GATE_RETURNS_ONE && range ? 1 : 0),
            new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
    }

    /** SharedCosmosRouterService's constructor: 4 registers, so p0 is v1. */
    ImmutableMethod service(Change change) {
        boolean withoutHook = unhooked(change) || change == Change.MISSING_HOOK || change == Change.WRONG_CALLER
            || change == Change.ONLY_FILTERS;
        List<Instruction> code = new ArrayList<>();
        if (change == Change.BEFORE_SCHEDULING) code.add(bridgeHook(1));
        code.add(schedule());
        if (!withoutHook && change != Change.BEFORE_SCHEDULING) code.add(bridgeHook(change == Change.WRONG_REGISTER ? 2 : 1));
        code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        return method(VerifyExtensionsDex.SERVICE, "<init>",
            List.of("Lp/ddk;", "Lcom/spotify/cosmos/servicebasedrouter/RemoteNativeRouter;"), "V", 0x10001, 4, code);
    }

    /**
     * A menu builder's apply: the frozen list lands in v0, the menu bridge replaces it, and the menu model
     * is built from it. The track menu's row is v11, and the artist menu's is v22, moved to v1 first.
     */
    ImmutableMethod menu(String owner, Change change, boolean artist) {
        boolean asArtist = artist || change == Change.ARTIST_IN_TRACK_MENU;
        String name = asArtist ? "artist" : "track";
        List<Instruction> hook = new ArrayList<>();
        if (asArtist && change != Change.ARTIST_WITHOUT_ITS_ROW) {
            hook.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, change == Change.ARTIST_FROM_ANOTHER_ROW ? 21 : 22));
        }
        int row = asArtist ? 1 : change == Change.TRACK_PASSES_ANOTHER_ROW ? 12 : 11;
        hook.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 2, 0, row, 0, 0, 0,
            new ImmutableMethodReference(MENUS, name, List.of("Ljava/util/List;", "Ljava/lang/Object;"), "Ljava/util/List;")));
        hook.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, change == Change.TRACK_RESULT_DROPPED && !artist ? 2 : 0));
        var freeze = List.of(
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 13, 0, 0, 0, 0, new ImmutableMethodReference(
                change == Change.TRACK_AFTER_ANOTHER_LIST && !artist ? "Lp/other;" : "Lp/qte;", "J",
                List.of("Ljava/util/List;"), "Lp/dm70;")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        var model = new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 1, new ImmutableTypeReference(
            change == Change.TRACK_BEFORE_ANOTHER_MODEL && !artist ? "Lp/other;" : "Lp/krj;"));
        boolean hooked = !unhooked(change) && change != Change.ONLY_FILTERS && change != Change.BRIDGE_ONLY
            && !(change == Change.MISSING_TRACK_HOOK && !artist);
        boolean moved = !artist && (change == Change.TRACK_BEFORE_FREEZE || change == Change.TRACK_AFTER_MODEL);
        List<Instruction> code = new ArrayList<>();
        if (hooked && moved && change == Change.TRACK_BEFORE_FREEZE) code.addAll(hook);
        code.addAll(freeze);
        if (hooked && !moved) code.addAll(hook);
        code.add(model);
        if (hooked && moved && change == Change.TRACK_AFTER_MODEL) code.addAll(hook);
        code.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0));
        return method(owner, "apply", List.of("Ljava/lang/Object;"), "Ljava/lang/Object;", 0x01, 24, code);
    }

    /** A build without the patch: no hooks, whatever its capability says. */
    static boolean unhooked(Change change) {
        return change == Change.NO_HOOKS || change == Change.CAPABILITY_ON;
    }

    /**
     * Home's feed mapping, Lp/qrl;->invokeSuspend: Lp/xqw;->a rewrites the chips into v1, the chip bridge
     * replaces them in v1, and a new ArrayList copies them.
     */
    ImmutableMethod feeds(String owner, Change change) {
        var rewrite = List.of(
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 2, 0, 0, 0, 0, new ImmutableMethodReference(
                change == Change.CHIPS_AFTER_ANOTHER_CALL ? "Lp/other;" : "Lp/xqw;", "a", List.of("Ljava/util/List;"),
                "Ljava/util/ArrayList;")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 1));
        var hook = List.of(
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, change == Change.CHIPS_PASS_ANOTHER_REGISTER ? 2 : 1, 0, 0, 0, 0,
                new ImmutableMethodReference(CHIPS, "chips", List.of("Ljava/util/List;"), "Ljava/util/List;")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, change == Change.CHIPS_RESULT_DROPPED ? 0 : 1));
        var copy = new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 2, new ImmutableTypeReference(
            change == Change.CHIPS_BEFORE_ANOTHER_COPY ? "Ljava/util/LinkedList;" : "Ljava/util/ArrayList;"));
        boolean hooked = !unhooked(change) && change != Change.BRIDGE_ONLY && change != Change.MISSING_CHIPS_HOOK;
        List<Instruction> code = new ArrayList<>();
        if (hooked && change == Change.CHIPS_BEFORE_THE_REWRITE) code.addAll(hook);
        code.addAll(rewrite);
        if (hooked && change != Change.CHIPS_BEFORE_THE_REWRITE && change != Change.CHIPS_AFTER_THE_COPY) code.addAll(hook);
        code.add(copy);
        if (hooked && change == Change.CHIPS_AFTER_THE_COPY) code.addAll(hook);
        code.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 2));
        return method(owner, "invokeSuspend", List.of("Ljava/lang/Object;"), "Ljava/lang/Object;", 0x01, 5, code);
    }

    /**
     * Home's chip events, Lp/a4v;->invoke: a tap's Lp/q8w; is built from the chip's id in v1, the chip bridge
     * takes the id and skips to the case's return-object v13 when it handled the tap, and otherwise the event
     * goes to Home's loop, Lp/bay;->invoke.
     */
    ImmutableMethod chipEvents(String owner, Change change) {
        String type = change == Change.TAP_AFTER_ANOTHER_EVENT ? "Lp/other;" : "Lp/q8w;";
        var event = List.of(
            new ImmutableInstruction21c(Opcode.NEW_INSTANCE, 2, new ImmutableTypeReference(type)),
            new ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 2, 2, 1, 0, 0, 0,
                new ImmutableMethodReference(type, "<init>", List.of("Ljava/lang/String;"), "V")));
        var send = new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 3, 2, 0, 0, 0,
            new ImmutableMethodReference("Lp/bay;", "invoke", List.of("Ljava/lang/Object;"), "Ljava/lang/Object;"));
        boolean hooked = !unhooked(change) && change != Change.BRIDGE_ONLY && change != Change.MISSING_TAP_HOOK;
        // A branch counts code units from the if-nez: itself 2, the event 2 and 3, a nop 1, the send 3 and the
        // goto 1. TAP_SKIPS_ELSEWHERE lands on the goto instead of the return.
        boolean nop = change == Change.TAP_BEFORE_SOMETHING_ELSE;
        List<Instruction> code = new ArrayList<>();
        if (hooked && change == Change.TAP_BEFORE_THE_EVENT) code.addAll(tapHook(change, 2 + 5 + 3 + 1));
        code.addAll(event);
        if (hooked && change != Change.TAP_BEFORE_THE_EVENT && change != Change.TAP_AFTER_THE_SEND) {
            code.addAll(tapHook(change, change == Change.TAP_SKIPS_ELSEWHERE ? 2 + 3 : 2 + (nop ? 1 : 0) + 3 + 1));
        }
        if (nop) code.add(new ImmutableInstruction10x(Opcode.NOP));
        code.add(send);
        if (hooked && change == Change.TAP_AFTER_THE_SEND) code.addAll(tapHook(change, 2 + 1));
        code.add(new ImmutableInstruction10t(Opcode.GOTO, 1));
        code.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 13));
        return method(owner, "invoke", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;", 0x01, 16, code);
    }

    /** B: the chip's id in v1 goes to the chip bridge, whose answer, when true, branches {@code offset} code units on. */
    List<Instruction> tapHook(Change change, int offset) {
        return List.of(
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, change == Change.TAP_PASSES_ANOTHER_REGISTER ? 2 : 1, 0, 0, 0, 0,
                new ImmutableMethodReference(CHIPS, "onTap", List.of("Ljava/lang/String;"), "Z")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT, 1),
            new ImmutableInstruction21t(change == Change.TAP_ANSWER_IGNORED ? Opcode.IF_EQZ : Opcode.IF_NEZ,
                change == Change.TAP_BRANCHES_ON_ANOTHER_REGISTER ? 2 : 1, offset));
    }

    /**
     * Now Playing's shuffle button, Lp/xkp;: its constructor stores the button from v2 in field i, N1 hands v2 to
     * NowPlayingShuffle, and the constructor returns. 6 registers, so this is v4. SHUFFLE_IN_ANOTHER_METHOD
     * moves that ending, hook and all, into another method of the class with the same parameters, and
     * SHUFFLE_IN_ANOTHER_CLASS gives the same code, still storing into Lp/xkp;'s field, to another class.
     */
    ImmutableClassDef shuffleButton(String owner, Change change) {
        boolean hooked = !unhooked(change) && change != Change.BRIDGE_ONLY && change != Change.MISSING_SHUFFLE_HOOK;
        boolean moved = change == Change.SHUFFLE_IN_ANOTHER_METHOD;
        var methods = new ArrayList<ImmutableMethod>();
        methods.add(method(owner, "<init>", List.of("Landroid/content/Context;"), "V", 0x10001, 6,
            buttonEnd(change, hooked && !moved)));
        if (moved) {
            methods.add(method(owner, "a", List.of("Landroid/content/Context;"), "V", 0x11, 6, buttonEnd(Change.NONE, true)));
        }
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), methods);
    }

    /** The store of the button into Lp/xkp;'s field, N1 when {@code hooked}, and the return. */
    List<Instruction> buttonEnd(Change change, boolean hooked) {
        var store = new ImmutableInstruction22c(Opcode.IPUT_OBJECT,
            change == Change.SHUFFLE_AFTER_ANOTHER_REGISTERS_STORE ? 3 : 2, 4, new ImmutableFieldReference("Lp/xkp;",
                change == Change.SHUFFLE_AFTER_ANOTHER_FIELD ? "h" : "i", "Landroidx/appcompat/widget/AppCompatImageButton;"));
        var hook = new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, change == Change.SHUFFLE_PASSES_ANOTHER_REGISTER ? 3 : 2,
            0, 0, 0, 0, new ImmutableMethodReference(SHUFFLE, "onButton", List.of("Landroid/view/View;"), "V"));
        List<Instruction> code = new ArrayList<>();
        if (hooked && change == Change.SHUFFLE_BEFORE_THE_STORE) code.add(hook);
        code.add(store);
        if (hooked && change != Change.SHUFFLE_BEFORE_THE_STORE) code.add(hook);
        if (change == Change.SHUFFLE_BEFORE_SOMETHING_ELSE) code.add(new ImmutableInstruction10x(Opcode.NOP));
        code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        return code;
    }

    /**
     * The list menu, Lp/sv70;: its constructor (6 registers, so this is v0 and the item providers are v4) stores
     * another list in field c, M1 replaces the providers in v4, and the constructor stores them in field d.
     * PROVIDERS_IN_ANOTHER_METHOD moves that code, hook and all, into another method of the class with the same
     * parameters, and PROVIDERS_IN_ANOTHER_CLASS gives the same code, still storing into Lp/sv70;'s fields, to
     * another class.
     */
    ImmutableClassDef listMenu(String owner, Change change) {
        boolean hooked = !unhooked(change) && change != Change.BRIDGE_ONLY && change != Change.MISSING_PROVIDERS_HOOK;
        boolean moved = change == Change.PROVIDERS_IN_ANOTHER_METHOD;
        var methods = new ArrayList<ImmutableMethod>();
        methods.add(method(owner, "<init>", LIST_MENU, "V", 0x10001, 6, providersStore(change, hooked && !moved)));
        if (moved) methods.add(method(owner, "e", LIST_MENU, "V", 0x11, 6, providersStore(Change.NONE, true)));
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), methods);
    }

    /** The stores of Lp/sv70;'s fields c and d, with M1 before the store of d when {@code hooked}, and the return. */
    List<Instruction> providersStore(Change change, boolean hooked) {
        var hook = List.of(
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, change == Change.PROVIDERS_PASS_ANOTHER_REGISTER ? 3 : 4,
                0, 0, 0, 0, new ImmutableMethodReference(PROVIDER, "providers", List.of("Ljava/util/List;"), "Ljava/util/List;")),
            new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, change == Change.PROVIDERS_RESULT_DROPPED ? 5 : 4));
        var store = new ImmutableInstruction22c(Opcode.IPUT_OBJECT, 4, change == Change.PROVIDERS_STORED_ELSEWHERE ? 1 : 0,
            new ImmutableFieldReference("Lp/sv70;", change == Change.PROVIDERS_BEFORE_ANOTHER_STORE ? "c" : "d", "Ljava/util/List;"));
        List<Instruction> code = new ArrayList<>();
        code.add(new ImmutableInstruction22c(Opcode.IPUT_OBJECT, 3, 0, new ImmutableFieldReference("Lp/sv70;", "c", "Ljava/util/List;")));
        if (hooked && change != Change.PROVIDERS_AFTER_THE_STORE) code.addAll(hook);
        code.add(store);
        if (hooked && change == Change.PROVIDERS_AFTER_THE_STORE) code.addAll(hook);
        code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        return code;
    }

    ImmutableInstruction3rc bridgeHook(int register) {
        return new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
            new ImmutableMethodReference(VerifyExtensionsDex.BRIDGE, "onCosmos", List.of("Ljava/lang/Object;"), "V"));
    }

    ImmutableInstruction35c schedule() {
        return new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 3, 0, 0, 0, 0,
            new ImmutableMethodReference("Lcom/spotify/cosmos/cosmosimpl/NativeRouter;", "initializeScheduling",
                List.of("Lcom/spotify/cosmos/cosmosimpl/Scheduler;"), "V"));
    }

    ImmutableMethod target(String owner, String name, List<String> parameters, String result, int flags) {
        return method(owner, name, parameters, result, flags, 3, List.of(result.equals("V")
            ? new ImmutableInstruction10x(Opcode.RETURN_VOID) : new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)));
    }

    ImmutableMethod method(String owner, String name, List<String> parameters, String result, int flags, int registers,
            List<? extends Instruction> code) {
        return new ImmutableMethod(owner, name, parameters.stream().map(p -> new ImmutableMethodParameter(p, Set.of(), null)).toList(),
            result, flags, Set.of(), Set.of(), new ImmutableMethodImplementation(registers, code, List.of(), List.of()));
    }

    ImmutableClassDef definition(String owner, ImmutableMethod method) {
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(method));
    }
}
