.class public final synthetic Ll/l870;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iput-object p2, p0, Ll/l870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/l870;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/l870;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iget-object v1, p0, Ll/l870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/l870;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/l870;->d:Z

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZLandroid/view/View;)V

    return-void
.end method
