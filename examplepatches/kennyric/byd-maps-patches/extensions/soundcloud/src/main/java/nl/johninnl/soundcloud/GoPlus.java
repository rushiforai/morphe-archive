package nl.johninnl.soundcloud;

/**
 * The local half of the Go feature switches in Enable SoundCloud Go.
 *
 * The /configuration response lists the client's feature switches (offline_sync,
 * no_audio_ads, hq_audio, ...) and only the app itself reads them: they are stored
 * in the app's own feature preferences and gate client behaviour such as download
 * buttons, ad requests and the high-quality audio setting. The patch routes the
 * Feature constructor's enabled flag through {@link #feature(String, boolean)}, so
 * the three switches are stored as enabled no matter what the account's plan says.
 *
 * What the switches cannot do: SoundCloud's servers decide which streams and
 * offline licences an account may fetch. High-bitrate AAC is only listed and
 * authorised for a real Go+ login, encrypted offline copies need a subscription,
 * and Go+-only tracks stay 30-second previews. The switches only change what the
 * client shows and asks for.
 */
public final class GoPlus {
    /** Feature names from SoundCloud's FeatureName constants, kept in sync by the patch. */
    private static final String OFFLINE_SYNC = "offline_sync";
    private static final String NO_AUDIO_ADS = "no_audio_ads";
    private static final String HQ_AUDIO = "hq_audio";

    private GoPlus() {}

    /**
     * The Feature(String, boolean, List) constructor's enabled flag: unchanged for
     * every feature except the three Go switches, which are always enabled.
     */
    public static boolean feature(String name, boolean enabled) {
        if (OFFLINE_SYNC.equals(name) || NO_AUDIO_ADS.equals(name) || HQ_AUDIO.equals(name)) return true;
        return enabled;
    }
}
