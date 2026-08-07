.class public final synthetic Ll/k470;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iput-object p2, p0, Ll/k470;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iget-object p0, p0, Ll/k470;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->p(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/ViewGroup;)V

    return-void
.end method
