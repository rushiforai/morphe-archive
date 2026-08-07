.class public final Ll/t01;
.super Ll/xc80;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J-\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0012R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014\u00a8\u0006\u0015"
    }
    d2 = {
        "Ll/t01;",
        "Ll/xc80;",
        "Ll/v23;",
        "bitmapPool",
        "Ll/gb5;",
        "closeableReferenceFactory",
        "<init>",
        "(Ll/v23;Ll/gb5;)V",
        "",
        "width",
        "height",
        "Landroid/graphics/Bitmap$Config;",
        "bitmapConfig",
        "Ll/fb5;",
        "Landroid/graphics/Bitmap;",
        "d",
        "(IILandroid/graphics/Bitmap$Config;)Ll/fb5;",
        "a",
        "Ll/v23;",
        "b",
        "Ll/gb5;",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ll/v23;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/gb5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/v23;Ll/gb5;)V
    .locals 0
    .param p1    # Ll/v23;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/gb5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/xc80;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/t01;->a:Ll/v23;

    .line 11
    .line 12
    iput-object p2, p0, Ll/t01;->b:Ll/gb5;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public d(IILandroid/graphics/Bitmap$Config;)Ll/fb5;
    .locals 4
    .param p3    # Landroid/graphics/Bitmap$Config;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/graphics/Bitmap$Config;",
            ")",
            "Ll/fb5<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2, p3}, Ll/j33;->h(IILandroid/graphics/Bitmap$Config;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-object v1, p0, Ll/t01;->a:Ll/v23;

    .line 9
    .line 10
    invoke-interface {v1, v0}, Ll/vi80;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/graphics/Bitmap;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    mul-int v2, p1, p2

    .line 21
    .line 22
    invoke-static {p3}, Ll/j33;->g(Landroid/graphics/Bitmap$Config;)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    mul-int/2addr v2, v3

    .line 27
    if-lt v1, v2, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/Bitmap;->reconfigure(IILandroid/graphics/Bitmap$Config;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/t01;->b:Ll/gb5;

    .line 33
    .line 34
    iget-object p0, p0, Ll/t01;->a:Ll/v23;

    .line 35
    .line 36
    invoke-virtual {p1, v0, p0}, Ll/gb5;->c(Ljava/lang/Object;Ll/w4d0;)Ll/fb5;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_0
    const-string p0, "Check failed."

    .line 45
    .line 46
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method
