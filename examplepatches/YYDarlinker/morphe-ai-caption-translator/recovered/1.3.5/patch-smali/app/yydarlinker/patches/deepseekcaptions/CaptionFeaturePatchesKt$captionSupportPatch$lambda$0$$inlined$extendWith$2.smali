.class public final Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;
.super Ljava/lang/Object;
.source "Patch.kt"

# interfaces
.implements Ljava/util/function/Supplier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt;
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
        "Ljava/util/function/Supplier;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPatch.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Patch.kt\napp/morphe/patcher/patch/BytecodePatchBuilder$extendWith$1$1\n*L\n1#1,962:1\n*E\n"
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


# instance fields
.field final synthetic $classLoader:Ljava/lang/ClassLoader;

.field final synthetic $extension:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;->$classLoader:Ljava/lang/ClassLoader;

    iput-object p2, p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;->$extension:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/io/InputStream;
    .registers 4

    .line 633
    iget-object v0, p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;->$classLoader:Ljava/lang/ClassLoader;

    iget-object v1, p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;->$extension:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_b

    return-object v0

    .line 634
    :cond_b
    new-instance v0, Lapp/morphe/patcher/patch/PatchException;

    iget-object p0, p0, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;->$extension:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Extension \""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\" not found"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lapp/morphe/patcher/patch/PatchException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .registers 1

    .line 632
    invoke-virtual {p0}, Lapp/yydarlinker/patches/deepseekcaptions/CaptionFeaturePatchesKt$captionSupportPatch$lambda$0$$inlined$extendWith$2;->get()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method
