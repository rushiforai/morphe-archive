.class public final Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;
.super Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder<",
        "[B>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c0\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0003J\u001a\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;",
        "Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;",
        "",
        "()V",
        "onDecode",
        "Landroid/graphics/Bitmap;",
        "data",
        "ops",
        "Landroid/graphics/BitmapFactory$Options;",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;

    invoke-direct {v0}, Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;-><init>()V

    sput-object v0, Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;->INSTANCE:Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/drawer/bitmap/BitmapDecoder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic onDecode(Ljava/lang/Object;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 0

    .line 14
    check-cast p1, [B

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/drawer/bitmap/BitmapByteArrayDecoder;->onDecode([BLandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public onDecode([BLandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/BitmapFactory$Options;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    array-length v0, p1

    .line 9
    invoke-static {p1, p0, v0, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
