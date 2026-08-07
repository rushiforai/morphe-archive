.class public final synthetic Ll/y870;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Landroid/widget/ImageView;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iput-object p2, p0, Ll/y870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/y870;->c:Landroid/widget/ImageView;

    iput-object p4, p0, Ll/y870;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/y870;->e:Z

    iput-boolean p6, p0, Ll/y870;->f:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/y870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iget-object v1, p0, Ll/y870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/y870;->c:Landroid/widget/ImageView;

    iget-object v3, p0, Ll/y870;->d:Ljava/lang/String;

    iget-boolean v4, p0, Ll/y870;->e:Z

    iget-boolean v5, p0, Ll/y870;->f:Z

    move-object v6, p1

    check-cast v6, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->M(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Ljava/lang/String;ZZLjava/lang/Throwable;)V

    return-void
.end method
