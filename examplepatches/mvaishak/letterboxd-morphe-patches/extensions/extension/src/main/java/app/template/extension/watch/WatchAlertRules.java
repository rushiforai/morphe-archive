package app.template.extension.watch;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static app.template.extension.watch.WatchAvailability.*;

final class WatchAlertRules {
    private WatchAlertRules() {}

    static Set<Integer> available(List<Offer> offers) {
        Set<Integer> services = new HashSet<>();
        for (Offer offer : offers) {
            if (streams(offer)) services.add(offer.service().id());
        }
        return services;
    }

    static Offer arrival(Set<Integer> previous, List<Offer> offers, Set<Integer> favorites) {
        if (previous == null) return null;
        for (Offer offer : offers) {
            int service = offer.service().id();
            if (streams(offer) && favorites.contains(service) && !previous.contains(service)) return offer;
        }
        return null;
    }

    private static boolean streams(Offer offer) {
        return offer.kind() == Kind.STREAM || offer.kind() == Kind.FREE;
    }
}
