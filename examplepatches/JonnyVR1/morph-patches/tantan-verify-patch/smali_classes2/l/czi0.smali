.class public final Ll/czi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J)\u0010\n\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007H\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ#\u0010\u000e\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000c2\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007H\u0007\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/czi0;",
        "",
        "<init>",
        "()V",
        "",
        "width",
        "height",
        "Ll/q3d0;",
        "resizeOptions",
        "",
        "b",
        "(IILl/q3d0;)Z",
        "Ll/n0f;",
        "encodedImage",
        "c",
        "(Ll/n0f;Ll/q3d0;)Z",
        "size",
        "a",
        "(I)I",
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


# static fields
.field public static final INSTANCE:Ll/czi0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/czi0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/czi0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/czi0;->INSTANCE:Ll/czi0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(I)I
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    int-to-float p0, p0

    .line 2
    const v0, 0x3faaaaab

    .line 3
    .line 4
    .line 5
    mul-float/2addr p0, v0

    .line 6
    float-to-int p0, p0

    .line 7
    return p0
.end method

.method public static final b(IILl/q3d0;)Z
    .locals 3
    .param p2    # Ll/q3d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p2, :cond_1

    .line 4
    .line 5
    invoke-static {p0}, Ll/czi0;->a(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-float p0, p0

    .line 10
    const/high16 p2, 0x45000000    # 2048.0f

    .line 11
    .line 12
    cmpl-float p0, p0, p2

    .line 13
    .line 14
    if-ltz p0, :cond_0

    .line 15
    .line 16
    invoke-static {p1}, Ll/czi0;->a(I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/16 p1, 0x800

    .line 21
    .line 22
    if-lt p0, p1, :cond_0

    .line 23
    .line 24
    return v1

    .line 25
    :cond_0
    return v0

    .line 26
    :cond_1
    invoke-static {p0}, Ll/czi0;->a(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    iget v2, p2, Ll/q3d0;->a:I

    .line 31
    .line 32
    if-lt p0, v2, :cond_2

    .line 33
    .line 34
    invoke-static {p1}, Ll/czi0;->a(I)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    iget p1, p2, Ll/q3d0;->b:I

    .line 39
    .line 40
    if-lt p0, p1, :cond_2

    .line 41
    .line 42
    return v1

    .line 43
    :cond_2
    return v0
.end method

.method public static final c(Ll/n0f;Ll/q3d0;)Z
    .locals 2
    .param p0    # Ll/n0f;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ll/q3d0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ll/n0f;->V()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x5a

    .line 10
    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const/16 v1, 0x10e

    .line 14
    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/n0f;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-virtual {p0}, Ll/n0f;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {v0, p0, p1}, Ll/czi0;->b(IILl/q3d0;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/n0f;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0}, Ll/n0f;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-static {v0, p0, p1}, Ll/czi0;->b(IILl/q3d0;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method
