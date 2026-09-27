.class public final Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;
.super Ljava/lang/Object;
.source "DeepSeekCaptionResourcePatch.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDeepSeekCaptionResourcePatch.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DeepSeekCaptionResourcePatch.kt\napp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,307:1\n1#2:308\n2068#3,2:309\n*S KotlinDebug\n*F\n+ 1 DeepSeekCaptionResourcePatch.kt\napp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt\n*L\n293#1:309,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0005\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0007\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0008\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\t\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\n\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000b\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000c\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\r\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u000e\u001a\u00020\u0001X\u0082T\u00a2\u0006\u0002\n\u0000\"\u0014\u0010\u000f\u001a\u00020\u0010X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "LEGACY_PREF_KEY",
        "",
        "LEGACY_PREF_CLASS",
        "PREF_KEY",
        "ENABLED_PREF_CLASS",
        "TEXT_PREF_CLASS",
        "MODEL_PREF_CLASS",
        "SLIDER_PREF_CLASS",
        "ACTION_PREF_CLASS",
        "DIAGNOSTICS_PREF_CLASS",
        "DISPLAY_TEXT_DEBUG_PREF_CLASS",
        "NETWORK_SECURITY_ATTRIBUTE",
        "LOOPBACK_CONFIG_NAME",
        "ICON_NAME",
        "ICON_BOLD_NAME",
        "deepSeekCaptionResourcePatch",
        "Lapp/morphe/patcher/patch/ResourcePatch;",
        "getDeepSeekCaptionResourcePatch",
        "()Lapp/morphe/patcher/patch/ResourcePatch;",
        "app.yydarlinker:patches"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final ACTION_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekActionPreference"

.field private static final DIAGNOSTICS_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekDiagnosticsPreference"

.field private static final DISPLAY_TEXT_DEBUG_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekDisplayTextDebugPreference"

.field private static final ENABLED_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekEnabledPreference"

.field private static final ICON_BOLD_NAME:Ljava/lang/String; = "deepseek_caption_settings_bold"

.field private static final ICON_NAME:Ljava/lang/String; = "deepseek_caption_settings"

.field private static final LEGACY_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekCaptionPreference"

.field private static final LEGACY_PREF_KEY:Ljava/lang/String; = "morphe_deepseek_caption_translator"

.field private static final LOOPBACK_CONFIG_NAME:Ljava/lang/String; = "deepseek_caption_network_security.xml"

.field private static final MODEL_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekModelPreference"

.field private static final NETWORK_SECURITY_ATTRIBUTE:Ljava/lang/String; = "android:networkSecurityConfig"

.field private static final PREF_KEY:Ljava/lang/String; = "morphe_settings_screen_13_ai_captions"

.field private static final SLIDER_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekSliderPreference"

.field private static final TEXT_PREF_CLASS:Ljava/lang/String; = "app.yydarlinker.deepseekcaptions.DeepSeekTextPreference"

.field private static final deepSeekCaptionResourcePatch:Lapp/morphe/patcher/patch/ResourcePatch;


# direct methods
.method public static synthetic $r8$lambda$LvxxO4uroXqyWJUw5cl5VWATYcA(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$wpP-zDvAM7YnX82pShGW6FCO9k0(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$0(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 6

    .line 30
    new-instance v3, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt$0;

    invoke-direct {v3}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt$0;-><init>()V

    const/4 v4, 0x5

    const/4 v5, 0x0

    const/4 v0, 0x0

    const-string v1, "Adds an icon-backed, auto-saving AI caption screen to Morphe settings."

    const/4 v2, 0x0

    invoke-static/range {v0 .. v5}, Lapp/morphe/patcher/patch/PatchKt;->resourcePatch$default(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lapp/morphe/patcher/patch/ResourcePatch;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch:Lapp/morphe/patcher/patch/ResourcePatch;

    return-void
.end method

.method static final deepSeekCaptionResourcePatch$lambda$0(Lapp/morphe/patcher/patch/ResourcePatchBuilder;)Lkotlin/Unit;
    .registers 2

    const-string v0, "$this$resourcePatch"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt$1;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt$1;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/ResourcePatchBuilder;->execute(Lkotlin/jvm/functions/Function1;)V

    .line 117
    new-instance v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt$2;

    invoke-direct {v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt$2;-><init>()V

    invoke-virtual {p0, v0}, Lapp/morphe/patcher/patch/ResourcePatchBuilder;->finalize(Lkotlin/jvm/functions/Function1;)V

    .line 304
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final deepSeekCaptionResourcePatch$lambda$0$0(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 15

    const-string v0, "null cannot be cast to non-null type org.w3c.dom.Element"

    const-string v1, "deepseek_caption_network_security.xml"

    const-string v2, "android:networkSecurityConfig"

    const-string v3, "Invalid network security config: "

    const-string v4, "@xml/"

    const-string v5, "$this$execute"

    invoke-static {p0, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    const-string v5, "res/xml"

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-static {p0, v5, v6, v7, v8}, Lapp/morphe/patcher/patch/ResourcePatchContext;->get$default(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;ZILjava/lang/Object;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 41
    const-string v9, "AndroidManifest.xml"

    invoke-virtual {p0, v9}, Lapp/morphe/patcher/patch/ResourcePatchContext;->document(Ljava/lang/String;)Lapp/morphe/patcher/util/Document;

    move-result-object v9

    check-cast v9, Ljava/io/Closeable;

    :try_start_23
    move-object v10, v9

    check-cast v10, Lapp/morphe/patcher/util/Document;

    .line 42
    const-string v11, "application"

    invoke-virtual {v10, v11}, Lapp/morphe/patcher/util/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v10

    invoke-interface {v10, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v10

    instance-of v11, v10, Lorg/w3c/dom/Element;

    if-eqz v11, :cond_37

    check-cast v10, Lorg/w3c/dom/Element;

    goto :goto_38

    :cond_37
    move-object v10, v8

    :goto_38
    if-eqz v10, :cond_119

    .line 46
    invoke-interface {v10, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 47
    invoke-static {v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v11, v4, v6, v7, v8}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v12
    :try_end_45
    .catchall {:try_start_23 .. :try_end_45} :catchall_121

    const-string v13, ".xml"

    if-eqz v12, :cond_5f

    .line 48
    :try_start_49
    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v11, v4}, Lkotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_7e

    .line 49
    :cond_5f
    check-cast v11, Ljava/lang/CharSequence;

    invoke-static {v11}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_7d

    .line 53
    check-cast v13, Ljava/lang/CharSequence;

    invoke-static {v1, v13}, Lkotlin/text/StringsKt;->removeSuffix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 51
    invoke-interface {v10, v2, v4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7e

    :cond_7d
    move-object v1, v8

    .line 56
    :goto_7e
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_80
    .catchall {:try_start_49 .. :try_end_80} :catchall_121

    .line 41
    invoke-static {v9, v8}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    if-eqz v1, :cond_f7

    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "res/xml/"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 60
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v5, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 61
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_f2

    .line 62
    invoke-virtual {p0, v2}, Lapp/morphe/patcher/patch/ResourcePatchContext;->document(Ljava/lang/String;)Lapp/morphe/patcher/util/Document;

    move-result-object v1

    check-cast v1, Ljava/io/Closeable;

    :try_start_a4
    move-object v4, v1

    check-cast v4, Lapp/morphe/patcher/util/Document;

    .line 63
    invoke-virtual {v4}, Lapp/morphe/patcher/util/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v5

    if-eqz v5, :cond_d9

    .line 65
    const-string v2, "domain-config"

    invoke-virtual {v4, v2}, Lapp/morphe/patcher/util/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    const-string v3, "cleartextTrafficPermitted"

    const-string v9, "true"

    invoke-interface {v2, v3, v9}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string v3, "domain"

    invoke-virtual {v4, v3}, Lapp/morphe/patcher/util/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    const-string v0, "127.0.0.1"

    invoke-interface {v3, v0}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 69
    check-cast v3, Lorg/w3c/dom/Node;

    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 70
    check-cast v2, Lorg/w3c/dom/Node;

    invoke-interface {v5, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_d5
    .catchall {:try_start_a4 .. :try_end_d5} :catchall_eb

    .line 62
    invoke-static {v1, v8}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto :goto_f7

    .line 64
    :cond_d9
    :try_start_d9
    new-instance p0, Lapp/morphe/patcher/patch/PatchException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_eb
    .catchall {:try_start_d9 .. :try_end_eb} :catchall_eb

    :catchall_eb
    move-exception p0

    .line 62
    :try_start_ec
    throw p0
    :try_end_ed
    .catchall {:try_start_ec .. :try_end_ed} :catchall_ed

    :catchall_ed
    move-exception v0

    invoke-static {v1, p0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    .line 74
    :cond_f2
    const-string v0, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<network-security-config>\n    <base-config cleartextTrafficPermitted=\"false\">\n        <trust-anchors>\n            <certificates src=\"system\" />\n        </trust-anchors>\n    </base-config>\n    <domain-config cleartextTrafficPermitted=\"true\"><domain>127.0.0.1</domain></domain-config>\n</network-security-config>\n"

    .line 73
    invoke-static {v4, v0, v8, v7, v8}, Lkotlin/io/FilesKt;->writeText$default(Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;ILjava/lang/Object;)V

    .line 88
    :cond_f7
    :goto_f7
    const-string v0, "res/drawable"

    invoke-static {p0, v0, v6, v7, v8}, Lapp/morphe/patcher/patch/ResourcePatchContext;->get$default(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;ZILjava/lang/Object;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 89
    new-instance v0, Ljava/io/File;

    const-string v1, "deepseek_caption_settings.xml"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v1, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<vector xmlns:android=\"http://schemas.android.com/apk/res/android\"\n    android:width=\"24dp\"\n    android:height=\"24dp\"\n    android:viewportWidth=\"24\"\n    android:viewportHeight=\"24\">\n    <path\n        android:fillColor=\"?android:attr/textColorPrimary\"\n        android:pathData=\"M3,5L17,5L17,17L8,17L4,21L4,17L3,17ZM5,7L5,15L15,15L15,7ZM6,9L14,9L14,10.5L6,10.5ZM6,12L12,12L12,13.5L6,13.5ZM20,1L21,4L24,5L21,6L20,9L19,6L16,5L19,4Z\" />\n</vector>\n"

    invoke-static {v0, v1, v8, v7, v8}, Lkotlin/io/FilesKt;->writeText$default(Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;ILjava/lang/Object;)V

    .line 102
    new-instance v0, Ljava/io/File;

    const-string v2, "deepseek_caption_settings_bold.xml"

    invoke-direct {v0, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, v1, v8, v7, v8}, Lkotlin/io/FilesKt;->writeText$default(Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;ILjava/lang/Object;)V

    .line 115
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    .line 43
    :cond_119
    :try_start_119
    new-instance p0, Lapp/morphe/patcher/patch/PatchException;

    const-string v0, "YouTube manifest has no <application>"

    invoke-direct {p0, v0}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_121
    .catchall {:try_start_119 .. :try_end_121} :catchall_121

    :catchall_121
    move-exception p0

    .line 41
    :try_start_122
    throw p0
    :try_end_123
    .catchall {:try_start_122 .. :try_end_123} :catchall_123

    :catchall_123
    move-exception v0

    invoke-static {v9, p0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static final deepSeekCaptionResourcePatch$lambda$0$1(Lapp/morphe/patcher/patch/ResourcePatchContext;)Lkotlin/Unit;
    .registers 8

    const-string v0, "$this$finalize"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    const-string v0, "res/xml/morphe_prefs.xml"

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-static {p0, v0, v1, v2, v1}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreferenceScreen$default(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z

    move-result v0

    .line 282
    const-string v3, "res/xml/morphe_prefs_icons.xml"

    const-string v4, "deepseek_caption_settings"

    invoke-static {p0, v3, v4}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreferenceScreen(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_1e

    if-eqz v0, :cond_1c

    goto :goto_1e

    :cond_1c
    move v0, v5

    goto :goto_1f

    :cond_1e
    :goto_1e
    move v0, v4

    .line 285
    :goto_1f
    const-string v3, "res/xml/morphe_prefs_icons_bold.xml"

    const-string v6, "deepseek_caption_settings_bold"

    invoke-static {p0, v3, v6}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreferenceScreen(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_60

    if-eqz v0, :cond_2c

    goto :goto_60

    .line 291
    :cond_2c
    const-string v0, "res/xml/settings_fragment.xml"

    .line 292
    const-string v3, "res/xml/settings_fragment_cairo.xml"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    .line 290
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .line 309
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3e
    move v3, v5

    :goto_3f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_55

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 294
    invoke-static {p0, v6, v1, v2, v1}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreferenceScreen$default(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_53

    if-eqz v3, :cond_3e

    :cond_53
    move v3, v4

    goto :goto_3f

    :cond_55
    if-eqz v3, :cond_58

    goto :goto_60

    .line 297
    :cond_58
    new-instance p0, Lapp/morphe/patcher/patch/PatchException;

    .line 298
    const-string v0, "Could not find Morphe or YouTube settings XML. Select the official Morphe settings patch together with AI caption translator."

    .line 297
    invoke-direct {p0, v0}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 303
    :cond_60
    :goto_60
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final deepSeekCaptionResourcePatch$lambda$0$1$addCategory(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 4

    .line 133
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    const-string v1, "PreferenceCategory"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 134
    const-string v1, "android:title"

    invoke-static {p1}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionResourceTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    move-object p1, v0

    check-cast p1, Lorg/w3c/dom/Node;

    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 136
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v0
.end method

.method private static final deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 6

    .line 124
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    .line 125
    const-string v0, "android:key"

    invoke-interface {p1, v0, p2}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    const-string p2, "android:title"

    invoke-static {p3}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionResourceTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p4, :cond_21

    .line 127
    const-string p2, "android:summary"

    invoke-static {p4}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionLocalizationPatchKt;->captionResourceTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    :cond_21
    move-object p2, p1

    check-cast p2, Lorg/w3c/dom/Node;

    invoke-interface {p0, p2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 129
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object p1
.end method

.method static synthetic deepSeekCaptionResourcePatch$lambda$0$1$addPreference$default(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/w3c/dom/Element;
    .registers 7

    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_5

    const/4 p4, 0x0

    .line 118
    :cond_5
    invoke-static {p0, p1, p2, p3, p4}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    return-object p0
.end method

.method private static final deepSeekCaptionResourcePatch$lambda$0$1$addPreferenceScreen(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 26

    move-object/from16 v0, p2

    .line 140
    const-string v1, "app.yydarlinker.deepseekcaptions.DeepSeekSliderPreference"

    const-string v2, "app.yydarlinker.deepseekcaptions.DeepSeekActionPreference"

    const-string v3, "app.yydarlinker.deepseekcaptions.DeepSeekTextPreference"

    const-string v4, "\u5728\u64ad\u653e\u5668\u5f39\u51fa\u83dc\u5355\u4e2d\u663e\u793a\u5feb\u6377\u5f00\u5173\uff1b\u9690\u85cf\u4e0d\u5173\u95ed AI \u5b57\u5e55\uff0c\u4e0b\u6b21\u6253\u5f00\u83dc\u5355\u751f\u6548"

    const/4 v5, 0x0

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-virtual {v6, v7, v5}, Lapp/morphe/patcher/patch/ResourcePatchContext;->get(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v8

    .line 141
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_1a

    return v5

    .line 143
    :cond_1a
    invoke-virtual/range {p0 .. p1}, Lapp/morphe/patcher/patch/ResourcePatchContext;->document(Ljava/lang/String;)Lapp/morphe/patcher/util/Document;

    move-result-object v6

    check-cast v6, Ljava/io/Closeable;

    :try_start_20
    move-object v7, v6

    check-cast v7, Lapp/morphe/patcher/util/Document;

    .line 144
    invoke-virtual {v7}, Lapp/morphe/patcher/util/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v8
    :try_end_27
    .catchall {:try_start_20 .. :try_end_27} :catchall_1ba

    const/4 v9, 0x0

    if-nez v8, :cond_2e

    .line 143
    invoke-static {v6, v9}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return v5

    .line 147
    :cond_2e
    :try_start_2e
    const-string v5, "*"

    invoke-virtual {v7, v5}, Lapp/morphe/patcher/util/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 148
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10
    :try_end_38
    .catchall {:try_start_2e .. :try_end_38} :catchall_1ba

    const/4 v11, 0x1

    sub-int/2addr v10, v11

    :goto_3a
    const-string v12, "morphe_settings_screen_13_ai_captions"

    const/4 v13, -0x1

    const-string v14, "android:key"

    if-ge v13, v10, :cond_8a

    .line 149
    :try_start_41
    invoke-interface {v5, v10}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v13

    .line 150
    instance-of v15, v13, Lorg/w3c/dom/Element;

    if-eqz v15, :cond_83

    .line 151
    move-object v15, v13

    check-cast v15, Lorg/w3c/dom/Element;

    invoke-interface {v15}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v15

    move/from16 p0, v11

    const-string v11, "app.yydarlinker.deepseekcaptions.DeepSeekCaptionPreference"

    invoke-static {v15, v11}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_76

    .line 152
    move-object v11, v13

    check-cast v11, Lorg/w3c/dom/Element;

    invoke-interface {v11, v14}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v15, "morphe_deepseek_caption_translator"

    invoke-static {v11, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_76

    .line 153
    move-object v11, v13

    check-cast v11, Lorg/w3c/dom/Element;

    invoke-interface {v11, v14}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11, v12}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_85

    .line 155
    :cond_76
    move-object v11, v13

    check-cast v11, Lorg/w3c/dom/Element;

    invoke-interface {v11}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v11

    if-eqz v11, :cond_85

    invoke-interface {v11, v13}, Lorg/w3c/dom/Node;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_85

    :cond_83
    move/from16 p0, v11

    :cond_85
    :goto_85
    add-int/lit8 v10, v10, -0x1

    move/from16 v11, p0

    goto :goto_3a

    :cond_8a
    move/from16 p0, v11

    .line 159
    const-string v5, "PreferenceScreen"

    invoke-virtual {v7, v5}, Lapp/morphe/patcher/util/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v15

    .line 160
    invoke-interface {v15, v14, v12}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    const-string v5, "android:title"

    const-string v7, "@string/cap_ai_title"

    invoke-interface {v15, v5, v7}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const-string v5, "android:summary"

    const-string v7, "@string/cap_autosave"

    invoke-interface {v15, v5, v7}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_c9

    .line 164
    const-string v5, "android:icon"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "@drawable/"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v15, v5, v0}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    const-string v0, "app:iconSpaceReserved"

    const-string v5, "true"

    invoke-interface {v15, v0, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    const-string v0, "android:layout"

    const-string v5, "@layout/preference_with_icon"

    invoke-interface {v15, v0, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    :cond_c9
    invoke-static {v15}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 170
    const-string v16, "app.yydarlinker.deepseekcaptions.DeepSeekEnabledPreference"

    .line 171
    const-string v17, "deepseek_caption_enabled"

    .line 172
    const-string v18, "\u542f\u7528 AI \u5b57\u5e55\u7ffb\u8bd1"

    const/16 v20, 0x8

    const/16 v21, 0x0

    const/16 v19, 0x0

    .line 169
    invoke-static/range {v15 .. v21}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference$default(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/w3c/dom/Element;

    .line 176
    const-string v0, "app.yydarlinker.deepseekcaptions.CaptionFlyoutPreference"

    .line 177
    const-string v5, "deepseek_caption_flyout_menu"

    .line 178
    const-string v7, "\u666e\u901a\u89c6\u9891\u5f39\u51fa\u83dc\u5355\u4e2d\u7684 AI \u5b57\u5e55\u5f00\u5173"

    .line 175
    invoke-static {v15, v0, v5, v7, v4}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 183
    const-string v0, "app.yydarlinker.deepseekcaptions.CaptionShortsFlyoutPreference"

    .line 184
    const-string v5, "deepseek_caption_shorts_flyout_menu"

    .line 185
    const-string v7, "Shorts \u5f39\u51fa\u83dc\u5355\u4e2d\u7684 AI \u5b57\u5e55\u5f00\u5173"

    .line 182
    invoke-static {v15, v0, v5, v7, v4}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 189
    const-string v0, "API \u914d\u7f6e"

    invoke-static {v15, v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addCategory(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v16

    .line 190
    const-string v17, "app.yydarlinker.deepseekcaptions.ApiProfilesPreference"

    .line 191
    const-string v18, "deepseek_caption_profiles"

    const-string v19, "API \u914d\u7f6e\u65b9\u6848"

    const/16 v21, 0x8

    const/16 v22, 0x0

    const/16 v20, 0x0

    .line 190
    invoke-static/range {v16 .. v22}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference$default(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/w3c/dom/Element;

    move-object/from16 v0, v16

    .line 194
    const-string v4, "deepseek_caption_base_url"

    .line 195
    const-string v5, "API \u5730\u5740"

    .line 196
    const-string v7, "\u586b\u5199\u517c\u5bb9\u63a5\u53e3\u5730\u5740\uff0c\u505c\u6b62\u8f93\u5165\u540e\u81ea\u52a8\u4fdd\u5b58"

    .line 192
    invoke-static {v0, v3, v4, v5, v7}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 199
    const-string v17, "app.yydarlinker.deepseekcaptions.ApiKeyPreference"

    .line 200
    const-string v18, "deepseek_caption_api_key"

    .line 201
    const-string v19, "API Key"

    const/16 v21, 0x8

    const/16 v22, 0x0

    const/16 v20, 0x0

    move-object/from16 v16, v0

    .line 198
    invoke-static/range {v16 .. v22}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference$default(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/w3c/dom/Element;

    .line 204
    const-string v4, "app.yydarlinker.deepseekcaptions.DeepSeekModelPreference"

    .line 205
    const-string v5, "deepseek_caption_model"

    .line 206
    const-string v7, "\u6a21\u578b"

    .line 207
    const-string v10, "\u81ea\u52a8\u83b7\u53d6\u53ef\u7528\u6a21\u578b\uff0c\u4e5f\u652f\u6301\u624b\u52a8\u8f93\u5165"

    .line 203
    invoke-static {v0, v4, v5, v7, v10}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 211
    const-string v4, "deepseek_caption_test_api"

    .line 212
    const-string v5, "\u6d4b\u8bd5 API"

    .line 213
    const-string v7, "\u4f7f\u7528\u5f53\u524d\u5df2\u81ea\u52a8\u4fdd\u5b58\u7684\u914d\u7f6e\u6d4b\u8bd5\u8fde\u63a5"

    .line 209
    invoke-static {v0, v2, v4, v5, v7}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 216
    const-string v17, "app.yydarlinker.deepseekcaptions.DeepSeekActionPreference"

    .line 217
    const-string v18, "deepseek_caption_delete_key"

    .line 218
    const-string v19, "\u6e05\u9664\u672c\u65b9\u6848\u7684 API Key"

    const/16 v21, 0x8

    const/16 v22, 0x0

    const/16 v20, 0x0

    move-object/from16 v16, v0

    .line 215
    invoke-static/range {v16 .. v22}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference$default(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/w3c/dom/Element;

    .line 222
    const-string v0, "\u7ffb\u8bd1"

    invoke-static {v15, v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addCategory(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 225
    const-string v4, "deepseek_caption_prompt"

    .line 226
    const-string v5, "\u7ffb\u8bd1\u8981\u6c42"

    .line 227
    const-string v7, "\u5404\u65b9\u6848\u72ec\u7acb\u4fdd\u5b58\uff1b\u6e05\u7a7a\u6062\u590d\u968f\u754c\u9762\u8bed\u8a00\u53d8\u5316\u7684\u9ed8\u8ba4\u8981\u6c42"

    .line 223
    invoke-static {v0, v3, v4, v5, v7}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 231
    const-string v0, "\u5b57\u5e55\u6837\u5f0f"

    invoke-static {v15, v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addCategory(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v16

    .line 232
    const-string v17, "app.yydarlinker.deepseekcaptions.SubtitleStylePreview"

    .line 233
    const-string v18, "deepseek_caption_style_preview"

    const-string v19, "\u5b57\u5e55\u9884\u89c8"

    const/16 v21, 0x8

    const/16 v22, 0x0

    const/16 v20, 0x0

    .line 232
    invoke-static/range {v16 .. v22}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference$default(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/w3c/dom/Element;

    move-object/from16 v0, v16

    .line 236
    const-string v3, "deepseek_caption_text_size"

    .line 237
    const-string v4, "\u5b57\u5e55\u5927\u5c0f"

    .line 238
    const-string v5, "\u76f8\u5bf9\u5b57\u53f7 8\u201315\uff1b13sp \u4e3a\u8212\u9002\u57fa\u51c6\uff0c\u968f\u753b\u9762\u6bd4\u4f8b\u7f29\u653e"

    .line 234
    invoke-static {v0, v1, v3, v4, v5}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 242
    const-string v3, "deepseek_caption_background_opacity"

    .line 243
    const-string v4, "\u80cc\u666f\u4e0d\u900f\u660e\u5ea6"

    .line 244
    const-string v5, "0% \u4e3a\u900f\u660e\uff0c100% \u4e3a\u4e0d\u900f\u660e\uff1b\u677e\u624b\u4fdd\u5b58"

    .line 240
    invoke-static {v0, v1, v3, v4, v5}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 248
    const-string v1, "deepseek_caption_reset_position"

    .line 249
    const-string v3, "\u6062\u590d\u5b57\u5e55\u9ed8\u8ba4\u4f4d\u7f6e"

    .line 250
    const-string v4, "\u6062\u590d\u7ad6\u76f4\u4f4d\u7f6e\uff0c\u4fdd\u7559\u5b57\u53f7\u548c\u80cc\u666f\u8bbe\u7f6e"

    .line 246
    invoke-static {v0, v2, v1, v3, v4}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 254
    const-string v0, "\u7f13\u5b58\u4e0e\u8bca\u65ad"

    invoke-static {v15, v0}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addCategory(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v16

    .line 256
    const-string v17, "app.yydarlinker.deepseekcaptions.DeepSeekActionPreference"

    .line 257
    const-string v18, "deepseek_caption_clear_cache"

    .line 258
    const-string v19, "\u6e05\u9664\u5b57\u5e55\u7f13\u5b58"

    const/16 v21, 0x8

    const/16 v22, 0x0

    const/16 v20, 0x0

    .line 255
    invoke-static/range {v16 .. v22}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference$default(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lorg/w3c/dom/Element;

    move-object/from16 v0, v16

    .line 261
    const-string v1, "app.yydarlinker.deepseekcaptions.DeepSeekDisplayTextDebugPreference"

    .line 262
    const-string v2, "deepseek_caption_display_text_debug"

    .line 263
    const-string v3, "\u663e\u793a\u6587\u672c\u8c03\u8bd5"

    .line 264
    const-string v4, "\u6392\u67e5\u65f6\u8bb0\u5f55\u5b57\u5e55\u539f\u6587\u4e0e\u8bd1\u6587\uff0c\u9ed8\u8ba4\u5173\u95ed"

    .line 260
    invoke-static {v0, v1, v2, v3, v4}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 267
    const-string v1, "app.yydarlinker.deepseekcaptions.DeepSeekDiagnosticsPreference"

    .line 268
    const-string v2, "deepseek_caption_diagnostics"

    .line 269
    const-string v3, "\u5b57\u5e55\u8bca\u65ad"

    .line 270
    const-string v4, "\u5c55\u5f00\u67e5\u770b\uff0c\u53ef\u624b\u52a8\u5237\u65b0\u6216\u590d\u5236"

    .line 266
    invoke-static {v0, v1, v2, v3, v4}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreference(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 273
    check-cast v15, Lorg/w3c/dom/Node;

    invoke-interface {v8, v15}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_1b6
    .catchall {:try_start_41 .. :try_end_1b6} :catchall_1ba

    .line 143
    invoke-static {v6, v9}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return p0

    :catchall_1ba
    move-exception v0

    move-object v1, v0

    :try_start_1bc
    throw v1
    :try_end_1bd
    .catchall {:try_start_1bc .. :try_end_1bd} :catchall_1bd

    :catchall_1bd
    move-exception v0

    invoke-static {v6, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
.end method

.method static synthetic deepSeekCaptionResourcePatch$lambda$0$1$addPreferenceScreen$default(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Z
    .registers 5

    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    .line 139
    :cond_5
    invoke-static {p0, p1, p2}, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch$lambda$0$1$addPreferenceScreen(Lapp/morphe/patcher/patch/ResourcePatchContext;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static final getDeepSeekCaptionResourcePatch()Lapp/morphe/patcher/patch/ResourcePatch;
    .registers 1

    .line 30
    sget-object v0, Lapp/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionResourcePatchKt;->deepSeekCaptionResourcePatch:Lapp/morphe/patcher/patch/ResourcePatch;

    return-object v0
.end method
