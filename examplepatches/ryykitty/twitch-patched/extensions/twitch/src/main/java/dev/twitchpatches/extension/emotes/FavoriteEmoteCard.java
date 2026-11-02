package dev.twitchpatches.extension.emotes;

import android.view.View;

public final class FavoriteEmoteCard {
    private static final String STAR = "twitch_patches_favorite_emote_star";

    private FavoriteEmoteCard() { }

    public static void bind(View root, Object cardState) {
        String id = FavoriteEmoteBridge.cardEmoteId(cardState);
        if (id == null) {
            bindStar(root, null, null);
            return;
        }
        bindStar(root, FavoriteEmoteKeys.ofTwitchEmote(id), FavoriteEmoteDetails.of(FavoriteEmoteBridge.cardEmoteToken(cardState),
                FavoriteEmoteBridge.cardChannel(cardState), FavoriteEmoteBridge.cardKind(cardState)));
    }

    static void bindProvider(View root, Emote emote) {
        bindStar(root, FavoriteEmoteKeys.ofProviderImage(emote.url), null);
    }

    private static void bindStar(View root, String key, FavoriteEmoteDetails details) {
        int id = root.getResources().getIdentifier(STAR, "id", root.getContext().getPackageName());
        View star = id == 0 ? null : root.findViewById(id);
        if (star == null) return;
        boolean shown = FavoriteEmotes.enabled() && key != null;
        star.setVisibility(shown ? View.VISIBLE : View.GONE);
        if (!shown) return;
        update(star, key);
        star.setOnClickListener(clicked -> {
            FavoriteEmotes.toggle(key, details);
            update(star, key);
        });
    }

    private static void update(View star, String key) {
        boolean favorite = FavoriteEmotes.keys().contains(key);
        star.setSelected(favorite);
        star.setContentDescription(favorite ? "Remove from Favorites" : "Add to Favorites");
    }
}
