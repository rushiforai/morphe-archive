package app.morphe.extension.chmate;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;

public final class ReleaseFeatureOptionsTest {
    static int checks;
    static void check(boolean value, String label) {
        if (!value) throw new AssertionError(label);
        checks++;
    }
    static ReleaseHistoryText.Release release(String version) {
        return new ReleaseHistoryText.Release(version, "2026-11-13", "notes");
    }
    static void ownership(List<ReleaseHistoryText.Release> releases) {
        Set<ReleaseFeatureOptions.Option> seen = new HashSet<>();
        for (var release : releases) {
            Set<ReleaseFeatureOptions.Option> perRelease=new HashSet<>();
            for (var option : ReleaseFeatureOptions.forRelease(release, releases)) {
                check(perRelease.add(option), "only one toggle per version for " + option);
                seen.add(option);
            }
        }
        check(seen.size() == ReleaseFeatureOptions.Option.values().length, "no existing control lost");
    }
    public static void main(String[] args) throws Exception {
        var latest = release("1.27.2"); var org = release("1.26.0"); var older = release("1.25.0");
        var releases = List.of(latest, org, older);
        ownership(releases);
        check(ReleaseFeatureOptions.forRelease(latest, releases).equals(List.of(ReleaseFeatureOptions.Option.EDGE,ReleaseFeatureOptions.Option.ORG)), "changed site features have controls beside their fix");
        check(ReleaseFeatureOptions.forRelease(org, releases).equals(List.of(ReleaseFeatureOptions.Option.ORG)), "Org first stable 1.26.0");
        check(ReleaseFeatureOptions.forRelease(older, releases).contains(ReleaseFeatureOptions.Option.EDGE), "Edge first stable 1.25.0");
        var dev = release("1.26.0-dev.2"); var oldDev = release("1.26.0-dev.1");
        var all = List.of(latest, org, dev, oldDev, older);
        ownership(all);
        check(ReleaseFeatureOptions.forRelease(dev, all).isEmpty(), "stable owns its controls when dev is shown");
        var beforeStable = List.of(dev, oldDev, older);
        ownership(beforeStable);
        check(ReleaseFeatureOptions.forRelease(dev, beforeStable).equals(List.of(ReleaseFeatureOptions.Option.ORG)), "newest dev owns controls before stable publication");
        check(ReleaseFeatureOptions.forRelease(oldDev, beforeStable).isEmpty(), "older dev has no duplicate control");
        var actual = ReleaseHistoryText.parse(Files.readString(Path.of(args[0])));
        ownership(actual);
        ownership(actual.stream().filter(r -> !r.development).toList());
        var optimization=release("1.27.4");
        check(ReleaseFeatureOptions.forRelease(optimization,List.of(optimization)).equals(List.of(ReleaseFeatureOptions.Option.THREAD_THUMBNAILS)),"optimization release retains its thumbnail toggle");
        var correction=release("1.27.5");
        check(ReleaseFeatureOptions.forRelease(correction,List.of(correction)).size()==ReleaseFeatureOptions.Option.values().length,"corrected screen exposes all affected controls");
        var brief=new ReleaseHistoryText.Release("1.27.4","2026-11-13","- 最適化");
        check(ReleaseHistoryText.displayNotes(brief).contains("1レス目"),"in-app explanation remains detailed");
        check(brief.notes.equals("- 最適化"),"public notes remain brief");
        check(ReleaseHistoryText.displayNotes(older).equals(older.notes),"older details unchanged");
        for(var option:ReleaseFeatureOptions.Option.values()){
            check(!option.category().isEmpty(),"category for "+option);
            check(!option.description().isEmpty(),"explanation for "+option);
        }
        System.out.println("Release feature options: " + checks + " checks passed");
    }
}
