/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.search;

import java.util.ArrayList;
import java.util.List;

/** Builds pages of search results the way Facebook hands them over, and asks the hooks as search would. */
public final class MetaAiSearchForTests {
    private MetaAiSearchForTests() {
    }

    /**
     * Stands in for Facebook's result role enum, whose fields are renamed but whose constants keep
     * their names. Only the name matters to the extension. LATER_BUILD_ROLE is one no build has yet.
     */
    public enum Role {
        UNSET_OR_UNRECOGNIZED_ENUM_VALUE,
        SPELLER,
        HORIZON_WORLDS,
        TOP_SEARCH_SUGGESTIONS_FLOATING_MODULE_DEPENDENT,
        EXPLORE_PAGES_VLIST,
        ENTITY_USER,
        ENTITY_GROUPS,
        ENTITY_PAGES,
        PUBLIC_POSTS,
        HCM_SEARCH_META_AI_ANSWER,
        HCM_RELATED_META_AI_PROMPTS,
        HCM_RELATED_META_AI_PROMPTS_W_LOADING,
        HCM_SEARCH_AI_MODE,
        SEARCH_META_AI_ANSWER,
        SEARCH_META_AI_ANSWER_BODY,
        SEARCH_META_AI_ANSWER_BODY_FULL,
        SEARCH_META_AI_ANSWER_LOADING,
        SEARCH_META_AI_TAB,
        SEARCH_META_AI_TAB_BODY,
        AI_MODE_FOLLOWUP_SUGGESTIONS,
        AI_MODE_CACHED_CONTENT,
        META_AI_ANSWERSHEET_FRIEND_POSTS,
        LATER_BUILD_ROLE,
    }

    /** A result module: all the extension reads of it is its role, through the accessor. */
    public static final class Module {
        final Object role;

        Module(Object role) {
            this.role = role;
        }

        @Override
        public String toString() {
            return "Module(" + role + ")";
        }
    }

    /** The accessor the patch fills the stub with, as a lambda over the stand-in module. */
    static final MetaAiSearch.RoleAccessor ACCESSOR = module -> ((Module) module).role;

    /** A page whose modules have these roles, in order. */
    public static List<Object> page(Object... roles) {
        List<Object> modules = new ArrayList<>();
        for (Object role : roles) modules.add(new Module(role));
        return modules;
    }

    /** What the page hook answers for [page], a page of the results: null keeps Facebook's list. */
    public static List<Object> kept(List<Object> page) {
        return MetaAiSearch.keptResults(page, "search_results_loader_initial_task", ACCESSOR);
    }

    /** What the page hook answers for [page] when it's the Meta AI tab's own page. */
    public static List<Object> keptOnTheMetaAiTab(List<Object> page) {
        return MetaAiSearch.keptResults(page, MetaAiSearch.META_AI_TAB_PAGE, ACCESSOR);
    }

    /** True when the answer question was answered no for Facebook. */
    public static boolean hidesAnswer() {
        return MetaAiSearch.hideAnswer();
    }

    /** True when a page with Meta AI's answer on top and a row of Ask Meta AI prompts lost them. */
    public static boolean dropsPrompts() {
        return kept(page(Role.SEARCH_META_AI_ANSWER, Role.ENTITY_USER, Role.HCM_RELATED_META_AI_PROMPTS)) != null;
    }

    /** True when a suggestion the server set to open Meta AI was told to open the results. */
    public static boolean stopsSuggestionRoute() {
        return !MetaAiSearch.opensMetaAi(true);
    }
}
