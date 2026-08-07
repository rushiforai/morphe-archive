.class public Ll/c64;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/z54;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

.field public e:Landroid/widget/TextView;

.field public f:Ll/z54;

.field public g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


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

.method public static synthetic a(Ll/c64;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c64;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/c64;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/c64;->f(Landroid/view/View;)V

    return-void
.end method

.method private e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c64;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->n(Landroid/app/Dialog;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c64;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c64;->e()V

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
    iget-object p0, p0, Ll/c64;->f:Ll/z54;

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
    iget-object p0, p0, Ll/c64;->f:Ll/z54;

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

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/d64;->b(Ll/c64;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/z54;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c64;->f:Ll/z54;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/z54;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/c64;->d(Ll/z54;)V

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
    iget-object p0, p0, Ll/c64;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;)V
    .locals 7

    .line 1
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 2
    .line 3
    iget-object v1, p0, Ll/c64;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 4
    .line 5
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;->duration:J

    .line 6
    .line 7
    long-to-double v2, v2

    .line 8
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    mul-double/2addr v2, v4

    .line 14
    const-string v4, ""

    .line 15
    .line 16
    invoke-static {v4, v2, v3}, Ll/tzi0;->f(Ljava/lang/String;D)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Ll/obc0;->E1:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->c(I)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0}, Ll/c64;->C0()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget v3, Lcom/p1/mobile/putong/live/livingroom/R$string;->m1:I

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->e(Landroid/graphics/Typeface;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/c64;->C0()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ll/p6s;->s0()Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_0

    .line 60
    .line 61
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->u1:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->t1:I

    .line 65
    .line 66
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    sget-object v2, Ll/htd0;->f:Ll/htd0;

    .line 71
    .line 72
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Ll/civ;

    .line 77
    .line 78
    invoke-virtual {v3}, Ll/civ;->n()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_1

    .line 83
    .line 84
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v1:I

    .line 85
    .line 86
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    :cond_1
    iget-object v3, p0, Ll/c64;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 91
    .line 92
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;->rewardPoint:J

    .line 93
    .line 94
    long-to-double v5, v5

    .line 95
    invoke-static {v5, v6}, Ll/yau;->c(D)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v3, v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Ll/civ;

    .line 108
    .line 109
    invoke-virtual {v2}, Ll/civ;->n()Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_2

    .line 114
    .line 115
    sget v2, Ll/obc0;->A1:I

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_2
    sget v2, Ll/obc0;->v1:I

    .line 119
    .line 120
    :goto_1
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->c(I)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->e(Landroid/graphics/Typeface;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Ll/c64;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 132
    .line 133
    new-instance v2, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallSummary;->newFollowCount:J

    .line 139
    .line 140
    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    sget v1, Ll/obc0;->t1:I

    .line 155
    .line 156
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->c(I)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p0}, Ll/c64;->C0()Landroid/content/Context;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T0:I

    .line 165
    .line 166
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->e(Landroid/graphics/Typeface;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c64;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/c64;->act()Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p0, v0, v1}, Ll/c64;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/c0s;

    .line 19
    .line 20
    iget-object v2, p0, Ll/c64;->f:Ll/z54;

    .line 21
    .line 22
    invoke-direct {v1, v2, v0}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/c64;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 26
    .line 27
    iget-object v0, p0, Ll/c64;->a:Landroid/view/View;

    .line 28
    .line 29
    new-instance v1, Ll/a64;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/a64;-><init>(Ll/c64;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/c64;->e:Landroid/widget/TextView;

    .line 38
    .line 39
    new-instance v1, Ll/b64;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/b64;-><init>(Ll/c64;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p0, p0, Ll/c64;->g:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
