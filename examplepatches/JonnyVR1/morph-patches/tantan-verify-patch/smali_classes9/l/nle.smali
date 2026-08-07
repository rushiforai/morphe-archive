.class public Ll/nle;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Landroid/widget/ImageView;

.field public x:Landroid/widget/LinearLayout;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/core/data/LabelData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdealTag;->name:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic S(Ll/nle;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nle;->Z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/nle;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nle;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic U(Ll/nle;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nle;->Y(Landroid/view/View;)V

    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nle;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nle;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public V(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ole;->b(Ll/nle;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final W()V
    .locals 9

    .line 1
    const-string v0, "e_ideal_type_entrance"

    .line 2
    .line 3
    const-string v1, "p_edit_profile_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v3, Ll/tr90;->p:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v7, 0x1

    .line 29
    const/4 v8, 0x0

    .line 30
    const-string v2, ""

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    const/4 v5, 0x1

    .line 34
    const/4 v6, 0x1

    .line 35
    invoke-static/range {v1 .. v8}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nle;->W()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/nle;->V(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nle;->y:Lv/VText;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nle;->v:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nle;->v:Lv/VText;

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Ll/tr90;->s(Lcom/p1/mobile/putong/data/User;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    move v1, v2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 37
    .line 38
    iget v1, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->idealType:I

    .line 39
    .line 40
    :goto_0
    const-string v3, "\u6211\u7684\u7406\u60f3\u578b"

    .line 41
    .line 42
    invoke-virtual {p0, v0, v3, v1}, Ll/ep90;->P(Landroid/widget/TextView;Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    const-string v0, "e_ideal_type_entrance"

    .line 46
    .line 47
    const-string v1, "p_edit_profile_view"

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v0}, Ll/tr90;->s(Lcom/p1/mobile/putong/data/User;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/4 v1, 0x1

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 82
    .line 83
    iget-object v3, p0, Ll/nle;->x:Landroid/widget/LinearLayout;

    .line 84
    .line 85
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Ll/nle;->z:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 89
    .line 90
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Ll/nle;->w:Landroid/widget/ImageView;

    .line 94
    .line 95
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Ll/nle;->z:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 99
    .line 100
    new-instance v2, Ll/jle;

    .line 101
    .line 102
    invoke-direct {v2}, Ll/jle;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v0, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/view/CommonLabelShowView;->setLabel(Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/nle;->w:Landroid/widget/ImageView;

    .line 113
    .line 114
    new-instance v1, Ll/kle;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/kle;-><init>(Ll/nle;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/nle;->z:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 123
    .line 124
    new-instance v1, Ll/lle;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/lle;-><init>(Ll/nle;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_1
    iget-object v0, p0, Ll/nle;->x:Landroid/widget/LinearLayout;

    .line 134
    .line 135
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/nle;->z:Lcom/p1/mobile/putong/core/view/CommonLabelShowView;

    .line 139
    .line 140
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Ll/nle;->w:Landroid/widget/ImageView;

    .line 144
    .line 145
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/nle;->x:Landroid/widget/LinearLayout;

    .line 149
    .line 150
    new-instance v1, Ll/mle;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/mle;-><init>(Ll/nle;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 156
    .line 157
    .line 158
    return-void
.end method
