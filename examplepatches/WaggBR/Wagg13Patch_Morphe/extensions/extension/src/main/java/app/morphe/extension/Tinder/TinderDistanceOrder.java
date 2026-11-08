package app.morphe.extension.tinder.patches;

import android.util.Log;

import java.lang.reflect.Field;
import java.util.List;

/**
 * Moves Tinder's Essentials card (distance, height, job, ...) above the Bio and
 * Interests cards so the distance is visible on the first profile slide.
 *
 * <p>The cards that lead the profile (name, photos and the other header cards)
 * keep their original order, and the card list is left untouched when the
 * profile has no distance.
 */
public final class TinderDistanceOrder {
    private static final String TAG = "TinderDistanceFirst";

    /** Profile field holding the formatted distance, null when the profile has none. */
    private static final String DISTANCE_FIELD = "n";

    /** Card field holding the {@code SparksCardId} of the card. */
    private static final String CARD_ID_FIELD = "c";

    private static final String ESSENTIALS = "ESSENTIALS";

    /** Cards that stay in front of the Essentials card. */
    private static final String[] HEAD_CARDS = {
            "NAME_ROW",
            "PHOTOS",
            "CHEMISTRY_EXPLANATION",
            "RELATIONSHIP_INTENT",
    };

    private TinderDistanceOrder() {}

    /**
     * Moves the Essentials card directly below the profile header cards.
     *
     * @param profile the profile model the cards were built from
     * @param cards the ordered profile detail cards about to be displayed
     */
    public static void moveEssentialsFirst(Object profile, List cards) {
        if (profile == null || cards == null || cards.size() < 2) return;

        try {
            if (!hasDistance(profile)) {
                Log.d(TAG, "no distance on this profile, keeping the default card order");
                return;
            }

            int essentials = indexOfCard(cards, ESSENTIALS);
            if (essentials < 0) {
                Log.d(TAG, "no Essentials card, keeping the default card order");
                return;
            }

            int insertAt = 0;
            while (insertAt < cards.size() && isHeadCard(cards.get(insertAt))) {
                insertAt++;
            }

            // Already above Bio and Interests.
            if (essentials <= insertAt) {
                Log.d(TAG, "Essentials already first, nothing to move");
                return;
            }

            cards.add(insertAt, cards.remove(essentials));
            Log.i(TAG, "moved Essentials from " + essentials + " to " + insertAt);
        } catch (Throwable t) {
            Log.e(TAG, "Unable to move the Essentials card", t);
        }
    }

    private static boolean hasDistance(Object profile) {
        Object distance;
        try {
            distance = readField(profile, DISTANCE_FIELD);
        } catch (Throwable t) {
            return false;
        }
        if (distance == null) return false;
        if (distance instanceof CharSequence) return ((CharSequence) distance).length() > 0;
        return true;
    }

    private static int indexOfCard(List cards, String cardId) {
        for (int i = 0; i < cards.size(); i++) {
            if (cardId.equals(cardIdOf(cards.get(i)))) return i;
        }
        return -1;
    }

    private static boolean isHeadCard(Object card) {
        String id = cardIdOf(card);
        if (id == null) return false;
        for (String headCard : HEAD_CARDS) {
            if (headCard.equals(id)) return true;
        }
        return false;
    }

    /** Returns the {@code SparksCardId} name of a card, or null for other entries. */
    private static String cardIdOf(Object card) {
        if (card == null) return null;
        try {
            Object id = readField(card, CARD_ID_FIELD);
            return id instanceof Enum ? ((Enum<?>) id).name() : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object readField(Object target, String name) throws Exception {
        Field field;
        try {
            field = target.getClass().getField(name);
        } catch (NoSuchFieldException e) {
            field = target.getClass().getDeclaredField(name);
            field.setAccessible(true);
        }
        return field.get(target);
    }
}
