.class public Ll/vwt;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSettings;",
        ">;"
    }
.end annotation


# instance fields
.field public h:Landroid/content/Context;

.field public i:[Ljava/lang/String;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettings;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pkq;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    const-string v2, "_v2"

    .line 6
    .line 7
    invoke-static {}, Ll/vxr;->l()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v4, "live_settings_json"

    .line 12
    .line 13
    invoke-direct {v1, v4, v2, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 17
    .line 18
    new-instance v3, Ll/kwt;

    .line 19
    .line 20
    invoke-direct {v3}, Ll/kwt;-><init>()V

    .line 21
    .line 22
    .line 23
    const/4 v4, -0x1

    .line 24
    invoke-direct {v0, v1, v4, v2, v3}, Ll/pkq;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/JsonAdapter;Ll/pcj;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/lwt;

    .line 28
    .line 29
    invoke-direct {v1, p2}, Ll/lwt;-><init>(Ll/y20;)V

    .line 30
    .line 31
    .line 32
    const-string p2, "live_settings"

    .line 33
    .line 34
    invoke-direct {p0, p2, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 35
    .line 36
    .line 37
    const/4 p2, 0x0

    .line 38
    iput-object p2, p0, Ll/vwt;->i:[Ljava/lang/String;

    .line 39
    .line 40
    iput-object p2, p0, Ll/vwt;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 41
    .line 42
    iput-object p1, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic A0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->g9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic A1(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ua()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic A2(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Q7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ha()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ea()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->wa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->k8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->K7()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ba()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Y8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->F8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Z9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Sa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D1(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->w8()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "square-suggested"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic E(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->cb()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E0(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->L8()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ga()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E2(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->j9()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Ll/vwt;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->J8()Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->bb()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ra()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ua()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Xa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ja()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G1(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A9()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G2(Ll/y20;)Lrx/c;
    .locals 3

    .line 1
    new-instance v0, Ll/si20;

    .line 2
    .line 3
    new-instance v1, Ll/rst;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/rst;-><init>()V

    .line 6
    .line 7
    .line 8
    sget-object v2, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/sst;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/sst;-><init>(Ll/y20;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic H(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->S9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ta()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->W8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->x7()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Da()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I0()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/live-settings"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic I1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->fa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I2(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A8()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J(Ll/vwt;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->n8()Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->N7()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->f8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J2(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->i9()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K(Ll/vwt;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->S7()Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K0(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic K1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Va()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->R7()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->B9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->x9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->w9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->C7()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->aa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M0(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->J9()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->C8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ma()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->eb()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->r9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N1(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->h9()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->N8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->V8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->X8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->U9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->S8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->d8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->W9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->V9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->G8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Q8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->la()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->za()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q2(Ll/vwt;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->z9()Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->a8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->j8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->I7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->v9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ga()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->G9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->u8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->La()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ya()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->F7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->I8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->k9()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ja()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ca()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->fb()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->M8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->g8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->R8()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->X7()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->l8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->y7()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W0(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->P8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->s8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A7()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Z7()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->q9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->H9()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->e9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->O7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Za()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->b9()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y2(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->q8()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Y7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Aa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z1(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->f9()Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->p9()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ya()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->D7()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->T7()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a3(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->R9()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ta()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->u9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b2(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic b3(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Wa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->J7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ia()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->U7()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->L7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->B7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ma()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->p8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ea()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e0(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->y9()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ka()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e2(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->m9()Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->W7()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ab()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->z8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Qa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->C9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->H7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g1(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Z8()Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Oa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g3(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->D8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->X9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h1(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->F9()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->E9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h3(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->D9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->T8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->i8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Y9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i3(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->I9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->n9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j1(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->o8()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j2()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static synthetic j3(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->v8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->G7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->b8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->e8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k3(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->B8()Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->T9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->oa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ra()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l3(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->t9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ca()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->d9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Pa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m3(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->s9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->h8()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n1(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Q9()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Na()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n3(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ia()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o0(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->c9()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->ha()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->va()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o3(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->M9()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p0(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->t8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->l9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->na()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p3(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->P7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->L9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Fa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q2(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->M7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->V7()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->K8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->da()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s0(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->P9()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s1(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->N9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic s2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->m8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->O9()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t1(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->U8()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t2(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->H8()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ba()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u1(Ll/vwt;)Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->z7()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u2(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->a9()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v0(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->x8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Ka()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->db()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w0(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->r8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w1(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->c8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->pa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x0(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->o9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x1(Ll/vwt;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->E8()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x2(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->qa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p0, Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-object p0

    .line 20
    :catch_0
    :goto_0
    return-object p1
.end method

.method public static synthetic y0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->sa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->O8()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y2(Ll/vwt;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->y8()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z0(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->xa()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z1(Ll/vwt;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->E7()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z2(Ll/vwt;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->K9()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->z3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public A4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/qtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public A5()I
    .locals 1

    .line 1
    new-instance v0, Ll/bqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x14

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public A6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/nut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic A7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->recallFansLimitToast:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic A8()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->anchorsSearch:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic A9()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;->virtualAvatar:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Aa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->hiddenAnchorHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final B3()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "https://auto.tancdn.com/v1/raw/2c753031-2776-4b1b-baac-5ed87aacb98610.png"

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "\u9000\u51fa\u623f\u95f4"

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "exit"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->type:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0
.end method

.method public B4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/yut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public B5()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return v1

    .line 18
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/vwt;->i5()[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    array-length v0, p0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    return v1

    .line 26
    :cond_2
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    goto :goto_1

    .line 35
    :cond_3
    const/4 v0, 0x0

    .line 36
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_4

    .line 41
    .line 42
    return v1

    .line 43
    :cond_4
    array-length v2, p0

    .line 44
    move v3, v1

    .line 45
    :goto_2
    if-ge v3, v2, :cond_6

    .line 46
    .line 47
    aget-object v4, p0, v3

    .line 48
    .line 49
    invoke-static {v0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-eqz v4, :cond_5

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_6
    return v1
.end method

.method public B6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/lrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic B7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->canSwitchAccount:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic B8()Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic B9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->virtualAvatarSwitch:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Ba()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->hideLocation:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public C3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/zut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public C4()I
    .locals 1

    .line 1
    new-instance v0, Ll/rvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public C5()Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;
    .locals 1

    .line 1
    new-instance v0, Ll/jst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 12
    .line 13
    return-object p0
.end method

.method public C6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/bvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic C7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->cardOnLiveText:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic C8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->entertainmentTabText:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic C9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceActivityShowNumber:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Ca()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->leaderboardCollection:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public D3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/aut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/aut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final D4()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/utt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/utt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 12
    .line 13
    return-object p0
.end method

.method public D5()J
    .locals 2

    .line 1
    new-instance v0, Ll/zpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x1400

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-long v0, p0

    .line 23
    return-wide v0
.end method

.method public D6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/vst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic D7()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->discover:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->counterRefreshInterval:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic D8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followSetting:Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowSetting;->frequency:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic D9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindowSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindowSwitch;->openWhenSlideRight:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Da()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;->loadingExpDisable:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public E3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/fwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public E4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_3

    .line 11
    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 15
    .line 16
    if-eqz p0, :cond_3

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 19
    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->entrances:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceList;

    .line 24
    .line 25
    if-eqz p0, :cond_3

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceList;->keyList:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceList;->getLiveEntrance(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    return-object p1

    .line 43
    :cond_2
    const-string p1, "default"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceList;->getLiveEntrance(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_3
    :goto_0
    return-object v1
.end method

.method public E5()J
    .locals 2

    .line 1
    new-instance v0, Ll/art;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/art;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const p0, 0x1499700

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    int-to-long v0, p0

    .line 24
    return-wide v0
.end method

.method public E6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/tst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic E7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enableFriendsLiveStartEntrance:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic E8()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->managerRights:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic E9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->audience:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindowSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindowSwitch;->openWhenSlideRight:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Ea()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->isMagicGestureOpened:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public F3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/upt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/upt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public F4()Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/srt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/srt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 12
    .line 13
    return-object p0
.end method

.method public F5()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/vwt;->o5()Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->defaultOpenParas:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->effectiveWatchMinSeconds:J

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-gtz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-wide v0

    .line 21
    :cond_1
    :goto_0
    const-wide/16 v0, 0xa

    .line 22
    .line 23
    return-wide v0
.end method

.method public F6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/hwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic F7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;->multiCallVoiceEnable:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic F8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->maxShowTimes:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic F9()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->audienceOperateMenu:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Fa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showDebugInfo:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public G3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ott;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ott;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public G4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/jut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/wft;->c()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string p0, ""

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->B:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/lang/String;

    .line 26
    .line 27
    return-object p0
.end method

.method public G5()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/zvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public G6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/kst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic G7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic G8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->memberListMax:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic G9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindow;->caller:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindowSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSmallWindowSwitch;->openWhenSlideRight:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Ga()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;->isOpen:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public H3()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/gst;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/gst;-><init>(Ll/vwt;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public H4()I
    .locals 1

    .line 1
    new-instance v0, Ll/pst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x3

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public H5()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;->createAnchorInterfaceType:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "user"

    .line 17
    .line 18
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public H6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/vtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic H7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->quickGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceQuickGiftConfig;->longPressOn:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic H8()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic H9()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceGiftWallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallConfig;->h5HelpUrl:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic Ha()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public I3()J
    .locals 2

    .line 1
    new-instance v0, Ll/ist;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ist;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x5

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-gtz p0, :cond_0

    .line 22
    .line 23
    const-wide/16 v0, 0x5

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_0
    int-to-long v0, p0

    .line 27
    return-wide v0
.end method

.method public I4()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public I5()I
    .locals 1

    .line 1
    new-instance v0, Ll/mwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public I6()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x1

    .line 28
    if-ne v1, v2, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 37
    .line 38
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->showNearby:Z

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    return v2

    .line 43
    :cond_1
    :goto_0
    return v0
.end method

.method public final synthetic I7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->showEveryTimes:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic I8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;->minReportBufferingTimeDuration:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic I9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->leaderboardRefreshInterval:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic Ia()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isOverseaChineseMigrated:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public J3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;
    .locals 1

    .line 1
    new-instance v0, Ll/xst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 17
    .line 18
    return-object p0
.end method

.method public J4()I
    .locals 1

    .line 1
    new-instance v0, Ll/oqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/oqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x3

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public J5()I
    .locals 1

    .line 1
    new-instance v0, Ll/awt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/awt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public J6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/qqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic J7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;->hiddenRedPacket:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic J8()Ljava/lang/Long;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;

    .line 10
    .line 11
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;->minSendIntervalMillSeconds:J

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic J9()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->feedStyle:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Ja()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->reflectAudioProcessSwitch:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public K3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;
    .locals 1

    .line 1
    new-instance v0, Ll/ctt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ctt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 17
    .line 18
    return-object p0
.end method

.method public K4()I
    .locals 1

    .line 1
    new-instance v0, Ll/jrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x64

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public K5()I
    .locals 1

    .line 1
    new-instance v0, Ll/yrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x3

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public K6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/btt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/btt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic K7()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->afterGiveGift:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic K8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->appId:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic K9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->memberListRefreshInterval:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Ka()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->bulletCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->postConfirmingTextOn:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public L3()I
    .locals 1

    .line 1
    new-instance v0, Ll/pwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x5

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public L4()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public L5()I
    .locals 1

    .line 1
    new-instance v0, Ll/krt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/krt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x3

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public L6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/pvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic L7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->bubble:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateBubbleV2;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic L8()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->multiCallConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallConfig;->upgradeStartModePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic L9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showAnnouncementEntrance:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic La()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->auctionTrickBubble:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public M3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;
    .locals 1

    .line 1
    new-instance v0, Ll/wst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 15
    .line 16
    return-object p0
.end method

.method public M4()I
    .locals 2

    .line 1
    new-instance v0, Ll/wqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x64

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public M5()I
    .locals 1

    .line 1
    new-instance v0, Ll/but;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/but;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x3

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public M6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ztt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ztt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic M7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic M8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;->text:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic M9()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->operateMenu:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Ma()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceRecordConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRecordConfig;->isShowHeartbeatReward:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public N3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ktt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ktt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public N4()J
    .locals 3

    .line 1
    new-instance v0, Ll/vut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x1f4

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0
.end method

.method public N5()I
    .locals 1

    .line 1
    new-instance v0, Ll/est;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/est;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xf

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public N6()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/ntt;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/ntt;-><init>(Ll/vwt;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public final synthetic N7()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateChatV2;->minEventInterval:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic N8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveProfileConfig;->userRoomText:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic N9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->roomAmountRefreshInterval:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic Na()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showPledgeAuctionNewTag:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public O3()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;
    .locals 1

    .line 1
    new-instance v0, Ll/att;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/att;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 17
    .line 18
    return-object p0
.end method

.method public O4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/xtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "tantan"

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public O5()I
    .locals 1

    .line 1
    new-instance v0, Ll/frt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/frt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xf

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public O6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/vvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic O7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic O8()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic O9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->bindChatGroupPermission:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Oa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->showRoomRegion:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public P3()I
    .locals 1

    .line 1
    new-instance v0, Ll/lut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public P4()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/hpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 12
    .line 13
    return-object p0
.end method

.method public P5()I
    .locals 1

    .line 1
    new-instance v0, Ll/nvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xf

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public P6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ert;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ert;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic P7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic P8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic P9()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveSparkletReportConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Pa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLeaderboard:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRankingBoard;->hourLeaderboardOpen:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public Q3()J
    .locals 7

    .line 1
    new-instance v0, Ll/lst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x3c

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    const-wide/16 v5, 0x0

    .line 23
    .line 24
    cmp-long p0, v3, v5

    .line 25
    .line 26
    if-gtz p0, :cond_0

    .line 27
    .line 28
    return-wide v1

    .line 29
    :cond_0
    return-wide v3
.end method

.method public Q4()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/hst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->l0:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public Q5()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 1

    .line 1
    new-instance v0, Ll/eqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 12
    .line 13
    return-object p0
.end method

.method public Q6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/sut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic Q7()Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followRateConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowRateConfigV2;->popup:Lcom/p1/mobile/putong/live/base/data/BLiveFollowRatePopupV2;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic Q8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->showTagBeforeEnd:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Q9()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Qa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->userStatusInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserStatusInfo;->isSidebarNewUser:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public R3()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/npt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/npt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->q:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public R4()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/rpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->k0:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public R5()J
    .locals 3

    .line 1
    new-instance v0, Ll/jwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x18

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    return-wide v0
.end method

.method public R6()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/gvt;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/gvt;-><init>(Ll/vwt;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public final synthetic R7()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->animationInterval:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic R8()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic R9()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->verificationLevel:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Ra()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->signInConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public S3()I
    .locals 1

    .line 1
    new-instance v0, Ll/lpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xf

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public S4()Z
    .locals 1

    .line 1
    new-instance v0, Ll/fst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public S5()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/spt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/spt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public S6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/xrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic S7()Ljava/lang/Long;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;->duration:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic S8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;->retryCountDown:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic S9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->alsoFollow:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuideConfig;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuideConfig;->show:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Sa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveHierarchy:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevelSwitch;->isOpen:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public T3()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object v0

    .line 17
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->callGiftButtonDisplay:Z

    .line 23
    .line 24
    iget-object v1, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 25
    .line 26
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->r:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->callSettingButtonText:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v1, Ll/efv;->R:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->callAnnouncementUrl:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 43
    .line 44
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->t:I

    .line 45
    .line 46
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;->title:Ljava/lang/String;

    .line 51
    .line 52
    const/16 p0, 0x3c

    .line 53
    .line 54
    iput p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;->interval:I

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallSetting;->videoCancel:Lcom/p1/mobile/putong/live/base/data/BLiveCallVideoCancelSetting;

    .line 57
    .line 58
    return-object v0
.end method

.method public T4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/wtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->f0:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/String;

    .line 17
    .line 18
    return-object p0
.end method

.method public T5()Z
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/uqt;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/uqt;-><init>(Ll/vwt;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public T6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ovt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ovt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic T7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;->shoutingChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleShoutingChatConfig;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleShoutingChatConfig;->title:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic T8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pullStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePullStreamConfig;->pullFailedLimit:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic T9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Ta()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlEnterRoomOptimize:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x3

    .line 12
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public U3()I
    .locals 2

    .line 1
    new-instance v0, Ll/hvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x4

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    return v0
.end method

.method public U4()J
    .locals 2

    .line 1
    new-instance v0, Ll/wpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x1e

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-long v0, p0

    .line 23
    return-wide v0
.end method

.method public U5()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->fixRoomManagerLimit:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    return v0
.end method

.method public U6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/iqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/iqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic U7()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->nobleConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleConfig;->shoutingChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveNobleShoutingChatConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNobleShoutingChatConfig;->textLimit:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic U8()Ljava/util/List;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inAppPushHideConfig:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    :cond_0
    return-object p0
.end method

.method public final synthetic U9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->show:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic Ua()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 10
    .line 11
    return-object p0
.end method

.method public V3()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/tqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->C:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public V4()Z
    .locals 1

    .line 1
    new-instance v0, Ll/tpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public V5()Z
    .locals 1

    .line 1
    new-instance v0, Ll/eut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public V6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/avt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/avt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic V7()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->undercoverMinPlayerCount:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic V8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->manualRetryCountDown:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic V9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryExp:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Va()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomManagerCountMax:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public W3()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/urt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/urt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->c0:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public W4()I
    .locals 2

    .line 1
    new-instance v0, Ll/gut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x1e

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public W5()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ttt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ttt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public W6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/drt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/drt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic W7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic W8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->pusherFailedManualLimit:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic W9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->obsLive:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic Wa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlVoiceBannerConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceNewOperationConfig;->bannerOpen:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public X3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/rut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public X4()I
    .locals 2

    .line 1
    new-instance v0, Ll/aqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/aqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    return v0
.end method

.method public X5()Z
    .locals 1

    .line 1
    new-instance v0, Ll/opt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/opt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public X6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/put;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/put;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic X7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->hostLoadingText:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic X8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushStreamConfig:Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePushStreamConfig;->pusherFailedLimit:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic X9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->gameEntranceHide:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Xa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveTab:Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscover;->recordOperateHistoryOn:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public Y3()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/gqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->v0:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public Y4(ZZ)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    if-eqz p2, :cond_2

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->anchor:Ljava/util/List;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->audience:Ljava/util/List;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 26
    .line 27
    if-eqz p1, :cond_3

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->voiceAnchor:Ljava/util/List;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->voiceAudience:Ljava/util/List;

    .line 33
    .line 34
    return-object p0
.end method

.method public Y5()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/brt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/brt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/vwt;->B3()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    filled-new-array {p0}, [Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/List;

    .line 23
    .line 24
    return-object p0
.end method

.method public Y6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/iut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/iut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic Y7()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->updateChatV3:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic Y8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->license:Lcom/p1/mobile/putong/live/base/data/BLiveLicense;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLicense;->secretKey:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic Y9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->liveEntranceHide:Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;->messageChat:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic Ya()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->notifyFollowers:Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveNotifyFollowers;->showNotifyButton:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public Z3()I
    .locals 1

    .line 1
    new-instance v0, Ll/mrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, -0x1

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public Z4()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ewt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ewt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public Z5()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ltt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ltt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final Z6()Z
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 2
    .line 3
    const-string v0, "indonesia"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "LiveAudio_29"

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/api/ABManager;->j0(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "only_room_feed_exp"

    .line 18
    .line 19
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public final synthetic Z7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;->limitTips:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic Z8()Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->quitLiveStayConfig:Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic Z9()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->liveEntranceHide:Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;->messageFriendHead:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic Za()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;->showGuardScoreIncrement:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public a4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/tut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public a5()J
    .locals 2

    .line 1
    new-instance v0, Ll/tvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x3c

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-gtz p0, :cond_0

    .line 23
    .line 24
    const-wide/16 v0, 0x3c

    .line 25
    .line 26
    return-wide v0

    .line 27
    :cond_0
    int-to-long v0, p0

    .line 28
    return-wide v0
.end method

.method public a6()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/lvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public a7()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v2, "indonesiaChatroomExp"

    .line 14
    .line 15
    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v1, "live_indonesia_chatroom:_test01"

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    :goto_0
    return v0
.end method

.method public final synthetic a8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->chatMsgWatchTime:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic a9()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->shareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceShareConfig;->momentTitles:Ljava/util/List;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic aa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->liveEntranceHide:Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;->slideCard:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic ab()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->showMomentLikesAndComments:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public b4()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 10
    .line 11
    return-object p0
.end method

.method public b5()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    :goto_0
    const/4 p0, 0x5

    .line 13
    return p0

    .line 14
    :cond_1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pushMaxTimes:I

    .line 15
    .line 16
    return p0
.end method

.method public b6()I
    .locals 2

    .line 1
    new-instance v0, Ll/kut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xa

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public b7()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/hqt;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/hqt;-><init>(Ll/vwt;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public final synthetic b8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->ownerCreateRoomNotify:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCreateRoomNotify;->notifyContent:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic b9()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->reportFeedback:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic ba()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->liveEntranceHide:Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;->bottomLiveTab:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic bb()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->showMoreEntrance:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public c4()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;->tipsFormat:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public c5()I
    .locals 2

    .line 1
    new-instance v0, Ll/crt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/crt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x3

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    return v0
.end method

.method public c6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;
    .locals 1

    .line 1
    new-instance v0, Ll/gwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedStyle;

    .line 12
    .line 13
    return-object p0
.end method

.method public c7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/rqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic c8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->defaultTabTopicId:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic c9()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomAnnouncement:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic ca()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->liveEntranceHide:Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;->userProfileLiveBanner:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic cb()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomAdministratorExplainH5:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public d4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/owt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/owt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "0"

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public d5()I
    .locals 1

    .line 1
    new-instance v0, Ll/cst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public d6()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceManagerLimit:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    return v0
.end method

.method public d7()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->F4()Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic d8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->directLeaveRoomMaxStaySeconds:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic d9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->msgSameLocationLimit:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic da()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->liveEntranceHide:Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveEntranceHide;->userProfilePhotoWall:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic db()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomCardTemplateType:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public e4()I
    .locals 2

    .line 1
    new-instance v0, Ll/lqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/lqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gez v0, :cond_0

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    return v0
.end method

.method public e5()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/pqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public e6()I
    .locals 2

    .line 1
    new-instance v0, Ll/jtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xa

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public e7()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 22
    .line 23
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceBottomTabMode:I

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    if-eq p0, v0, :cond_2

    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    if-ne p0, v2, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return v1

    .line 33
    :cond_2
    :goto_0
    return v0

    .line 34
    :cond_3
    :goto_1
    return v1
.end method

.method public final synthetic e8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->drawGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;->numLimitMax:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic e9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->defaultOpenParas:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->sidebarLiveLimitCount:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic ea()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->settingLiveEntranceHide:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic eb()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->inviteGiftId:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public f4()I
    .locals 2

    .line 1
    new-instance v0, Ll/dwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x8c

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public f5()Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;
    .locals 1

    .line 1
    new-instance v0, Ll/qrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BQuitLiveStayConfig;

    .line 12
    .line 13
    return-object p0
.end method

.method public f6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/vqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public f7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ett;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ett;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic f8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->drawGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;->numLimitMin:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic f9()Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->toStartLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic fa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->settingNoticeEntranceHide:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic fb()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->inviteGiftPrice:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public g4()I
    .locals 2

    .line 1
    new-instance v0, Ll/itt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/itt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xa

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public g5(IZ)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    if-ne p1, p0, :cond_2

    .line 14
    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->random:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->playingStage:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->random:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->punishingStage:Ljava/lang/String;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    const/4 p0, 0x3

    .line 36
    if-ne p1, p0, :cond_4

    .line 37
    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->bounty:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->playingStage:Ljava/lang/String;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->bounty:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->punishingStage:Ljava/lang/String;

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_4
    if-eqz p2, :cond_5

    .line 59
    .line 60
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->specified:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->playingStage:Ljava/lang/String;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_5
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->specified:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->punishingStage:Ljava/lang/String;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_6
    :goto_0
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 79
    .line 80
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->e0:I

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public g6()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/vwt;->B3()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    filled-new-array {p0}, [Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/List;

    .line 23
    .line 24
    return-object p0
.end method

.method public g7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/nrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic g8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->drawGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;->playDisplayLongDelay:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic g9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveStreamEventConfig:Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamEventConfig;->bufferStopReportDuration:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic ga()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->voiceLiveEntranceHide:Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;->messageFriendHead:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public gb()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;
    .locals 1

    .line 1
    new-instance v0, Ll/kvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 12
    .line 13
    return-object p0
.end method

.method public h4()I
    .locals 2

    .line 1
    new-instance v0, Ll/ipt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ipt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x28

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public h5()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/dtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/Random;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ljava/lang/String;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_1
    :goto_0
    const-string p0, ""

    .line 43
    .line 44
    return-object p0
.end method

.method public h6()I
    .locals 2

    .line 1
    new-instance v0, Ll/uwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xa

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public h7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/hut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic h8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->drawGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;->playDisplayLongDelay:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic h9()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->card:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic ha()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->voiceLiveEntranceHide:Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;->slideCard:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public hb()I
    .locals 1

    .line 1
    new-instance v0, Ll/htt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/htt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public i4()I
    .locals 2

    .line 1
    new-instance v0, Ll/vrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x14

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public i5()[Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "ttt_av_func_regions"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-array v0, v2, [Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/vwt;->i:[Ljava/lang/String;

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    new-array v0, v0, [Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Ll/vwt;->i:[Ljava/lang/String;

    .line 35
    .line 36
    move v0, v2

    .line 37
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    .line 38
    .line 39
    .line 40
    move-result v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    iget-object v4, p0, Ll/vwt;->i:[Ljava/lang/String;

    .line 42
    .line 43
    if-ge v0, v3, :cond_1

    .line 44
    .line 45
    :try_start_1
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    aput-object v3, v4, v0
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 50
    .line 51
    add-int/lit8 v0, v0, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return-object v4

    .line 55
    :catch_0
    new-array v0, v2, [Ljava/lang/String;

    .line 56
    .line 57
    iput-object v0, p0, Ll/vwt;->i:[Ljava/lang/String;

    .line 58
    .line 59
    return-object v0
.end method

.method public i6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/nqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public i7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/jvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic i8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->drawGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;->playSplitNum:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic i9()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->follow:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic ia()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->voiceLiveEntranceHide:Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;->messageListChatDynamic:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public ib()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->chatEntryRefreshInterval:I

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return p0

    .line 17
    :cond_1
    :goto_0
    const/16 p0, 0x3c

    .line 18
    .line 19
    return p0
.end method

.method public j4()I
    .locals 2

    .line 1
    new-instance v0, Ll/wrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x32

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public j5()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/ivt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ivt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->m0:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public j6()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/uvt;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/uvt;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public j7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/iwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/iwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic j8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->drawGiftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDrawGiftConfig;->templateDisplayDelay:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic j9()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->suggestedTabAnimation:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimation;->guide:Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic ja()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->voiceLiveEntranceHide:Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;->messageListRightBottom:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public jb()Z
    .locals 1

    .line 1
    new-instance v0, Ll/xpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public k4()I
    .locals 2

    .line 1
    new-instance v0, Ll/gpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x3c

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public k5()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .locals 1

    .line 1
    new-instance v0, Ll/cwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 15
    .line 16
    return-object p0
.end method

.method public k6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;
    .locals 1

    .line 1
    new-instance v0, Ll/mvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSparkReportConfig;

    .line 12
    .line 13
    return-object p0
.end method

.method public k7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/dvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic k8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->enterRoomEffect:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomConfig;->cleanDuration:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic k9()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceCpConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceSweetCpConfig;->regulationPageUrl:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic ka()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->voiceLiveEntranceHide:Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/VoiceLiveEntranceHide;->bottomRecreation:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public kb()Z
    .locals 1

    .line 1
    new-instance v0, Ll/qst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public l4()I
    .locals 2

    .line 1
    new-instance v0, Ll/rtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x3c

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public l5()I
    .locals 1

    .line 1
    new-instance v0, Ll/rwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x5

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public l6()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;
    .locals 1

    .line 1
    new-instance v0, Ll/cvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpConfig;

    .line 12
    .line 13
    return-object p0
.end method

.method public l7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ppt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ppt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic l8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fakeAlert:Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFakeAlert;->title:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic l9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->swipeCardUnlimit:Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSwipeCardUnlimit;->minGrade:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic la()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->walletLiveEntranceHide:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public lb()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ftt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ftt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public m4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/cut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public m5()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->D4()Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public m6()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/kpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "mobile"

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public m7()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/nst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public final synthetic m8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;->fanbaseRuleUrl:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic m9()Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->teenMode:Lcom/p1/mobile/putong/live/base/data/BLiveTeenMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic ma()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->anchorGrowthEntrySwitch:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public mb(Ljava/lang/String;)Z
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Ll/vwt;->E4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 10
    .line 11
    return p0
.end method

.method public n4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/ptt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ptt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public n5()I
    .locals 1

    .line 1
    new-instance v0, Ll/grt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/grt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public n6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/sqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public n7()Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/vwt;->x6()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/vwt;->G6()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/vwt;->t6()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return v2

    .line 45
    :cond_1
    :goto_0
    return v1

    .line 46
    :cond_2
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 47
    .line 48
    const-string v3, "unknown_"

    .line 49
    .line 50
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_3

    .line 55
    .line 56
    invoke-static {}, Ll/vxr;->l()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    new-instance v4, Ll/wyd0;

    .line 61
    .line 62
    new-instance v5, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v6, "live_region_tag_"

    .line 65
    .line 66
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    const-string v5, ""

    .line 77
    .line 78
    invoke-direct {v4, v3, v5}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    if-nez v4, :cond_3

    .line 92
    .line 93
    :try_start_0
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LiveRegionTag;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 94
    .line 95
    .line 96
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    goto :goto_1

    .line 98
    :catch_0
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 99
    .line 100
    :cond_3
    :goto_1
    invoke-virtual {p0}, Ll/vwt;->i5()[Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    array-length v3, p0

    .line 105
    if-nez v3, :cond_4

    .line 106
    .line 107
    return v2

    .line 108
    :cond_4
    if-eqz v0, :cond_5

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    goto :goto_2

    .line 115
    :cond_5
    const/4 v0, 0x0

    .line 116
    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-eqz v3, :cond_6

    .line 121
    .line 122
    return v2

    .line 123
    :cond_6
    array-length v3, p0

    .line 124
    move v4, v2

    .line 125
    :goto_3
    if-ge v4, v3, :cond_8

    .line 126
    .line 127
    aget-object v5, p0, v4

    .line 128
    .line 129
    invoke-static {v0, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    if-eqz v5, :cond_7

    .line 134
    .line 135
    return v1

    .line 136
    :cond_7
    add-int/lit8 v4, v4, 0x1

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_8
    return v2
.end method

.method public final synthetic n8()Ljava/lang/Long;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatConfig;->limitation:Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;

    .line 10
    .line 11
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLimitation;->floodsMinSendIntervalSeconds:J

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic n9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;->uploadImageSizeLimit:I

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/16 p0, 0x1400

    .line 14
    .line 15
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic na()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveBreakingLeaderboardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBreakingLeaderboardConfig;->isOpen:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public nb()Z
    .locals 1

    .line 1
    new-instance v0, Ll/gtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public o4()J
    .locals 7

    .line 1
    new-instance v0, Ll/prt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/prt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0xf

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    const-wide/16 v5, 0x0

    .line 23
    .line 24
    cmp-long p0, v3, v5

    .line 25
    .line 26
    if-gtz p0, :cond_0

    .line 27
    .line 28
    return-wide v1

    .line 29
    :cond_0
    return-wide v3
.end method

.method public o5()Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->inRoomSideBarEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public o6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/jqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public o7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/bwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic o8()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlFlyMicEffectConfig:Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic o9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->intlFeedbackConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFeedbackConfig;->logUploadLimitFrequency:I

    .line 10
    .line 11
    mul-int/lit16 p0, p0, 0x3e8

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const p0, 0x1499700

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic oa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->isCanAmountRefresh:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public ob()Z
    .locals 1

    .line 1
    new-instance v0, Ll/jpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public p4()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ast;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ast;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/util/List;

    .line 12
    .line 13
    return-object p0
.end method

.method public p5(I)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x3e4ccccd    # 0.2f

    .line 6
    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->location:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowLocation;

    .line 19
    .line 20
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowLocation;->marginTopP:F

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v0, v1

    .line 24
    :goto_0
    const/4 v2, 0x0

    .line 25
    cmpg-float v2, v0, v2

    .line 26
    .line 27
    if-gtz v2, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v0

    .line 31
    :goto_1
    int-to-float p1, p1

    .line 32
    mul-float/2addr v1, p1

    .line 33
    float-to-int v0, v1

    .line 34
    invoke-static {}, Ll/bnl0;->F0()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-ge v0, v1, :cond_2

    .line 39
    .line 40
    invoke-static {}, Ll/bnl0;->F0()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    return p0

    .line 45
    :cond_2
    invoke-virtual {p0}, Ll/vwt;->q5()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    int-to-float p0, p0

    .line 50
    const v1, 0x3fe38e39

    .line 51
    .line 52
    .line 53
    mul-float/2addr p0, v1

    .line 54
    const/high16 v1, 0x430a0000    # 138.0f

    .line 55
    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    int-to-float v1, v1

    .line 61
    add-float/2addr p0, v1

    .line 62
    sub-float/2addr p1, p0

    .line 63
    int-to-float p0, v0

    .line 64
    cmpl-float p0, p0, p1

    .line 65
    .line 66
    if-lez p0, :cond_3

    .line 67
    .line 68
    float-to-int p0, p1

    .line 69
    return p0

    .line 70
    :cond_3
    return v0
.end method

.method public p6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/mqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public p7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/dqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic p8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->guardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardConfig;->sessionDuration:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic p9()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->verificationConfig:Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BVerificationConfig;->createAnchorInterfaceType:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic pa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->roomPopRefresh:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomPopRefresh;->isCanLeaderboardRefresh:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public pb()Z
    .locals 1

    .line 1
    new-instance v0, Ll/yvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public q3()I
    .locals 1

    .line 1
    new-instance v0, Ll/wut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public q4()I
    .locals 1

    .line 1
    new-instance v0, Ll/zst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public q5()I
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x3e99999a    # 0.3f

    .line 6
    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->location:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowLocation;

    .line 19
    .line 20
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindowLocation;->widthP:F

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move p0, v0

    .line 24
    :goto_0
    const/4 v1, 0x0

    .line 25
    cmpg-float v1, p0, v1

    .line 26
    .line 27
    if-gtz v1, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v0, p0

    .line 31
    :goto_1
    float-to-double v1, v0

    .line 32
    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    .line 33
    .line 34
    cmpl-double p0, v1, v3

    .line 35
    .line 36
    if-lez p0, :cond_2

    .line 37
    .line 38
    const/high16 v0, 0x3f000000    # 0.5f

    .line 39
    .line 40
    :cond_2
    invoke-static {}, Ll/bnl0;->y0()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    int-to-float p0, p0

    .line 45
    mul-float/2addr v0, p0

    .line 46
    float-to-int p0, v0

    .line 47
    return p0
.end method

.method public q6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/xvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public q7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/dst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic q8()Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->roomSlide:Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveScrollGuide;->intervalDays:Ljava/util/List;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic q9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallResetHours:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic qa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->blackListConfig:Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListConfig;->isOpen:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public qb()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/mst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public r3()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/twt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/twt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public r4()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 19
    .line 20
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->openNewIcon:Z

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 v1, 0x0

    .line 37
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->picture:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    return-object v0
.end method

.method public r5(IZ)Lcom/p1/mobile/putong/data/UserWealthGradeConfig;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->new_()Lcom/p1/mobile/putong/data/UserWealthGradeConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 22
    .line 23
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->tipsMap:Ljava/util/Map;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->tipsMap:Ljava/util/Map;

    .line 32
    .line 33
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_2

    .line 38
    .line 39
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->tipsMap:Ljava/util/Map;

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-nez v3, :cond_2

    .line 56
    .line 57
    iput-object v2, v0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthGradeDesc:Ljava/lang/String;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 v1, 0x0

    .line 61
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 62
    .line 63
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    const/4 v3, 0x1

    .line 68
    if-eqz v2, :cond_3

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 71
    .line 72
    iget-boolean v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->openNewIcon:Z

    .line 73
    .line 74
    if-eqz v4, :cond_3

    .line 75
    .line 76
    iput-boolean v3, v0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->openNewIcon:Z

    .line 77
    .line 78
    move-object v1, v2

    .line 79
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 80
    .line 81
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_4

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 88
    .line 89
    iget-boolean v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->openNewIcon:Z

    .line 90
    .line 91
    if-eqz v2, :cond_4

    .line 92
    .line 93
    iput-boolean v3, v0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->openNewIcon:Z

    .line 94
    .line 95
    move-object v1, p0

    .line 96
    :cond_4
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    if-eqz p2, :cond_5

    .line 103
    .line 104
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->swipeIconMap:Ljava/util/Map;

    .line 105
    .line 106
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-eqz p0, :cond_6

    .line 111
    .line 112
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->swipeIconMap:Ljava/util/Map;

    .line 113
    .line 114
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    if-nez p0, :cond_6

    .line 119
    .line 120
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->swipeIconMap:Ljava/util/Map;

    .line 121
    .line 122
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    check-cast p0, Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-nez p1, :cond_6

    .line 137
    .line 138
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_5
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->otherIconMap:Ljava/util/Map;

    .line 142
    .line 143
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_6

    .line 148
    .line 149
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->otherIconMap:Ljava/util/Map;

    .line 150
    .line 151
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    if-nez p0, :cond_6

    .line 156
    .line 157
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->otherIconMap:Ljava/util/Map;

    .line 158
    .line 159
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    check-cast p0, Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-nez p1, :cond_6

    .line 174
    .line 175
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserWealthGradeConfig;->wealthIconUrl:Ljava/lang/String;

    .line 176
    .line 177
    :cond_6
    :goto_1
    return-object v0
.end method

.method public r6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ypt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ypt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public r7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/qut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic r8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic r9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->autoFakeCallTimesLimit:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic ra()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stormCommentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public rb()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/ort;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ort;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public s3()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;
    .locals 1

    .line 1
    new-instance v0, Ll/nwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 12
    .line 13
    return-object p0
.end method

.method public s4()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 19
    .line 20
    iget-boolean v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->openNewIcon:Z

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const/4 v1, 0x0

    .line 37
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    iget-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->description:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    return-object v0
.end method

.method public s5()Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;
    .locals 1

    .line 1
    new-instance v0, Ll/qpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStartBtnConfig;

    .line 12
    .line 13
    return-object p0
.end method

.method public s6()Z
    .locals 2

    .line 1
    invoke-super {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 14
    .line 15
    iput-object v0, p0, Ll/vwt;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public s7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/yqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic s8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->liveRoomLeaderboardSchema:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic s9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->call:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->fetchInterval:I

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic sa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->fanbase:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseSetting;->on:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public sb()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return p0

    .line 17
    :cond_1
    :goto_0
    const/16 p0, 0x258

    .line 18
    .line 19
    return p0
.end method

.method public t3()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/ust;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ust;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public t4()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/hrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x3

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x5

    .line 12
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/16 v2, 0x8

    .line 17
    .line 18
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    filled-new-array {p0, v1, v2}, [Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {v0, v3}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_0

    .line 41
    .line 42
    filled-new-array {p0, v1, v2}, [Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_0
    return-object v0
.end method

.method public t5(IZ)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x1

    .line 13
    if-ne p1, p0, :cond_2

    .line 14
    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->random:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->playingStage:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_1
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->random:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->punishingStage:Ljava/lang/String;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    const/4 p0, 0x3

    .line 36
    if-ne p1, p0, :cond_4

    .line 37
    .line 38
    if-eqz p2, :cond_3

    .line 39
    .line 40
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->bounty:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->playingStage:Ljava/lang/String;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_3
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->bounty:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->punishingStage:Ljava/lang/String;

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_4
    if-eqz p2, :cond_5

    .line 59
    .line 60
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->specified:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->playingStage:Ljava/lang/String;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_5
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->specified:Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkQuitPkMessagesRandom;->punishingStage:Ljava/lang/String;

    .line 76
    .line 77
    return-object p0

    .line 78
    :cond_6
    :goto_0
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 79
    .line 80
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->e0:I

    .line 81
    .line 82
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public t6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/swt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/swt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public t7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/cqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic t8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->liveSquareLeaderboardSchema:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic t9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->retryCount:I

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic ta()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->smallWindow:Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSmallWindow;->show:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public tb()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/xqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public u3()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v2, "liveClearScreenExp"

    .line 14
    .line 15
    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/CharSequence;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v1, "live_rec_cleans:_test01"

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    :goto_0
    return v0
.end method

.method public u4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/fut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public u5()I
    .locals 2

    .line 1
    new-instance v0, Ll/rrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x7d0

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public u6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/svt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/svt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public u7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/dut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic u8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic u9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->fetchInterval:I

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final synthetic ua()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->giftConfig:Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftConfig;->enableDynamicUrl:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public ub()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/stt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/stt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public v3()Z
    .locals 1

    .line 1
    new-instance v0, Ll/mpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public v4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/irt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/irt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public v5()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 1

    .line 1
    new-instance v0, Ll/evt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/evt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    .line 12
    .line 13
    return-object p0
.end method

.method public v6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/kqt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/kqt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public v7()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/vwt;->Z6()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->voiceLiveActivityMomentTest:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    xor-int/2addr p0, v1

    .line 27
    return p0

    .line 28
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public final synthetic v8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->intlShareConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlShareCongfig;->maxSingleShareLimit:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic v9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->dial:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->timeout:I

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/16 p0, 0xf

    .line 16
    .line 17
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic va()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->hideLiveAvatar:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public w3()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ll/trt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/trt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/vwt;->h:Landroid/content/Context;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->p:I

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Ljava/lang/String;

    .line 19
    .line 20
    return-object p0
.end method

.method public w4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/fvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public w5()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 1

    .line 1
    new-instance v0, Ll/qwt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qwt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    .line 12
    .line 13
    return-object p0
.end method

.method public w6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/ost;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ost;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public w7()Z
    .locals 1

    .line 1
    new-instance v0, Ll/mtt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mtt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic w8()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic w9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->fakeCallTimeout:I

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/16 p0, 0xf

    .line 14
    .line 15
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic wa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->stealthPrivilege:Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStealthPrivilege;->hideConsumeRecord:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public x4()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/out;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/out;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "defaultx"

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public x5()Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;
    .locals 1

    .line 1
    new-instance v0, Ll/wvt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/wvt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BSuggestedTabAnimationItem;

    .line 12
    .line 13
    return-object p0
.end method

.method public x6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/vpt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vpt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic x7()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;->interval:I

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic x8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->voiceRoomLeaderboardSchema:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic x9()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatRequestConfig;->live:Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatLooperConfig;->fetchInterval:I

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/16 p0, 0xf

    .line 16
    .line 17
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic xa()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->isHideCreateRoomButton:Z

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public y3()J
    .locals 2

    .line 1
    new-instance v0, Ll/ytt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ytt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x3c

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    int-to-long v0, p0

    .line 23
    return-wide v0
.end method

.method public y4()I
    .locals 2

    .line 1
    new-instance v0, Ll/yst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xa

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    return p0
.end method

.method public y5()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareSubTab;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/qvt;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/qvt;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 29
    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_2
    :goto_0
    return-object v0
.end method

.method public y6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/bst;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/bst;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic y7()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activitySummaryRegularUnread:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryRegularUnread;->text:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic y8()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->voiceSquareLeaderboardSchema:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic y9()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->videoQuality:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic ya()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->intlGameOperationControl:Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationControl;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationControl;->isHideIntlLiveSquareActivity:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final z3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 1

    .line 1
    invoke-super {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/vwt;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 9
    .line 10
    invoke-super {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object v0, p0, Ll/vwt;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 26
    .line 27
    iput-object v0, p0, Ll/vwt;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 28
    .line 29
    :cond_1
    iget-object p0, p0, Ll/vwt;->j:Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 30
    .line 31
    return-object p0
.end method

.method public z4()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;
    .locals 1

    .line 1
    new-instance v0, Ll/zrt;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zrt;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 12
    .line 13
    return-object p0
.end method

.method public z5()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/xut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/xut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    const-string p0, ""

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public z6()Z
    .locals 1

    .line 1
    new-instance v0, Ll/uut;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uut;-><init>(Ll/vwt;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/vwt;->x3(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic z7()Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->unreadType:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnreadType;->activitySummaries:Lcom/p1/mobile/putong/live/base/data/BLiveUnreadTypeEnum;

    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic z8()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->activityOngoingAdditionCount:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic z9()Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->vipReportGrade:Ljava/lang/Long;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic za()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->intlGameOperationControl:Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationControl;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationControl;->isHideIntlVoiceLiveSquareActivity:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
