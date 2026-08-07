.class public final synthetic Ll/qpn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tpn0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;


# direct methods
.method public synthetic constructor <init>(Ll/tpn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qpn0;->a:Ll/tpn0;

    iput-object p2, p0, Ll/qpn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qpn0;->a:Ll/tpn0;

    iget-object p0, p0, Ll/qpn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/tpn0;->W2(Ll/tpn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;Ljava/lang/Boolean;)V

    return-void
.end method
