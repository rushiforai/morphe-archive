package app.jofslash.extension.booking;

import android.util.Log;

import java.util.ArrayList;
import java.util.List;

/**
 * Used by the Stays only patch. The home screen's row of product tabs (Stays, Flights, Car
 * rental, Taxi, Attractions, Flight + Hotel) is drawn from ProductsHeaderReactor.State, which
 * lists the products to show and the one picked. The patch keeps only Stays in that list; with one
 * product left the app draws no row, and the home screen shows the stays search.
 *
 * <p>The app opens on Stays. A link to one of the other products (such as a taxis.booking.com
 * link) opens the home screen with that product picked: then it stays in the list next to Stays,
 * so the link works and you can switch back. Once you pick Stays, the row goes again. Flights,
 * cars and attractions screens and your bookings don't read this list.
 */
@SuppressWarnings("unused")
public final class StaysOnly {
    private static final String TAG = "JoFSlash";
    /** ProductsHeaderReactor.Product.Accommodations, the Stays tab. */
    private static final String STAYS = "com.booking.appindex.productsheader.ProductsHeaderReactor$Product$Accommodations";

    private StaysOnly() {
    }

    /**
     * Called first in the State constructor with its list of products and the picked one. Returns
     * Stays, and the picked product when it isn't Stays; or the list as it is when Stays isn't
     * in it.
     */
    public static List<?> products(List<?> products, Object selected) {
        try {
            if (products == null || products.size() <= 1) return products;
            List<Object> kept = new ArrayList<>();
            for (Object product : products) {
                if (isStays(product) || isSame(product, selected)) kept.add(product);
            }
            for (Object product : kept) {
                if (isStays(product)) return kept;
            }
            return products;
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't hide the product tabs", t);
            return products;
        }
    }

    /**
     * The same product. By class, as a link's product (Taxis carries the country and an
     * experiment variant) needn't equal the one in the list.
     */
    private static boolean isSame(Object product, Object selected) {
        return product != null && selected != null
                && (product.equals(selected) || product.getClass() == selected.getClass());
    }

    private static boolean isStays(Object product) {
        return product != null && STAYS.equals(product.getClass().getName());
    }
}
