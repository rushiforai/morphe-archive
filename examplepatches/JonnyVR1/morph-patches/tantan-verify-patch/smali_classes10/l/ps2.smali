.class public Ll/ps2;
.super Ll/dlm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/dlm0<",
        "TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/dlm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public I4(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public O4(Ljava/lang/String;Ll/g4$a;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/otm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p4, p2}, Ll/dlm0;->S4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/otm0;Ll/g4$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j4(Ljava/lang/String;)Z
    .locals 7

    .line 1
    new-instance p1, Ll/pxj;

    .line 2
    .line 3
    const/16 v0, 0x6a4

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ll/pxj;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CHAT_INPUT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->FAST_RECHARGE:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 29
    .line 30
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->GIFT_REMINDER:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 31
    .line 32
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->MEMBER:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 33
    .line 34
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->USER_CARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 35
    .line 36
    sget-object v6, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 37
    .line 38
    filled-new-array/range {v0 .. v6}, [Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ll/t8s;->l([Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/dlm0;->l4()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    return p0

    .line 57
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 58
    return p0
.end method

.method public p4()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jfv;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jfv;->d()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public r4(Ljava/lang/String;I)Ll/g4$a;
    .locals 2

    .line 1
    const-string v0, "voiceChatButtonBubble"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x6a4

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance p1, Ll/vf3$c;

    .line 12
    .line 13
    invoke-direct {p1, v1}, Ll/vf3$c;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/g4$a;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    new-instance v0, Ll/vf3$b;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ll/vf3$b;-><init>(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p2}, Ll/vf3;->e(I)Ll/vf3;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, p1}, Ll/vf3;->f(Ljava/lang/String;)Ll/vf3;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/g4$a;

    .line 41
    .line 42
    return-object p0
.end method
