.class public final synthetic Ll/gy10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Music;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gy10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    iput-object p2, p0, Ll/gy10;->b:Lcom/p1/mobile/putong/data/Music;

    iput p3, p0, Ll/gy10;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gy10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    iget-object v1, p0, Ll/gy10;->b:Lcom/p1/mobile/putong/data/Music;

    iget p0, p0, Ll/gy10;->c:I

    check-cast p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->m(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/data/Music;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method
