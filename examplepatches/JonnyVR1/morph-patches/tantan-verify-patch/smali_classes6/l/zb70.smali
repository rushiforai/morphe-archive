.class public final synthetic Ll/zb70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;ILcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zb70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;

    iput p2, p0, Ll/zb70;->b:I

    iput-object p3, p0, Ll/zb70;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zb70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;

    iget v1, p0, Ll/zb70;->b:I

    iget-object p0, p0, Ll/zb70;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedItem;ILcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method
