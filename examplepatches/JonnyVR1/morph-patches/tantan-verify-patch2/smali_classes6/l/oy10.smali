.class public final synthetic Ll/oy10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Music;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oy10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    iput-object p2, p0, Ll/oy10;->b:Lcom/p1/mobile/putong/data/Music;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oy10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    iget-object p0, p0, Ll/oy10;->b:Lcom/p1/mobile/putong/data/Music;

    check-cast p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->i(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
