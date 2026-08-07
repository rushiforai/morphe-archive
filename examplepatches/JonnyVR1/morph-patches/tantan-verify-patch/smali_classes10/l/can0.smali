.class public Ll/can0;
.super Ll/dh2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dh2<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dh2;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public J(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dh2;->b:Ll/yql;

    .line 5
    .line 6
    iget-object p0, p0, Ll/dh2;->a:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;->c(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->bb:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/can0;->J(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
