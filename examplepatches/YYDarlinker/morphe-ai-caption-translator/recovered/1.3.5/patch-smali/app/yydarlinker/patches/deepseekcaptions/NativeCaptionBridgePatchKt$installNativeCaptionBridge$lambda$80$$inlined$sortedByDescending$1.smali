.class public final Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$lambda$80$$inlined$sortedByDescending$1;
.super Ljava/lang/Object;
.source "Comparisons.kt"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt;->installNativeCaptionBridge(Lapp/morphe/patcher/patch/BytecodePatchContext;ZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nComparisons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Comparisons.kt\nkotlin/comparisons/ComparisonsKt__ComparisonsKt$compareByDescending$1\n+ 2 NativeCaptionBridgePatch.kt\napp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt\n*L\n1#1,325:1\n379#2:326\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 120
    check-cast p2, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;

    .line 326
    invoke-virtual {p2}, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->getIndex()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    .line 120
    check-cast p0, Ljava/lang/Comparable;

    check-cast p1, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;

    .line 326
    invoke-virtual {p1}, Lapp/yydarlinker/patches/deepseekcaptions/NativeCaptionBridgePatchKt$installNativeCaptionBridge$ReadHook;->getIndex()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 120
    check-cast p1, Ljava/lang/Comparable;

    invoke-static {p0, p1}, Lkotlin/comparisons/ComparisonsKt;->compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p0

    return p0
.end method
