package app.template.extension.watch;

import java.util.List;
import java.util.Set;

import static app.template.extension.watch.WatchAvailability.Kind.*;

public final class WatchAlertRulesTest {
    public static void main(String[] args) {
        var netflix = new WatchAvailability.Service(8, "Netflix", null);
        var apple = new WatchAvailability.Service(2, "Apple TV Store", null);
        var tubi = new WatchAvailability.Service(73, "Tubi", null);
        var stream = new WatchAvailability.Offer(netflix, STREAM, "https://netflix.com/watch/1");
        var rent = new WatchAvailability.Offer(apple, RENT, "https://tv.apple.com/movie/1");
        var free = new WatchAvailability.Offer(tubi, FREE, "https://tubitv.com/movies/1");
        var offers = List.of(stream, rent, free, stream);

        assert WatchAlertRules.available(offers).equals(Set.of(8, 73));
        assert WatchAlertRules.arrival(null, offers, Set.of(8, 73)) == null;
        assert WatchAlertRules.arrival(Set.of(8, 73), offers, Set.of(8, 73)) == null;
        assert WatchAlertRules.arrival(Set.of(8), offers, Set.of(8, 73)) == free;
        assert WatchAlertRules.arrival(Set.of(8), offers, Set.of(8, 2)) == null;
        assert WatchAlertRules.arrival(Set.of(), offers, Set.of(8)) == stream;
        assert WatchAlertRules.arrival(Set.of(), offers, Set.of()) == null;

        var third = new WatchAvailability.Service(350, "Apple TV", null);
        var fourth = new WatchAvailability.Service(15, "Hulu", null);
        var thirdOffer = new WatchAvailability.Offer(third, STREAM, "https://tv.apple.com/movie/1");
        var fourthOffer = new WatchAvailability.Offer(fourth, STREAM, "https://www.hulu.com/movie/1");
        var baseline = WatchAlertRules.available(List.of(stream, free, thirdOffer));
        var favorites = Set.of(8, 73, 350, 15);
        assert WatchAlertRules.arrival(baseline, List.of(stream, free, thirdOffer), favorites) == null;
        assert WatchAlertRules.arrival(baseline, List.of(stream, free, thirdOffer, fourthOffer), favorites)
                == fourthOffer;
    }
}
