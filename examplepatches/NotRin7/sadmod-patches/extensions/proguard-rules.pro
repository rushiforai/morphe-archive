-keepattributes *Annotation*,InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt
-keep public class app.sadmod.client.SadModApp { public <init>(); }
-keep public class app.sadmod.client.MainActivity { public <init>(); }
-keep public class app.sadmod.client.data.download.SadModApkProvider { public <init>(); }
-keepclassmembers class kotlinx.serialization.json.** {
    *** Companion;
}
-keepclasseswithmembers class kotlinx.serialization.json.** {
    kotlinx.serialization.KSerializer serializer(...);
}
-keep,includedescriptorclasses class app.sadmod.client.data.model.**$$serializer { *; }
-keep,includedescriptorclasses class app.sadmod.client.data.bridge.**$$serializer { *; }
-keepclassmembers class app.sadmod.client.data.model.** {
    *** Companion;
}
-keepclassmembers class app.sadmod.client.data.bridge.** {
    *** Companion;
}
-keepclasseswithmembers class app.sadmod.client.data.model.** {
    kotlinx.serialization.KSerializer serializer(...);
}
-keepclasseswithmembers class app.sadmod.client.data.bridge.** {
    kotlinx.serialization.KSerializer serializer(...);
}
-keep class com.android.apksig.** { *; }
-dontwarn com.android.apksig.**
-dontwarn okhttp3.**
-dontwarn okio.**
