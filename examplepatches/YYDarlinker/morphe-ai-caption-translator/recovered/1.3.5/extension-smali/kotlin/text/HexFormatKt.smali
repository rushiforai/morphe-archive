.class public final Lkotlin/text/HexFormatKt;
.super Ljava/lang/Object;
.source "HexFormat.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHexFormat.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HexFormat.kt\nkotlin/text/HexFormatKt\n+ 2 _Strings.kt\nkotlin/text/StringsKt___StringsKt\n*L\n1#1,845:1\n1107#2,2:846\n*S KotlinDebug\n*F\n+ 1 HexFormat.kt\nkotlin/text/HexFormatKt\n*L\n843#1:846,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u000e\n\u0000\u001aJ\u0010\u0000\u001a\u00020\u00012\u0017\u0010\u0002\u001a\u0013\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003\u00a2\u0006\u0002\u0008\u0006H\u0087\u0088\u0004b\u0010\u0008\u0007\u0012\u000c\u0008\u0008\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\tb\u000c\u0008\n\u0012\u0008\u0008\u000b\u0012\u0004\u0008\u0008(\u000cb\u0002\u0008\r\u00f8\u0001\u0000\u001a\u000e\u0010\u000e\u001a\u00020\u000f*\u00020\u0010H\u0082\u0080\u0004\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u0011"
    }
    d2 = {
        "HexFormat",
        "Lkotlin/text/HexFormat;",
        "builderAction",
        "Lkotlin/Function1;",
        "Lkotlin/text/HexFormat$Builder;",
        "",
        "Lkotlin/ExtensionFunctionType;",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/ExperimentalStdlibApi;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.2",
        "Lkotlin/internal/InlineOnly;",
        "isCaseSensitive",
        "",
        "",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final HexFormat(Lkotlin/jvm/functions/Function1;)Lkotlin/text/HexFormat;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lkotlin/text/HexFormat$Builder;",
            "Lkotlin/Unit;",
            ">;)",
            "Lkotlin/text/HexFormat;"
        }
    .end annotation

    const-string v0, "builderAction"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 837
    new-instance v0, Lkotlin/text/HexFormat$Builder;

    invoke-direct {v0}, Lkotlin/text/HexFormat$Builder;-><init>()V

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lkotlin/text/HexFormat$Builder;->build()Lkotlin/text/HexFormat;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$isCaseSensitive(Ljava/lang/String;)Z
    .registers 1

    .line 1
    invoke-static {p0}, Lkotlin/text/HexFormatKt;->isCaseSensitive(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static final isCaseSensitive(Ljava/lang/String;)Z
    .registers 5

    .line 843
    check-cast p0, Ljava/lang/CharSequence;

    const/4 v0, 0x0

    move v1, v0

    .line 846
    :goto_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v1, v2, :cond_1e

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x80

    if-ge v2, v3, :cond_1c

    .line 843
    invoke-static {v2}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-eqz v2, :cond_19

    goto :goto_1c

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_1c
    :goto_1c
    const/4 p0, 0x1

    return p0

    :cond_1e
    return v0
.end method
