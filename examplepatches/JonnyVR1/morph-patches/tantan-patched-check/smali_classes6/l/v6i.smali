.class public final synthetic Ll/v6i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/f7i;

.field public final synthetic b:Landroid/widget/TextView;

.field public final synthetic c:Ll/dj70;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic e:Landroid/view/View;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;


# direct methods
.method public synthetic constructor <init>(Ll/f7i;Landroid/widget/TextView;Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v6i;->a:Ll/f7i;

    iput-object p2, p0, Ll/v6i;->b:Landroid/widget/TextView;

    iput-object p3, p0, Ll/v6i;->c:Ll/dj70;

    iput-object p4, p0, Ll/v6i;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p5, p0, Ll/v6i;->e:Landroid/view/View;

    iput-object p6, p0, Ll/v6i;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/v6i;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/v6i;->a:Ll/f7i;

    iget-object v1, p0, Ll/v6i;->b:Landroid/widget/TextView;

    iget-object v2, p0, Ll/v6i;->c:Ll/dj70;

    iget-object v3, p0, Ll/v6i;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v4, p0, Ll/v6i;->e:Landroid/view/View;

    iget-object v5, p0, Ll/v6i;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/v6i;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Ll/f7i;->f(Ll/f7i;Landroid/widget/TextView;Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;Landroid/view/View;)V

    return-void
.end method
