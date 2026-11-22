/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.morphe.extension.h19e8p.flags;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * 選んだ部品に関係しそうなフラグを、名前の単語の一致で探す。
 *
 * <p>これは手がかりで、答えではない。フラグはサーバーから届く設定で、部品とは離れた所で
 * ずっと前に読まれるので、両者を結び付けるものは無い。それでも当たることがあるのは、X の
 * フラグの名前 ("bookmarks_in_timelines_enabled" など) も、部品の id やパッケージの名前も、
 * 中身を表す単語でできているからである。
 */
final class FlagCandidateFinder {

    /** どこにでも出てきて、ほとんどのフラグに当たってしまう単語。 */
    private static final Set<String> STOP_WORDS = new HashSet<>(Arrays.asList(
            "com", "twitter", "android", "androidx", "java", "lang", "app", "ui", "view", "views",
            "widget", "layout", "group", "container", "wrapper", "holder", "item", "row", "cell",
            "text", "textview", "image", "imageview", "button", "frame", "linear", "relative",
            "constraint", "recycler", "list", "compose", "internal", "impl", "base", "abstract",
            "default", "content", "main", "root", "core", "common", "util", "utils", "api",
            "enabled", "disabled", "config", "feature", "flag", "flags", "value", "type", "kt"));

    private static final int MIN_TOKEN_LENGTH = 3;
    private static final int EXACT_MATCH_SCORE = 3;
    private static final int PARTIAL_MATCH_SCORE = 1;
    private static final int MIN_PARTIAL_LENGTH = 5;

    private FlagCandidateFinder() {
    }

    static final class Candidate {
        final String flag;
        final int score;
        final Set<String> matched;

        Candidate(String flag, int score, Set<String> matched) {
            this.flag = flag;
            this.score = score;
            this.matched = matched;
        }
    }

    /** 選んだ部品の id、クラス、パッケージから、探す単語を作る。 */
    static Set<String> tokensFor(String className, String idName, String[] ancestors) {
        Set<String> tokens = new HashSet<>();
        addTokens(tokens, idName);
        addTokens(tokens, className);
        if (ancestors != null) {
            // 近い親だけを使う。遠くまで使うと、どの画面にもある枠組みの単語ばかりになる。
            for (int i = 0; i < ancestors.length && i < 3; i++) {
                addTokens(tokens, ancestors[i]);
            }
        }
        tokens.removeIf(t -> t.length() < MIN_TOKEN_LENGTH || STOP_WORDS.contains(t));
        return tokens;
    }

    /** 区切り文字と、小文字から大文字に変わる所で分ける。 */
    private static void addTokens(Set<String> out, String raw) {
        if (raw == null || raw.isEmpty()) return;
        String spaced = raw.replaceAll("([a-z0-9])([A-Z])", "$1 $2");
        for (String part : spaced.split("[^A-Za-z0-9]+")) {
            if (part.isEmpty()) continue;
            String token = part.toLowerCase(Locale.ROOT);
            // 短く変えられたクラスの名前は1〜2文字で、手がかりにならない。
            if (token.length() < MIN_TOKEN_LENGTH) continue;
            out.add(token);
        }
    }

    /**
     * 知っているフラグを、部品の単語との一致の多い順に並べる。
     *
     * @param flags X がこれまでに読んだフラグの名前
     */
    static List<Candidate> rank(Set<String> tokens, Collection<String> flags, int limit) {
        List<Candidate> candidates = new ArrayList<>();
        if (tokens.isEmpty() || flags == null || flags.isEmpty()) return candidates;

        Set<String> seen = new HashSet<>();
        for (String flag : flags) {
            if (flag.isEmpty() || !seen.add(flag)) continue;

            String lower = flag.toLowerCase(Locale.ROOT);
            Set<String> flagTokens = new HashSet<>(Arrays.asList(lower.split("[^a-z0-9]+")));

            int score = 0;
            Set<String> matched = new HashSet<>();
            for (String token : tokens) {
                if (flagTokens.contains(token)) {
                    score += EXACT_MATCH_SCORE;
                    matched.add(token);
                } else if (token.length() >= MIN_PARTIAL_LENGTH && lower.contains(token)) {
                    score += PARTIAL_MATCH_SCORE;
                    matched.add(token);
                }
            }

            if (score > 0) candidates.add(new Candidate(flag, score, matched));
        }

        Collections.sort(candidates, (a, b) -> {
            if (a.score != b.score) return Integer.compare(b.score, a.score);
            return a.flag.compareTo(b.flag);
        });

        return candidates.size() > limit ? new ArrayList<>(candidates.subList(0, limit)) : candidates;
    }
}
