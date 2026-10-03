package app.template.extension.extension;

/**
 * What a listing says about one product, as collected for the ranked list.
 * Unknown numbers are -1 (never 0: "no rating shown" is not "rated zero").
 */
final class Product {

    final String id;
    final String title;
    /** Price in rupees, or -1. */
    final double price;
    /** Average rating 0-5, or -1. */
    final double rating;
    /** Number of ratings, or -1. */
    final int count;
    /** A link the app can open (https), or null. */
    final String url;

    Product(String id, String title, double price, double rating, int count, String url) {
        this.id = id;
        this.title = title == null || title.trim().isEmpty() ? "Product" : title.trim();
        this.price = price > 0 ? price : -1;
        this.rating = rating > 0 && rating <= 5 ? rating : -1;
        this.count = count > 0 ? count : -1;
        this.url = url;
    }

    boolean hasRating() {
        return rating > 0;
    }

    boolean hasCount() {
        return count > 0;
    }
}
