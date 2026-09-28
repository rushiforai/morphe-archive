/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.search;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.search.MetaAiSearchForTests.Role;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The three hooks of Hide Meta AI in search: the answer question answers no, a page of results
 * loses its Meta AI modules and keeps everything else in order, and a suggestion set to open Meta AI
 * opens the results. Off, paused, before the settings are ready, or on any failure, each gives
 * Facebook its own answer.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MetaAiSearchTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_META_AI_IN_SEARCH.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String counterLine(String route) {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(route + ":")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.META_AI_SEARCH + ":")) return line;
        }
        return null;
    }

    private static List<Object> roles(List<Object> modules) {
        Object[] roles = new Object[modules.size()];
        for (int i = 0; i < roles.length; i++) roles[i] = ((MetaAiSearchForTests.Module) modules.get(i)).role;
        return Arrays.asList(roles);
    }

    @Test
    public void theSwitchStartsOnAndTheAnswerQuestionAnswersNo() {
        assertTrue("the switch starts off", Settings.HIDE_META_AI_IN_SEARCH.get());
        assertTrue(MetaAiSearch.hideAnswer());
        assertEquals(MetaAiSearch.ANSWER_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: " + MetaAiSearch.ANSWER
                + ". Removed: " + MetaAiSearch.ANSWER + " 1", counterLine(MetaAiSearch.ANSWER_ROUTE));
        assertEquals(FamilyNames.META_AI_SEARCH + ": invoked 1, 0 found, 0 missing", statusLine());
    }

    @Test
    public void aPageLosesItsMetaAiModulesAndKeepsEverythingElseInOrder() {
        List<Object> page = MetaAiSearchForTests.page(Role.ENTITY_USER, Role.HCM_RELATED_META_AI_PROMPTS, Role.PUBLIC_POSTS,
                Role.HCM_SEARCH_META_AI_ANSWER, Role.ENTITY_GROUPS);
        List<Object> kept = MetaAiSearchForTests.kept(page);
        assertEquals(Arrays.asList(Role.ENTITY_USER, Role.PUBLIC_POSTS, Role.ENTITY_GROUPS), roles(kept));
        // The very modules Facebook built, not copies of them.
        assertSame(page.get(0), kept.get(0));
        assertSame(page.get(2), kept.get(1));
        assertSame(page.get(4), kept.get(2));
        assertEquals(MetaAiSearch.RESULTS_ROUTE + ": 1 lists, 5 items, 2 removed. Last reason: HCM_SEARCH_META_AI_ANSWER. "
                        + "Removed: HCM_RELATED_META_AI_PROMPTS 1, HCM_SEARCH_META_AI_ANSWER 1. "
                        + "Kinds: HCM_RELATED_META_AI_PROMPTS 1, HCM_SEARCH_META_AI_ANSWER 1",
                counterLine(MetaAiSearch.RESULTS_ROUTE));
        assertEquals(FamilyNames.META_AI_SEARCH + ": invoked 1, 1 found, 0 missing", statusLine());
    }

    @Test
    public void everyHiddenRoleGoes() {
        List<Object> kept = MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.HCM_SEARCH_META_AI_ANSWER,
                Role.HCM_RELATED_META_AI_PROMPTS, Role.HCM_RELATED_META_AI_PROMPTS_W_LOADING, Role.HCM_SEARCH_AI_MODE,
                Role.ENTITY_PAGES));
        assertEquals(Collections.singletonList(Role.ENTITY_PAGES), roles(kept));
        kept = MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.SEARCH_META_AI_ANSWER, Role.SEARCH_META_AI_ANSWER_BODY,
                Role.SEARCH_META_AI_ANSWER_BODY_FULL, Role.SEARCH_META_AI_ANSWER_LOADING, Role.ENTITY_USER));
        assertEquals(Collections.singletonList(Role.ENTITY_USER), roles(kept));
        assertEquals(8, MetaAiSearch.HIDDEN_ROLES.length);
    }

    /**
     * The All results a signed-in 580 served on the S22 (2026-09-27): the Meta AI answer first, then
     * the speller, a Horizon Worlds module and modules whose role the build doesn't know. Only the
     * answer goes, and the unknown ones stay in their places.
     */
    @Test
    public void aPageWithTheMetaAiAnswerFirstLosesOnlyThatModule() {
        List<Object> page = MetaAiSearchForTests.page(Role.SEARCH_META_AI_ANSWER, Role.SPELLER, Role.HORIZON_WORLDS,
                Role.UNSET_OR_UNRECOGNIZED_ENUM_VALUE, Role.UNSET_OR_UNRECOGNIZED_ENUM_VALUE,
                Role.UNSET_OR_UNRECOGNIZED_ENUM_VALUE, Role.UNSET_OR_UNRECOGNIZED_ENUM_VALUE,
                Role.TOP_SEARCH_SUGGESTIONS_FLOATING_MODULE_DEPENDENT, Role.EXPLORE_PAGES_VLIST);
        List<Object> kept = MetaAiSearchForTests.kept(page);
        assertEquals(page.subList(1, page.size()), kept);
        for (int i = 0; i < kept.size(); i++) assertSame(page.get(i + 1), kept.get(i));
        assertEquals(MetaAiSearch.RESULTS_ROUTE + ": 1 lists, 9 items, 1 removed. Last reason: SEARCH_META_AI_ANSWER. "
                        + "Removed: SEARCH_META_AI_ANSWER 1. Kinds: SEARCH_META_AI_ANSWER 1",
                counterLine(MetaAiSearch.RESULTS_ROUTE));
        // A page the stream sends while the answer is all there is yet comes back empty.
        assertTrue(MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.SEARCH_META_AI_ANSWER)).isEmpty());
        // A page with no Meta AI in it, the later ones of the same search, keeps Facebook's list.
        assertNull(MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.UNSET_OR_UNRECOGNIZED_ENUM_VALUE,
                Role.TOP_SEARCH_SUGGESTIONS_FLOATING_MODULE_DEPENDENT, Role.UNSET_OR_UNRECOGNIZED_ENUM_VALUE)));
    }

    /** The Meta AI tab's own page keeps its answer: someone opened that tab for it. */
    @Test
    public void theMetaAiTabKeepsItsAnswer() {
        assertNull(MetaAiSearchForTests.keptOnTheMetaAiTab(MetaAiSearchForTests.page(Role.SEARCH_META_AI_ANSWER)));
        assertNull(MetaAiSearchForTests.keptOnTheMetaAiTab(MetaAiSearchForTests.page(Role.SEARCH_META_AI_ANSWER,
                Role.HCM_RELATED_META_AI_PROMPTS)));
        assertEquals(MetaAiSearch.RESULTS_ROUTE + ": 2 lists, 3 items, 0 removed. Kinds: " + MetaAiSearch.META_AI_TAB_KIND + " 2",
                counterLine(MetaAiSearch.RESULTS_ROUTE));
        assertEquals("search_meta_ai_answer_module", MetaAiSearch.META_AI_TAB_PAGE);
        // A page with no name, or any other name, is an ordinary page.
        assertTrue(MetaAiSearch.keptResults(MetaAiSearchForTests.page(Role.SEARCH_META_AI_ANSWER), null,
                MetaAiSearchForTests.ACCESSOR).isEmpty());
        assertTrue(MetaAiSearch.keptResults(MetaAiSearchForTests.page(Role.SEARCH_META_AI_ANSWER), "meta_ai_answer_entities",
                MetaAiSearchForTests.ACCESSOR).isEmpty());
    }

    /**
     * People, groups, pages and posts stay, and so do AI mode's and the Meta AI tab's own modules,
     * the answer sheet's posts, the role Facebook gives what it can't name, and a role no build has
     * yet: nothing to leave out keeps Facebook's own list.
     */
    @Test
    public void aPageWithNothingToLeaveOutKeepsFacebooksList() {
        assertNull(MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.ENTITY_USER, Role.ENTITY_GROUPS, Role.ENTITY_PAGES,
                Role.PUBLIC_POSTS, Role.SEARCH_META_AI_TAB, Role.SEARCH_META_AI_TAB_BODY, Role.AI_MODE_CACHED_CONTENT,
                Role.AI_MODE_FOLLOWUP_SUGGESTIONS, Role.META_AI_ANSWERSHEET_FRIEND_POSTS,
                Role.UNSET_OR_UNRECOGNIZED_ENUM_VALUE, Role.LATER_BUILD_ROLE)));
        // The Meta AI roles that reached the page are counted as kinds, the others aren't.
        assertEquals(MetaAiSearch.RESULTS_ROUTE + ": 1 lists, 11 items, 0 removed. Kinds: AI_MODE_CACHED_CONTENT 1, "
                        + "AI_MODE_FOLLOWUP_SUGGESTIONS 1, META_AI_ANSWERSHEET_FRIEND_POSTS 1, SEARCH_META_AI_TAB 1, "
                        + "SEARCH_META_AI_TAB_BODY 1",
                counterLine(MetaAiSearch.RESULTS_ROUTE));
    }

    /** A page of nothing but Meta AI modules comes back empty, and the report says so. */
    @Test
    public void aPageOfOnlyMetaAiIsLeftEmpty() {
        List<Object> kept = MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.HCM_RELATED_META_AI_PROMPTS));
        assertTrue(kept.isEmpty());
        assertTrue(counterLine(MetaAiSearch.RESULTS_ROUTE), counterLine(MetaAiSearch.RESULTS_ROUTE).contains("1 left empty"));
    }

    /** A module whose role can't be read stays, counted as one with no role. */
    @Test
    public void aModuleWithoutARoleStays() {
        List<Object> page = MetaAiSearchForTests.page(null, "not an enum", Role.HCM_SEARCH_AI_MODE);
        List<Object> kept = MetaAiSearchForTests.kept(page);
        assertEquals(Arrays.asList(null, "not an enum"), roles(kept));
        assertTrue(counterLine(MetaAiSearch.RESULTS_ROUTE),
                counterLine(MetaAiSearch.RESULTS_ROUTE).contains(MetaAiSearch.NO_ROLE + " 2"));
    }

    /** An accessor that throws keeps the module, and the report names the hook. */
    @Test
    public void anAccessorThatThrowsKeepsTheModule() {
        List<Object> page = MetaAiSearchForTests.page(Role.HCM_SEARCH_AI_MODE);
        assertNull(MetaAiSearch.keptResults(page, null, module -> {
            throw new IllegalStateException("renamed");
        }));
        List<String> missing = HookStatus.missing(FamilyNames.META_AI_SEARCH);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains("'search result role accessor' hook (it threw "
                + IllegalStateException.class.getName() + ")"));
    }

    /** The stub the patch fills in, unfilled: every module stays and the report says the accessor is missing. */
    @Test
    public void anUnpatchedAccessorKeepsEveryModule() {
        assertNull(MetaAiSearch.keptResults(MetaAiSearchForTests.page(Role.HCM_SEARCH_AI_MODE), null));
        List<String> missing = HookStatus.missing(FamilyNames.META_AI_SEARCH);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains("search result module#the role accessor"));
    }

    @Test
    public void aSuggestionThatOpensMetaAiOpensTheResults() {
        assertFalse(MetaAiSearch.opensMetaAi(true));
        assertFalse("a suggestion that never opened Meta AI was changed", MetaAiSearch.opensMetaAi(false));
        assertEquals(MetaAiSearch.SUGGESTIONS_ROUTE + ": 2 lists, 2 items, 1 removed. Last reason: "
                        + MetaAiSearch.OPENS_META_AI + ". Removed: " + MetaAiSearch.OPENS_META_AI + " 1. Kinds: "
                        + MetaAiSearch.OPENS_META_AI + " 1",
                counterLine(MetaAiSearch.SUGGESTIONS_ROUTE));
    }

    @Test
    public void offEachHookGivesFacebookItsOwnAnswer() {
        Settings.HIDE_META_AI_IN_SEARCH.save(false);
        assertFalse(MetaAiSearch.hideAnswer());
        assertNull(MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.HCM_RELATED_META_AI_PROMPTS)));
        assertTrue(MetaAiSearch.opensMetaAi(true));
        // Counted with the switch off too, so the report shows search asked, and nothing read or left out.
        assertEquals(MetaAiSearch.ANSWER_ROUTE + ": 1 lists, 1 items, 0 removed", counterLine(MetaAiSearch.ANSWER_ROUTE));
        assertEquals(MetaAiSearch.RESULTS_ROUTE + ": 1 lists, 1 items, 0 removed", counterLine(MetaAiSearch.RESULTS_ROUTE));
        Settings.HIDE_META_AI_IN_SEARCH.save(true);
        assertTrue(MetaAiSearch.hideAnswer());
        assertTrue(MetaAiSearchForTests.dropsPrompts());
        assertTrue(MetaAiSearchForTests.stopsSuggestionRoute());
    }

    @Test
    public void pausedEachHookGivesFacebookItsOwnAnswer() {
        for (HushfacebookPause.Reason reason : Arrays.asList(HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP)) {
            PauseForTests.pause(reason);
            assertFalse(MetaAiSearchForTests.hidesAnswer());
            assertFalse(MetaAiSearchForTests.dropsPrompts());
            assertFalse(MetaAiSearchForTests.stopsSuggestionRoute());
        }
        PauseForTests.resume();
        assertTrue(MetaAiSearchForTests.hidesAnswer());
        assertTrue(MetaAiSearchForTests.dropsPrompts());
        assertTrue(MetaAiSearchForTests.stopsSuggestionRoute());
    }

    @Test
    public void untilTheSettingsAreReadyEachHookGivesFacebookItsOwnAnswer() {
        boolean[] changed = {true, true, true};
        SettingsContextRule.withoutContext(() -> {
            changed[0] = MetaAiSearchForTests.hidesAnswer();
            changed[1] = MetaAiSearchForTests.dropsPrompts();
            changed[2] = MetaAiSearchForTests.stopsSuggestionRoute();
        });
        assertEquals("[false, false, false]", Arrays.toString(changed));
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            changed[0] = MetaAiSearchForTests.hidesAnswer();
            changed[1] = MetaAiSearchForTests.dropsPrompts();
            changed[2] = MetaAiSearchForTests.stopsSuggestionRoute();
        });
        assertEquals("[false, false, false]", Arrays.toString(changed));
    }

    /** No list, or an empty one, is Facebook's to keep. */
    @Test
    public void noModulesKeepFacebooksList() {
        assertNull(MetaAiSearchForTests.kept(null));
        assertNull(MetaAiSearchForTests.kept(Collections.emptyList()));
    }

    /** Every hook is counted under the patch's name. */
    @Test
    public void theHooksReportUnderThePatchsName() {
        MetaAiSearch.hideAnswer();
        MetaAiSearchForTests.kept(MetaAiSearchForTests.page(Role.ENTITY_USER));
        MetaAiSearch.opensMetaAi(false);
        assertTrue(statusLine(), statusLine().startsWith(FamilyNames.META_AI_SEARCH + ": invoked 3,"));
        assertEquals("Hide Meta AI in search", FamilyNames.META_AI_SEARCH);
    }

    @Test
    public void theRolesNamedAreMetaAiOnes() {
        for (String role : MetaAiSearch.HIDDEN_ROLES) {
            assertTrue(role, MetaAiSearch.isMetaAiRole(role));
            assertTrue(role, MetaAiSearch.isHiddenRole(role));
        }
        assertTrue(MetaAiSearch.isHiddenRole("SEARCH_META_AI_ANSWER"));
        assertFalse(MetaAiSearch.isHiddenRole("SEARCH_META_AI_TAB"));
        assertFalse(MetaAiSearch.isHiddenRole("UNSET_OR_UNRECOGNIZED_ENUM_VALUE"));
        assertFalse(MetaAiSearch.isMetaAiRole("ENTITY_USER"));
    }
}
