.class public final synthetic Ll/c870;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ll/n570;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/n570;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iput-object p2, p0, Ll/c870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/c870;->c:Ll/n570;

    iput-object p4, p0, Ll/c870;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iget-object v1, p0, Ll/c870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/c870;->c:Ll/n570;

    iget-object p0, p0, Ll/c870;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->N(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/n570;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
