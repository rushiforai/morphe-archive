.class public final synthetic Ll/z370;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z370;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iput-object p2, p0, Ll/z370;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/z370;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z370;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;

    iget-object v1, p0, Ll/z370;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/z370;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->u(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
