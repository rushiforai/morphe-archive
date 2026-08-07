.class public final synthetic Ll/py10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/py10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/py10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    check-cast p1, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->d(Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    return-void
.end method
