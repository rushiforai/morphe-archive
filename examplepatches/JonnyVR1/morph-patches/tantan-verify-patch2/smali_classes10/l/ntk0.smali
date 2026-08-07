.class public final synthetic Ll/ntk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/otk0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;


# direct methods
.method public synthetic constructor <init>(Ll/otk0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ntk0;->a:Ll/otk0;

    iput-object p2, p0, Ll/ntk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ntk0;->a:Ll/otk0;

    iget-object p0, p0, Ll/ntk0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;

    invoke-static {v0, p0}, Ll/otk0;->t4(Ll/otk0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method
