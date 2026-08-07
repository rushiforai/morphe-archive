.class public Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VRelative;",
        "Ll/iam<",
        "Ll/us80;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

.field public g:Ll/us80;

.field public final h:Ll/jxd0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "live_beauty_red_point"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->h:Ll/jxd0;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 34
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    new-instance p1, Ll/jxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "live_beauty_red_point"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 36
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->h:Ll/jxd0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    new-instance p1, Ll/jxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "live_beauty_red_point"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p3, Ll/zrv;->a:Ll/wrv;

    .line 39
    invoke-virtual {p3}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, p3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->h:Ll/jxd0;

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ljava/util/Map;)V
    .locals 2

    .line 1
    const-string v0, "isFirstTry"

    .line 2
    .line 3
    const-string v1, "true"

    .line 4
    .line 5
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->a0()V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->Z(Landroid/view/View;)V

    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->c()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/us80;->L5()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/us80;->J5()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "normal"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->i0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "obs"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->i0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/us80;->Y5()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private c0()V
    .locals 2

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/us80;->K5()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->g()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/us80;->K5()V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 28
    .line 29
    new-instance v0, Ll/ht80;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/ht80;-><init>()V

    .line 32
    .line 33
    .line 34
    const-string v1, "anchor_preivew_start_live"

    .line 35
    .line 36
    invoke-static {p0, v1, v0}, Ll/fgt;->b(Ll/i6t;Ljava/lang/String;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->b()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->S(Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->Q()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->j:Lv/VEditText;

    .line 16
    .line 17
    new-instance v3, Ll/qcr;

    .line 18
    .line 19
    const/16 v4, 0x30

    .line 20
    .line 21
    invoke-direct {v3, v4}, Ll/qcr;-><init>(I)V

    .line 22
    .line 23
    .line 24
    new-array v4, v2, [Landroid/text/InputFilter;

    .line 25
    .line 26
    aput-object v3, v4, v1

    .line 27
    .line 28
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->j:Lv/VEditText;

    .line 35
    .line 36
    new-instance v3, Ll/qcr;

    .line 37
    .line 38
    const/16 v4, 0x14

    .line 39
    .line 40
    invoke-direct {v3, v4}, Ll/qcr;-><init>(I)V

    .line 41
    .line 42
    .line 43
    new-array v4, v2, [Landroid/text/InputFilter;

    .line 44
    .line 45
    aput-object v3, v4, v1

    .line 46
    .line 47
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->a:Lv/VLinear;

    .line 53
    .line 54
    new-instance v1, Ll/at80;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/at80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->e:Lv/VText;

    .line 65
    .line 66
    new-instance v1, Ll/bt80;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/bt80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->setLiveBellSelected(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->f:Lv/VText;

    .line 82
    .line 83
    new-instance v1, Ll/ct80;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/ct80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->c:Landroid/widget/FrameLayout;

    .line 94
    .line 95
    new-instance v1, Ll/dt80;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/dt80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->d:Landroid/widget/FrameLayout;

    .line 106
    .line 107
    new-instance v1, Ll/et80;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/et80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->d:Lv/VText;

    .line 118
    .line 119
    new-instance v1, Ll/ft80;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/ft80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->f:Landroid/widget/FrameLayout;

    .line 130
    .line 131
    new-instance v1, Ll/gt80;

    .line 132
    .line 133
    invoke-direct {v1, p0}, Ll/gt80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->T(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jt80;->a(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->j:Lv/VEditText;

    .line 4
    .line 5
    const/high16 v1, 0x20000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->j:Lv/VEditText;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->e:Lv/VLinear;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->j:Lv/VEditText;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/high16 v1, 0x42480000    # 50.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->j:Lv/VEditText;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public R(Ll/us80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic a0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->d:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final b0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->h:Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/us80;->V5()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->setLiveBellSelected(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->setLiveBellSelected(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->title:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->campaignLinks:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->d:Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;

    .line 27
    .line 28
    new-instance v1, Ll/it80;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/it80;-><init>(Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->H(Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;Ll/y20;Ll/x20;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->d:Landroid/widget/RelativeLayout;

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->j:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public h0(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ab:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->setCheckingStatus(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->bb:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->setCheckingStatus(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public i0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "normal"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->c:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->d:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->f:Lv/VText;

    .line 28
    .line 29
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ib:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string v0, "obs"

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->c:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->d:Landroid/widget/FrameLayout;

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->f:Lv/VText;

    .line 60
    .line 61
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->hb:I

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->g:Ll/us80;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/us80;->M5(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/us80;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->R(Ll/us80;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->f()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->b:Lv/VLinear;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->d:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;)V
    .locals 4

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->remaining:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    long-to-double v0, v0

    .line 12
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePushLimit;->availableTime:D

    .line 13
    .line 14
    sub-double/2addr v0, v2

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmpl-double p1, v0, v2

    .line 18
    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->setLiveBellSelected(Z)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;->setLiveBellSelected(Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public n0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->setTitle(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->setAvatarUrl(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setPreviewContentVisibility(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->e:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->f:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewBottomView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewTopView;->e:Lv/VLinear;

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
