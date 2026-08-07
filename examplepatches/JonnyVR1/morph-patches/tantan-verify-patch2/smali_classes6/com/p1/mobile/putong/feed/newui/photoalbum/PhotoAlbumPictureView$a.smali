.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VTexturePlayer$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public O()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v2

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->i(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->b:I

    .line 14
    .line 15
    invoke-static/range {v0 .. v5}, Ll/c7y;->c(JJLjava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b(II)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->a:Ljava/lang/String;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->b:I

    .line 12
    .line 13
    invoke-static {p1, p2, v0, v1, p0}, Ll/c7y;->e(IIZLjava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public c(J)V
    .locals 8

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p1

    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    cmp-long p1, p1, v0

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->h:Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v4

    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)J

    .line 30
    .line 31
    .line 32
    move-result-wide p1

    .line 33
    sub-long p1, v4, p1

    .line 34
    .line 35
    const-wide/16 v2, 0xc8

    .line 36
    .line 37
    cmp-long p1, p1, v2

    .line 38
    .line 39
    if-ltz p1, :cond_0

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->a:Ljava/lang/String;

    .line 48
    .line 49
    iget v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->b:I

    .line 50
    .line 51
    invoke-static/range {v2 .. v7}, Ll/c7y;->b(JJLjava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;->c:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 55
    .line 56
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;J)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method
