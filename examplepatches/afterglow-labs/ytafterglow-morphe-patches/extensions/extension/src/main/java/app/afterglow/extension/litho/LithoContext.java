package app.afterglow.extension.litho;

/**
 * YouTube's Litho conversion context, as the Afterglow filters see it.
 *
 * <p>The Litho filter patch adds this interface and its methods to YouTube's
 * obfuscated conversion context class ({@code Lwuw;} in 21.43.523). Each method
 * returns one of the context's fields, found from the context's own
 * {@code toString()}, so no reflection is needed at runtime.
 *
 * <p>The methods carry an {@code afterglow_} prefix so they can never collide
 * with YouTube's short obfuscated method names.
 */
public interface LithoContext {
    /** Identifier of the element the component belongs to (its {@code identifierProperty}). */
    String afterglow_getIdentifier();

    /**
     * Path of the component inside its element: the component names from the
     * root down, separated by {@code '|'}. This is YouTube's live builder; never
     * change it.
     */
    StringBuilder afterglow_getPathBuilder();

    /**
     * The context's {@code heightConstraint}. The reference patches treat null
     * as the Subscriptions or library list.
     */
    Integer afterglow_getHeightConstraint();

    /**
     * The context's {@code horizontalCollectionSwipeProtector}. The reference
     * patches treat null as the home feed or the related videos.
     */
    Object afterglow_getSwipeProtector();
}
