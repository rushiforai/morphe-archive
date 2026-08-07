.class public final synthetic Ll/m470;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
