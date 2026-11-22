package app.template.extension.watch;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

final class WatchAvailability {
    enum Kind { STREAM, FREE, RENT, BUY, CINEMA }

    static final class Service {
        private final int id;
        private final String name, icon;

        Service(int id, String name, String icon) {
            this.id = id;
            this.name = name;
            this.icon = icon;
        }

        int id() { return id; }
        String name() { return name; }
        String icon() { return icon; }
    }

    static final class Offer {
        private final Service service;
        private final Kind kind;
        private final String url;

        Offer(Service service, Kind kind, String url) {
            this.service = service;
            this.kind = kind;
            this.url = url;
        }

        Service service() { return service; }
        Kind kind() { return kind; }
        String url() { return url; }
    }

    static final class Film {
        private final String id, title, imdb, tmdb, justWatch;
        private final int year;

        Film(String id, String title, int year, String imdb, String tmdb, String justWatch) {
            this.id = id;
            this.title = title;
            this.year = year;
            this.imdb = imdb;
            this.tmdb = tmdb;
            this.justWatch = justWatch;
        }

        String id() { return id; }
        String title() { return title; }
        int year() { return year; }
        String imdb() { return imdb; }
        String tmdb() { return tmdb; }
        String justWatch() { return justWatch; }

        boolean sameFilm(Film other) {
            return id.equals(other.id) && title.equals(other.title) && year == other.year
                    && Objects.equals(imdb, other.imdb) && Objects.equals(tmdb, other.tmdb)
                    && Objects.equals(justWatch, other.justWatch);
        }

        int match(String candidate, int releaseYear, String candidateImdb, String candidateTmdb) {
            if (imdb != null && candidateImdb != null) return imdb.equals(candidateImdb) ? 2 : 0;
            if (tmdb != null && candidateTmdb != null) return tmdb.equals(candidateTmdb) ? 2 : 0;
            return year > 0 && year == releaseYear && title.equalsIgnoreCase(candidate) ? 1 : 0;
        }
    }

    static final class Result {
        private final String justWatch;
        private final List<Offer> offers;

        Result(String justWatch, List<Offer> offers) {
            this.justWatch = justWatch;
            this.offers = offers;
        }

        String justWatch() { return justWatch; }
        List<Offer> offers() { return offers; }
    }

    private WatchAvailability() {}

    static String region(String value) {
        return value != null && value.matches("[a-zA-Z]{2}")
                ? value.toUpperCase(Locale.ROOT) : "US";
    }

    static List<Offer> selectedOffers(List<Offer> offers, Set<Integer> selected) {
        Map<Kind, Map<Integer, Offer>> groups = new EnumMap<>(Kind.class);
        for (Offer offer : offers) {
            int id = offer.service().id();
            if (selected.contains(id)) {
                groups.computeIfAbsent(offer.kind(), ignored -> new LinkedHashMap<>())
                        .putIfAbsent(id, offer);
            }
        }
        List<Offer> result = new ArrayList<>();
        for (Map<Integer, Offer> group : groups.values()) {
            List<Offer> sorted = new ArrayList<>(group.values());
            sorted.sort(Comparator.comparing(offer -> offer.service().name(),
                    String.CASE_INSENSITIVE_ORDER));
            result.addAll(sorted);
        }
        return result;
    }

    static List<Service> previewServices(List<Offer> offers, int limit) {
        Map<Integer, Service> services = new LinkedHashMap<>();
        for (Offer offer : offers) {
            if (services.size() >= limit) break;
            Service service = offer.service();
            services.putIfAbsent(service.id(), service);
        }
        return new ArrayList<>(services.values());
    }
}
