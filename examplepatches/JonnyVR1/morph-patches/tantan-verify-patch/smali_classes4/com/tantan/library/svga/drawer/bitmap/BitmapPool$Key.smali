.class final Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Key"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0008\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0011\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0008\u001a\u00020\u0000H\u0096\u0002R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;",
        "",
        "size",
        "",
        "(I)V",
        "getSize",
        "()I",
        "compareTo",
        "other",
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


# instance fields
.field private final size:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;->size:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;)I
    .locals 0
    .param p1    # Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;->size:I

    .line 5
    .line 6
    iget p1, p1, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;->size:I

    .line 7
    .line 8
    sub-int/2addr p0, p1

    .line 9
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 10
    check-cast p1, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;->compareTo(Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;)I

    move-result p0

    return p0
.end method

.method public final getSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Key;->size:I

    .line 2
    .line 3
    return p0
.end method
