.class public Ll/kuk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/nrk0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/FrameLayout;

.field public i:Ll/nrk0;

.field public j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/kuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kuk0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/kuk0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kuk0;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/kuk0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kuk0;->j(Landroid/view/View;)V

    return-void
.end method

.method private f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kuk0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/kuk0;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kuk0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/kuk0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kuk0;->i:Ll/nrk0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kuk0;->i:Ll/nrk0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/luk0;->b(Ll/kuk0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/nrk0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kuk0;->i:Ll/nrk0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kuk0;->i:Ll/nrk0;

    .line 2
    .line 3
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->voiceCallId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/nrk0;->S3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/nrk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kuk0;->e(Ll/nrk0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kuk0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->z(Landroid/app/Dialog;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kuk0;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "call summary duration "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->duration:J

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "[voice][call]"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/kuk0;->c:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/kuk0;->C0()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->m1:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/kuk0;->d:Lv/VText;

    .line 38
    .line 39
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->duration:J

    .line 40
    .line 41
    long-to-double v1, v1

    .line 42
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    mul-double/2addr v1, v3

    .line 48
    const-string v3, ""

    .line 49
    .line 50
    invoke-static {v3, v1, v2}, Ll/tzi0;->f(Ljava/lang/String;D)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/kuk0;->e:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/kuk0;->C0()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->T0:I

    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/kuk0;->f:Lv/VText;

    .line 73
    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->newFollowCount:J

    .line 80
    .line 81
    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 95
    .line 96
    if-eqz v0, :cond_1

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->giftItems:Ljava/util/List;

    .line 99
    .line 100
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_0

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_0
    iget-object v0, p0, Ll/kuk0;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 108
    .line 109
    const/4 v1, 0x1

    .line 110
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/kuk0;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 114
    .line 115
    const-string v1, "https://auto.tancdn.com/v1/raw/574b190b-2eb2-4226-a8e1-51cded992fe811.so"

    .line 116
    .line 117
    const/4 v2, -0x1

    .line 118
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/kuk0;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 122
    .line 123
    new-instance v1, Ll/juk0;

    .line 124
    .line 125
    invoke-direct {v1, p0, p1}, Ll/juk0;-><init>(Ll/kuk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)V

    .line 126
    .line 127
    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/kuk0;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 133
    .line 134
    const/4 p1, 0x0

    .line 135
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kuk0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kuk0;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p0, v0, v1}, Ll/kuk0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/c0s;

    .line 19
    .line 20
    iget-object v2, p0, Ll/kuk0;->i:Ll/nrk0;

    .line 21
    .line 22
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/kuk0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 26
    .line 27
    iget-object v0, p0, Ll/kuk0;->a:Landroid/view/View;

    .line 28
    .line 29
    new-instance v1, Ll/huk0;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/huk0;-><init>(Ll/kuk0;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/kuk0;->g:Lv/VText;

    .line 38
    .line 39
    new-instance v1, Ll/iuk0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/iuk0;-><init>(Ll/kuk0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Ll/kuk0;->h:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/kuk0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 55
    .line 56
    .line 57
    return-void
.end method
