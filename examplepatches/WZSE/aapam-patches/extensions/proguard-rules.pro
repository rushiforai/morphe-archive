-keep class ajstrick81.morphe.extension.primevideo.ads.SkipAdsPatch {
    public static *** skipAllMedia3AdGroups(com.google.common.collect.ImmutableMap);
    public static *** skipAllExo2AdGroups(com.google.common.collect.ImmutableMap);
    public static *** enforceAdBlock(com.android.volley.Request);
}

-keep class ajstrick81.morphe.extension.primevideo.nativehook.NativeHookLoader {
    public static void load();
}
