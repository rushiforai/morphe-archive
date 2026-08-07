.class public final synthetic Ll/xq20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Video;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Video;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xq20;->a:Lcom/p1/mobile/putong/data/Video;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xq20;->a:Lcom/p1/mobile/putong/data/Video;

    check-cast p1, Ll/gcg0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionVideoView;->B(Lcom/p1/mobile/putong/data/Video;Ll/gcg0;)V

    return-void
.end method
