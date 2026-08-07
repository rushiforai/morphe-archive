.class public final Ll/xvy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/hwy0;

.field public final b:Landroid/media/MediaFormat;

.field public final c:Ll/sqr0;

.field public final d:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final e:Landroid/media/MediaCrypto;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/hwy0;Landroid/media/MediaFormat;Ll/sqr0;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    .locals 0
    .param p4    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Landroid/media/MediaCrypto;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xvy0;->a:Ll/hwy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xvy0;->b:Landroid/media/MediaFormat;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xvy0;->c:Ll/sqr0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/xvy0;->d:Landroid/view/Surface;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ll/xvy0;->e:Landroid/media/MediaCrypto;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Ll/hwy0;Landroid/media/MediaFormat;Ll/sqr0;Landroid/media/MediaCrypto;)Ll/xvy0;
    .locals 7
    .param p3    # Landroid/media/MediaCrypto;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/xvy0;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, 0x0

    .line 5
    const/4 v4, 0x0

    .line 6
    move-object v1, p0

    .line 7
    move-object v2, p1

    .line 8
    move-object v3, p2

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/xvy0;-><init>(Ll/hwy0;Landroid/media/MediaFormat;Ll/sqr0;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static b(Ll/hwy0;Landroid/media/MediaFormat;Ll/sqr0;Landroid/view/Surface;Landroid/media/MediaCrypto;)Ll/xvy0;
    .locals 7
    .param p3    # Landroid/view/Surface;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/media/MediaCrypto;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/xvy0;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const/4 v6, 0x0

    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/xvy0;-><init>(Ll/hwy0;Landroid/media/MediaFormat;Ll/sqr0;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
