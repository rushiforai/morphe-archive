package io.github.redditnsfwonly.extension;

import com.reddit.domain.model.Link;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class BlockNsfwContentPatchTest {
    enum CellIndicatorType { APP, NSFW, ORIGINAL, QUARANTINED, SPOILER }

    static final class Edge {
        Object id;
        Object indicators;
        Edge(String id, Object indicators) { this.id = id; this.indicators = indicators; }
    }

    static final class HomeResponse {
        List<Object> edges;
        HomeResponse(Object... edges) { this.edges = new ArrayList<>(Arrays.asList(edges)); }
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    public static void main(String[] args) {
        Link nsfw = new Link(true);
        Link sfw = new Link(false);
        Object structural = new Object();
        List<?> legacy = BlockNsfwContentPatch.filterLinks(Arrays.asList(nsfw, sfw, structural));
        require(legacy.contains(nsfw), "legacy: NSFW link must survive");
        require(!legacy.contains(sfw), "legacy: SFW link must be removed");
        require(legacy.contains(structural), "legacy: non-Link structural item must survive");

        Edge nsfwEdge = new Edge("t3_nsfw", List.of(CellIndicatorType.NSFW));
        Edge sfwEdge = new Edge("t3_sfw", List.of(CellIndicatorType.SPOILER));
        Object nonPost = new Object();

        HomeResponse mixed = new HomeResponse(sfwEdge, nonPost, nsfwEdge);
        BlockNsfwContentPatch.filterHomeFeedResponse(mixed);
        require(mixed.edges.size() == 1 && mixed.edges.get(0) == nsfwEdge,
                "home: only confirmed NSFW edge survives");

        HomeResponse allSfw = new HomeResponse(
                new Edge("t3_one", List.of(CellIndicatorType.SPOILER)),
                new Edge("t3_two", List.of(CellIndicatorType.ORIGINAL)));
        BlockNsfwContentPatch.filterHomeFeedResponse(allSfw);
        require(allSfw.edges.isEmpty(), "home: all-SFW page fails closed to empty");

        HomeResponse unknownShape = new HomeResponse(new Object(), new Object());
        BlockNsfwContentPatch.filterHomeFeedResponse(unknownShape);
        require(unknownShape.edges.isEmpty(), "home: unreadable page fails closed to empty");

        System.out.println("BlockNsfwContentPatchTest: PASS");
    }
}
