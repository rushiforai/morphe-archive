.class public final synthetic Ll/j470;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iput-object p2, p0, Ll/j470;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/j470;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iget-object v1, p0, Ll/j470;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/j470;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->F(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
