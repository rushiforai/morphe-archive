.class public final synthetic Ll/t470;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentActivity;

.field public final synthetic c:I

.field public final synthetic d:Ll/omg;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iput-object p2, p0, Ll/t470;->b:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iput p3, p0, Ll/t470;->c:I

    iput-object p4, p0, Ll/t470;->d:Ll/omg;

    iput p5, p0, Ll/t470;->e:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t470;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iget-object v1, p0, Ll/t470;->b:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget v2, p0, Ll/t470;->c:I

    iget-object v3, p0, Ll/t470;->d:Ll/omg;

    iget v4, p0, Ll/t470;->e:I

    move-object v5, p1

    check-cast v5, Ll/pf60;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;ILl/pf60;)V

    return-void
.end method
