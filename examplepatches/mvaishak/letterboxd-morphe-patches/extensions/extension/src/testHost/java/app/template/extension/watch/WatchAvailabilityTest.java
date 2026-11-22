package app.template.extension.watch;

import java.util.List;
import java.util.Set;

import static app.template.extension.watch.WatchAvailability.Kind.*;

public final class WatchAvailabilityTest {
    public static void main(String[] args) {
        var netflix = new WatchAvailability.Service(8, "Netflix", null);
        var apple = new WatchAvailability.Service(2, "Apple TV Store", null);
        var max = new WatchAvailability.Service(1899, "Max", null);
        var netflixOffer = new WatchAvailability.Offer(netflix, STREAM, "https://netflix.com/watch/123");
        var appleRent = new WatchAvailability.Offer(apple, RENT, "https://tv.apple.com/movie/123");
        var appleBuy = new WatchAvailability.Offer(apple, BUY, "https://tv.apple.com/movie/123");
        var maxOffer = new WatchAvailability.Offer(max, STREAM, "https://max.com/movies/123");
        var offers = List.of(appleRent, maxOffer, netflixOffer, netflixOffer,
                appleBuy, new WatchAvailability.Offer(apple, RENT, "https://tv.apple.com/movie/456"));

        assert WatchAvailability.selectedOffers(offers, Set.of()).isEmpty();
        var selected = WatchAvailability.selectedOffers(offers, Set.of(8, 2));
        assert selected.equals(List.of(netflixOffer, appleRent, appleBuy)) : selected;
        assert WatchAvailability.previewServices(selected, 5).equals(List.of(netflix, apple));
        assert WatchAvailability.previewServices(selected, 1).equals(List.of(netflix));
        assert WatchAvailability.previewServices(selected, 0).isEmpty();
        assert WatchAvailability.region("gb").equals("GB");
        assert WatchAvailability.region("419").equals("US");
        assert WatchAvailability.region(null).equals("US");
        var film = new WatchAvailability.Film("LID", "The Matrix", 1999, "tt0133093", "603", null);
        assert film.match("The Matrix", 1999, "tt9999999", "999") == 0;
        assert film.match("Le Matrice", 1999, "tt0133093", "603") == 2;
        assert film.match("The Matrix", 2000, null, null) == 0;
        assert film.match("the matrix", 1999, null, null) == 1;
        assert film.match("the matrix", 0, null, null) == 0;
    }
}
