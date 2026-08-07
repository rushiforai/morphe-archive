.class public final synthetic Ll/x870;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iput-object p2, p0, Ll/x870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/x870;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/x870;->d:Z

    iput-boolean p5, p0, Ll/x870;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/x870;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    iget-object v1, p0, Ll/x870;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v2, p0, Ll/x870;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/x870;->d:Z

    iget-boolean v4, p0, Ll/x870;->e:Z

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->e0(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
