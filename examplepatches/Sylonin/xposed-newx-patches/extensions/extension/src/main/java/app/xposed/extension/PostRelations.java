package app.xposed.extension;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Which post replies to or quotes which, from the posts X parsed, as X-Posed's post relations
 * cache. Only ids, author handles and languages; no text. Thread-safe.
 */
final class PostRelations {
    static final int LIMIT = 5000, MAX_DEPTH = 32, MAX_NODES = 128;

    /** One post: its author and the posts it replies to and quotes. 0 and null mean unknown. */
    static final class Relation {
        final long id, authorId, replyToId, quoteId;
        final String author, language, replyToAuthor;

        Relation(long id, long authorId, String author, String language, long replyToId, String replyToAuthor, long quoteId) {
            this.id = id;
            this.authorId = authorId;
            this.author = author;
            this.language = language;
            this.replyToId = replyToId != id ? replyToId : 0;
            this.replyToAuthor = this.replyToId != 0 ? replyToAuthor : null;
            this.quoteId = quoteId != id ? quoteId : 0;
        }

        /**
         * This post as known before, updated by what [next] knows. A sparse copy of a post
         * doesn't erase what a fuller one taught, but a new parent drops the old parent's author.
         */
        Relation merge(Relation next) {
            long reply = next.replyToId != 0 ? next.replyToId : replyToId;
            String replyAuthor = next.replyToId != 0 && next.replyToId != replyToId ? next.replyToAuthor
                    : next.replyToAuthor != null ? next.replyToAuthor : replyToAuthor;
            return new Relation(id, next.authorId != 0 ? next.authorId : authorId, next.author != null ? next.author : author,
                    next.language != null ? next.language : language, reply, replyAuthor, next.quoteId != 0 ? next.quoteId : quoteId);
        }

        private Relation withAuthor(String handle) {
            return new Relation(id, authorId, handle, language, replyToId, replyToAuthor, quoteId);
        }
    }

    /** What a related post matched: which relation led to it, and its filters. */
    static final class Source {
        final boolean quote;
        final int reasons;

        Source(boolean quote, int reasons) {
            this.quote = quote;
            this.reasons = reasons;
        }
    }

    /** The filters a related post matches, from its author and language; 0 for none or exempt. */
    interface Judge {
        int reasons(Relation post);
    }

    private final Map<Long, Relation> relations = new LinkedHashMap<Long, Relation>(256, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<Long, Relation> eldest) {
            return size() > LIMIT;
        }
    };

    void put(Relation relation) {
        if (relation.id == 0) return;
        synchronized (relations) {
            Relation before = relations.get(relation.id);
            relations.put(relation.id, before != null ? before.merge(relation) : relation);
        }
    }

    Relation get(long id) {
        synchronized (relations) {
            return relations.get(id);
        }
    }

    /**
     * The nearest post that the post [id] replies to or quotes, directly or through a chain
     * of up to {@link #MAX_DEPTH} posts, whose author matches a filter. The relation is the
     * first step from [id], as X-Posed names it. Null when none is known to match.
     */
    Source find(long id, Judge judge) {
        Relation root = get(id);
        if (root == null) return null;
        Set<Long> visited = new HashSet<>();
        visited.add(id);
        List<Relation> pending = new ArrayList<>();
        List<Integer> depths = new ArrayList<>();
        List<Boolean> viaQuote = new ArrayList<>();
        pending.add(root);
        depths.add(0);
        viaQuote.add(null);
        for (int i = 0; i < pending.size() && i < MAX_NODES; i++) {
            Relation current = pending.get(i);
            int depth = depths.get(i);
            if (depth > 0) {
                int reasons = judge.reasons(current);
                if (reasons != 0) return new Source(viaQuote.get(i), reasons);
            }
            if (depth >= MAX_DEPTH) continue;
            for (boolean quote : new boolean[]{true, false}) {
                long parentId = quote ? current.quoteId : current.replyToId;
                if (parentId == 0 || visited.contains(parentId) || visited.size() >= MAX_NODES) continue;
                visited.add(parentId);
                Relation known = get(parentId);
                String author = known != null && known.author != null ? known.author : quote ? null : current.replyToAuthor;
                // A parent known only by id has no author to judge.
                if (known == null && author == null) continue;
                pending.add(known != null ? (known.author == null ? known.withAuthor(author) : known)
                        : new Relation(parentId, 0, author, null, 0, null, 0));
                depths.add(depth + 1);
                viaQuote.add(depth == 0 ? quote : viaQuote.get(i));
            }
        }
        return null;
    }
}
