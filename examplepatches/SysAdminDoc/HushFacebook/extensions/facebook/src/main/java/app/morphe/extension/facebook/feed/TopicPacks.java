/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Short word lists for common topics, which the Words to hide editor can add in one tap. A pack
 * isn't a rule of its own: adding one writes its words into the list being typed as ordinary
 * lines, so they're editable and removable afterwards, and nothing is saved until the person saves.
 *
 * <p>Each pack is English terms that name its topic and that a friend wouldn't use in an everyday
 * post, so not "moon", "engaged", "before and after" or "giving away". Its words go in as a few
 * whole-word patterns, such as {@code /\b(bitcoins?|crypto)\b/}, so a word only matches on its own,
 * whatever the whole-word switch says: "recount" never hides "recounted". A {@code s?} after a word
 * lets its plural match too. A line already in the list, in any capitalisation or compatibility
 * form, is skipped, and a pack stops where the list would pass {@link PostWords#MAX_PHRASES}
 * phrases, {@link PostWords#MAX_PATTERNS} patterns or the room both lists share.
 */
public final class TopicPacks {
    /** What opens and closes each of a pack's patterns, between the slashes. */
    private static final String OPEN = "\\b(";
    private static final String CLOSE = ")\\b";

    /** The packs the editor offers, in the order it lists them. */
    public enum Pack {
        POLITICS("democrats?", "democratic party", "republicans?", "gop", "maga", "congress", "congressman",
                "congresswoman", "senators?", "supreme court", "impeach", "impeached", "impeachment", "presidential",
                "midterms?", "partisan", "bipartisan", "legislation", "lawmakers?", "politics", "political",
                "politicians?", "governor", "prime minister", "parliament", "left-wing", "right-wing",
                "mainstream media", "border wall", "tax cuts", "campaign trail"),
        ELECTIONS("elections?", "election day", "election results", "election night", "voters?", "ballots?",
                "ballot box", "polling places?", "polling stations?", "early voting", "mail-in ballots?",
                "absentee ballots?", "voter registration", "registered voters", "voter turnout", "swing states?",
                "electoral college", "electoral votes", "primary election", "runoff election", "exit polls?",
                "campaign rally", "presidential candidates?", "go vote", "get out the vote", "poll numbers",
                "debate night"),
        CRYPTO("crypto", "cryptocurrency", "cryptocurrencies", "bitcoins?", "btc", "ethereum", "blockchain",
                "altcoins?", "dogecoin", "memecoins?", "stablecoins?", "nfts?", "defi", "web3", "hodl", "binance",
                "coinbase", "satoshi", "mining rig", "pump and dump", "trading signals", "token sale"),
        SPORTS("nfl", "nba", "mlb", "nhl", "ncaa", "espn", "quarterbacks?", "super bowl", "playoffs?", "world series",
                "free agency", "fantasy football", "transfer window", "premier league", "champions league",
                "world cup", "march madness", "stanley cup", "final score", "double overtime", "halftime",
                "box score", "game recap", "draft picks?", "head coach", "starting lineup"),
        CELEBRITY_GOSSIP("celebrity", "celebrities", "celebrity gossip", "paparazzi", "tabloids?", "a-listers?",
                "kardashians?", "dating rumors", "split rumors", "breakup rumors", "tell-all", "caught cheating",
                "wardrobe malfunction", "reality star", "royal family", "met gala", "love triangle",
                "exclusive photos", "shocking transformation", "net worth", "public feud", "hollywood couple"),
        WEIGHT_LOSS_ADS("weight loss", "lose weight", "losing weight", "fat loss", "belly fat", "fat burners?",
                "fat burning", "burn fat", "melt fat", "diet pills?", "diet plan", "keto pills?", "keto gummies",
                "slimming", "detox tea", "juice cleanse", "intermittent fasting", "meal replacement", "miracle cure",
                "metabolism booster", "appetite suppressant", "ozempic", "wegovy", "semaglutide",
                "body transformation", "calorie deficit"),
        GIVEAWAYS_AND_BAIT("giveaways?", "tag a friend", "tag someone", "share this post", "like and share",
                "comment below", "comment yes", "comment amen", "type amen", "share if you", "like if you",
                "repost if", "follow and share", "enter to win", "chance to win", "win a free", "lucky winner",
                "free gift", "sweepstakes", "contest alert", "must share", "share to win", "comment done");

        private final List<String> words;
        private final List<String> lines;

        Pack(String... words) {
            this.words = Collections.unmodifiableList(Arrays.asList(words));
            this.lines = Collections.unmodifiableList(wholeWordLines(this.words));
        }

        /**
         * The pack's words and phrases, in the order they're added. Each is plain lowercase text, with
         * {@code s?} at the end where the plural counts too.
         */
        public List<String> words() {
            return words;
        }

        /**
         * What adding the pack writes: its words as whole-word patterns, as many as it takes to keep
         * each within {@link PostWords#MAX_PATTERN_LENGTH}.
         */
        public List<String> lines() {
            return lines;
        }
    }

    /** [words] joined into {@code /\b(a|b|c)\b/} lines, a new one started where the next word wouldn't fit. */
    private static List<String> wholeWordLines(List<String> words) {
        List<String> lines = new ArrayList<>();
        StringBuilder body = new StringBuilder();
        for (String word : words) {
            if (body.length() > 0
                    && OPEN.length() + body.length() + 1 + word.length() + CLOSE.length() > PostWords.MAX_PATTERN_LENGTH) {
                lines.add("/" + OPEN + body + CLOSE + "/");
                body.setLength(0);
            }
            if (body.length() > 0) body.append('|');
            body.append(word);
        }
        if (body.length() > 0) lines.add("/" + OPEN + body + CLOSE + "/");
        return lines;
    }

    /** How many of a pack's words [line] holds: one more than the bars between them. */
    static int wordsIn(String line) {
        int words = 1;
        for (int i = 0; i < line.length(); i++) {
            if (line.charAt(i) == '|') words++;
        }
        return words;
    }

    /** What adding a pack to a typed list came to. */
    public static final class Result {
        /** The list with the pack's new words added at the end, or the list as it was when none were. */
        public final String text;
        /** How many of the pack's words were added. */
        public final int added;
        /** How many of its words were already in the list, on a line the pack had added before. */
        public final int duplicates;
        /** Whether words were left out because the list or the room both lists share was full. */
        public final boolean full;

        Result(String text, int added, int duplicates, boolean full) {
            this.text = text;
            this.added = added;
            this.duplicates = duplicates;
            this.full = full;
        }
    }

    private TopicPacks() {
    }

    /**
     * [pack]'s lines added to [typed], the list as it's being edited, each on a line of its own
     * after what's there. A line already in the list is skipped, and adding stops at the first one
     * that wouldn't fit the phrase or pattern limit or the room beside the other list. What the
     * result counts is words, so the toast says how many of the pack's words went in.
     *
     * @param otherBytes the other list's {@link PostWords#encodedBytes}, as it's stored.
     */
    public static Result add(@Nullable String typed, Pack pack, int otherBytes) {
        String text = typed == null ? "" : typed;
        Set<String> seen = new HashSet<>();
        for (String phrase : PostWords.phrases(text)) seen.add(PostWords.fold(phrase));
        StringBuilder grown = new StringBuilder(text);
        int added = 0;
        int duplicates = 0;
        boolean full = false;
        for (String line : pack.lines()) {
            if (!seen.add(PostWords.fold(line))) {
                duplicates += wordsIn(line);
                continue;
            }
            int before = grown.length();
            if (before > 0 && grown.charAt(before - 1) != '\n') grown.append('\n');
            grown.append(line);
            PostWords.Size size = PostWords.size(grown.toString(), otherBytes);
            if (size.tooMany() || size.tooManyPatterns() || size.bytes > PostWords.MAX_LIST_BYTES) {
                grown.setLength(before);
                full = true;
                break;
            }
            added += wordsIn(line);
        }
        return new Result(added == 0 ? text : grown.toString(), added, duplicates, full);
    }
}
