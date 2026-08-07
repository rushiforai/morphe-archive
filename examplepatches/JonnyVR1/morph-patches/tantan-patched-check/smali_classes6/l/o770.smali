.class public final synthetic Ll/o770;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w770;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;


# direct methods
.method public synthetic constructor <init>(Ll/w770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o770;->a:Ll/w770;

    iput-object p2, p0, Ll/o770;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o770;->a:Ll/w770;

    iget-object p0, p0, Ll/o770;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    invoke-static {v0, p0, p1}, Ll/w770;->p0(Ll/w770;Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Landroid/view/View;)V

    return-void
.end method
