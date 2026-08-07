.class public final Ll/hp10;
.super Ll/y7t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y7t<",
        "Ll/op10<",
        "*>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u00002\u000c\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\r\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/hp10;",
        "Ll/y7t;",
        "Ll/op10;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;",
        "summary",
        "",
        "v",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;)V",
        "j",
        "Landroid/content/Context;",
        "getContext",
        "()Landroid/content/Context;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final j:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/y7t;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/hp10;->j:Landroid/content/Context;

    .line 8
    .line 9
    return-void
.end method

.method public static w(Ll/hp10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/BaseDialogHolder;->j()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public v(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/y7t;->v(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 8
    .line 9
    iget-object v1, p0, Ll/y7t;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 10
    .line 11
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->duration:J

    .line 12
    .line 13
    long-to-double v2, v2

    .line 14
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    mul-double/2addr v2, v4

    .line 20
    const-string v4, ""

    .line 21
    .line 22
    invoke-static {v4, v2, v3}, Ll/tzi0;->f(Ljava/lang/String;D)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget v2, Ll/obc0;->E1:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->c(I)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->m1:I

    .line 37
    .line 38
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->e(Landroid/graphics/Typeface;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Ll/p6s;->s0()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->u1:I

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->t1:I

    .line 63
    .line 64
    :goto_0
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    sget-object v2, Ll/htd0;->f:Ll/htd0;

    .line 69
    .line 70
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Ll/civ;

    .line 75
    .line 76
    invoke-virtual {v2}, Ll/civ;->n()Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-eqz v2, :cond_1

    .line 81
    .line 82
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->v1:I

    .line 83
    .line 84
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    :cond_1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v3}, Ll/p6s;->s0()Z

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    if-eqz v3, :cond_2

    .line 97
    .line 98
    sget v3, Ll/obc0;->z1:I

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    sget v3, Ll/obc0;->v1:I

    .line 102
    .line 103
    :goto_1
    if-eqz v2, :cond_3

    .line 104
    .line 105
    sget v3, Ll/obc0;->A1:I

    .line 106
    .line 107
    :cond_3
    iget-object v2, p0, Ll/y7t;->g:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 108
    .line 109
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->rewardPoint:J

    .line 110
    .line 111
    long-to-double v4, v4

    .line 112
    invoke-static {v4, v5}, Ll/yau;->c(D)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->c(I)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

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
    iget-object v1, p0, Ll/y7t;->h:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 132
    .line 133
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;->newFollowCount:J

    .line 134
    .line 135
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    sget v1, Ll/obc0;->t1:I

    .line 144
    .line 145
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->c(I)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T0:I

    .line 150
    .line 151
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->d(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;->e(Landroid/graphics/Typeface;)Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/CallResultView;

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Ll/y7t;->i:Landroid/widget/TextView;

    .line 163
    .line 164
    new-instance v0, Ll/gp10;

    .line 165
    .line 166
    invoke-direct {v0, p0}, Ll/gp10;-><init>(Ll/hp10;)V

    .line 167
    .line 168
    .line 169
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 170
    .line 171
    .line 172
    return-void
.end method
