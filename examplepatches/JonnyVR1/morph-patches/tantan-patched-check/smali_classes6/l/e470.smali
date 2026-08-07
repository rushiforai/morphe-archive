.class public final synthetic Ll/e470;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iput-boolean p2, p0, Ll/e470;->b:Z

    iput-object p3, p0, Ll/e470;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p4, p0, Ll/e470;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iget-boolean v1, p0, Ll/e470;->b:Z

    iget-object v2, p0, Ll/e470;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/e470;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
