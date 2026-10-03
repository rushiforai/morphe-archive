package app.template.extension.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * The ordering rules, shared by every app and by the ranked list.
 *
 * <ul>
 *   <li>{@code COUNT}: most ratings first; ties go to the higher average.</li>
 *   <li>{@code RATING}: highest average first; ties go to more ratings.</li>
 *   <li>A product with nothing to sort by (no count / no rating) goes last and
 *       keeps its original order. Unknown is never treated as zero.</li>
 *   <li>The 4★+ filter drops products rated below 4.0. A product with no rating
 *       is unknown, not "below 4", so it is kept.</li>
 * </ul>
 */
final class Ranker {

    private Ranker() {}

    static final double MIN_RATING = 4.0;

    /** True when the 4★+ filter would drop a product with this rating (-1 = unknown = kept). */
    static boolean belowMin(double rating) {
        return rating > 0 && rating < MIN_RATING;
    }

    /**
     * Compares two products for {@code mode}: negative when {@code a} ranks
     * ahead of {@code b}. Unknown values (-1) compare as the worst.
     */
    static int compare(SortState.Mode mode, double ratingA, int countA, double ratingB, int countB) {
        if (mode == SortState.Mode.RATING) {
            int byRating = Double.compare(ratingB, ratingA);
            return byRating != 0 ? byRating : Integer.compare(countB, countA);
        }
        int byCount = Integer.compare(countB, countA);
        return byCount != 0 ? byCount : Double.compare(ratingB, ratingA);
    }

    /** Is there anything to sort by in this mode? */
    static boolean known(SortState.Mode mode, double rating, int count) {
        return mode == SortState.Mode.RATING ? rating > 0 : count > 0;
    }

    /**
     * The ranked view of {@code products}: filtered (optionally) and ordered by
     * {@code mode}; {@code OFF} keeps the order they were collected in.
     */
    static List<Product> rank(List<Product> products, SortState.Mode mode, boolean minFour) {
        List<Product> out = new ArrayList<>();
        for (Product p : products) {
            if (minFour && belowMin(p.rating)) continue;
            out.add(p);
        }
        if (mode == SortState.Mode.OFF) return out;
        // Stable sort: unknowns tie as the worst and keep their collected order.
        final SortState.Mode m = mode;
        Collections.sort(out, new Comparator<Product>() {
            @Override
            public int compare(Product a, Product b) {
                return Ranker.compare(m, a.rating, a.count, b.rating, b.count);
            }
        });
        return out;
    }
}
