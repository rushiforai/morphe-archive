package app.zonghome.extension;

final class ProfileSkipPolicy {
    static boolean shouldSkip(boolean fromPin,boolean fromNavigation){return fromPin && !fromNavigation;}
}
