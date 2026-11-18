package io.github.sabopura.morphe.extension.twitch;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.LongSupplier;
import java.util.regex.Pattern;

/**
 * The first failure at each place, how often it came back, and the plain text a bug report gets. Only strings
 * are kept, never the failure or anything it points to, so nothing of Twitch stays reachable from here.
 */
final class FailureLog {
    private static final String EXTENSION = "io.github.sabopura.morphe.extension.";
    private static final String OWN = EXTENSION + "twitch.";
    private static final int MAX_MESSAGE = 160;
    private static final Pattern SPACES = Pattern.compile("\\s+");
    /** What a message quotes from its input; org.json even quotes the whole text it could not parse. */
    private static final Pattern QUOTED = Pattern.compile("\"[^\"]*(\"|$)");
    /** The query or fragment after a path, where tokens and signatures travel. */
    private static final Pattern QUERY = Pattern.compile("(\\S*/\\S*?)[?#]\\S*");

    /** One place, as it was when read. */
    static final class Place {
        final String name, failure, frame;
        final long firstAt;
        final int times;

        private Place(String name, String failure, String frame, long firstAt, int times) {
            this.name = name;
            this.failure = failure;
            this.frame = frame;
            this.firstAt = firstAt;
            this.times = times;
        }

        String line() {
            return name + ": " + failure + (frame.isEmpty() ? "" : " at " + frame);
        }
    }

    private static final class Slot {
        final Place first;
        final int order;
        final AtomicInteger times = new AtomicInteger(1);

        Slot(Place first, int order) {
            this.first = first;
            this.order = order;
        }
    }

    private final int limit;
    private final LongSupplier clock;
    private final ConcurrentHashMap<String, Slot> slots = new ConcurrentHashMap<>();
    private final AtomicInteger unrecorded = new AtomicInteger();

    FailureLog(int limit, LongSupplier clock) {
        this.limit = limit;
        this.clock = clock;
    }

    /** The new place when this is the first failure there; null when it repeats or no place is left. */
    Place record(String place, Throwable failure) {
        Slot slot = slots.get(place);
        if (slot != null) {
            slot.times.incrementAndGet();
            return null;
        }
        if (slots.size() >= limit) {
            unrecorded.incrementAndGet();
            return null;
        }
        synchronized (this) {
            slot = slots.get(place);
            if (slot == null) {
                if (slots.size() >= limit) {
                    unrecorded.incrementAndGet();
                    return null;
                }
                slot = new Slot(new Place(place, describe(failure), frame(failure), clock.getAsLong(), 1), slots.size());
                slots.put(place, slot);
                return slot.first;
            }
        }
        slot.times.incrementAndGet();
        return null;
    }

    int size() {
        return slots.size();
    }

    /** Failures at further places once every place was taken. */
    int unrecorded() {
        return unrecorded.get();
    }

    /** The places in the order they first failed. */
    List<Place> places() {
        List<Slot> sorted = new ArrayList<>(slots.values());
        Collections.sort(sorted, (a, b) -> Integer.compare(a.order, b.order));
        List<Place> out = new ArrayList<>(sorted.size());
        for (Slot slot : sorted) {
            Place first = slot.first;
            out.add(new Place(first.name, first.failure, first.frame, first.firstAt, slot.times.get()));
        }
        return Collections.unmodifiableList(out);
    }

    /** {@code about} first, then each place with its failure and the patch's own code line it came through. */
    static String format(List<String> about, List<Place> places, int unrecorded) {
        StringBuilder out = new StringBuilder();
        for (String line : about) out.append(line).append('\n');
        out.append('\n');
        if (places.isEmpty()) return out.append("No problems recorded.").toString();
        out.append("Places that did not work: ").append(places.size()).append('\n');
        int number = 0;
        for (Place place : places) {
            out.append('\n').append(++number).append(". ").append(place.name).append(": ")
                    .append(place.times == 1 ? "once" : place.times + " times")
                    .append(String.format(Locale.ROOT, ", first at %tT", place.firstAt)).append('\n')
                    .append("   ").append(place.failure).append('\n');
            if (!place.frame.isEmpty()) out.append("   at ").append(place.frame).append('\n');
        }
        if (unrecorded > 0) out.append("\nFailures at places not listed: ").append(unrecorded).append('\n');
        return out.toString().trim();
    }

    /** Class and message, and the cause's when there is one. */
    static String describe(Throwable failure) {
        String text = summary(failure);
        Throwable cause = failure.getCause();
        return cause == null || cause == failure ? text : text + "; caused by " + summary(cause);
    }

    private static String summary(Throwable failure) {
        String message = failure.getMessage();
        return message == null ? failure.getClass().getName() : failure.getClass().getName() + ": " + clean(message);
    }

    /** One short line, without anything quoted and without the query of anything URL-like. */
    static String clean(String message) {
        String text = message.length() > 4 * MAX_MESSAGE ? message.substring(0, 4 * MAX_MESSAGE) : message;
        text = SPACES.matcher(text).replaceAll(" ").trim();
        text = QUERY.matcher(QUOTED.matcher(text).replaceAll("\"…\"")).replaceAll("$1");
        return text.length() <= MAX_MESSAGE ? text : text.substring(0, MAX_MESSAGE - 1) + "…";
    }

    /** The first line of the patch's own code the failure went through; Twitch's code is never shown. */
    static String frame(Throwable failure) {
        for (StackTraceElement element : failure.getStackTrace()) {
            if (!element.getClassName().startsWith(EXTENSION)) continue;
            String text = element.toString();
            return text.startsWith(OWN) ? text.substring(OWN.length()) : text;
        }
        return "";
    }
}
