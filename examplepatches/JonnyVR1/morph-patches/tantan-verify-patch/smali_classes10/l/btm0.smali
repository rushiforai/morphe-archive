.class public final Ll/btm0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/widget/FrameLayout;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Ll/btm0;",
        "Ll/d3q;",
        "Landroid/widget/FrameLayout;",
        "Ll/pcp0;",
        "voiceVirtualBgPicData",
        "<init>",
        "(Ll/pcp0;)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "I",
        "(Landroid/widget/FrameLayout;)V",
        "a",
        "Ll/pcp0;",
        "H",
        "()Ll/pcp0;",
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
.field public final a:Ll/pcp0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/pcp0;)V
    .locals 0
    .param p1    # Ll/pcp0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/btm0;->a:Ll/pcp0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final H()Ll/pcp0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/btm0;->a:Ll/pcp0;

    .line 2
    .line 3
    return-object p0
.end method

.method public I(Landroid/widget/FrameLayout;)V
    .locals 6
    .param p1    # Landroid/widget/FrameLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/16 v0, 0xa

    .line 8
    .line 9
    invoke-static {v0}, Ll/txq;->c(I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p1, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/bnl0;->y0()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/high16 v1, 0x42700000    # 60.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    sub-int/2addr v0, v1

    .line 27
    int-to-float v0, v0

    .line 28
    const/high16 v1, 0x40400000    # 3.0f

    .line 29
    .line 30
    div-float/2addr v0, v1

    .line 31
    const/high16 v2, 0x40800000    # 4.0f

    .line 32
    .line 33
    mul-float/2addr v2, v0

    .line 34
    div-float/2addr v2, v1

    .line 35
    float-to-int v1, v2

    .line 36
    invoke-static {p1, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    float-to-int v0, v0

    .line 40
    const/4 v1, 0x1

    .line 41
    new-array v2, v1, [Landroid/view/View;

    .line 42
    .line 43
    const/4 v3, 0x0

    .line 44
    aput-object p1, v2, v3

    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    sget v0, Ll/mdc0;->C4:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VDraweeView;

    .line 56
    .line 57
    sget v2, Ll/mdc0;->F5:I

    .line 58
    .line 59
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Landroid/widget/ImageView;

    .line 64
    .line 65
    sget v3, Ll/mdc0;->W6:I

    .line 66
    .line 67
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    iget-object v4, p0, Ll/btm0;->a:Ll/pcp0;

    .line 72
    .line 73
    invoke-virtual {v4}, Ll/pcp0;->b()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->thumbnailUrl:Ljava/lang/String;

    .line 78
    .line 79
    const-string v5, "context_livingAct"

    .line 80
    .line 81
    invoke-static {v5, v0, v4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/btm0;->a:Ll/pcp0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ll/pcp0;->c()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/btm0;->a:Ll/pcp0;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/pcp0;->c()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    const/high16 v0, 0x41000000    # 8.0f

    .line 103
    .line 104
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-static {p1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/btm0;->a:Ll/pcp0;

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/pcp0;->a()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    rem-int/lit8 p0, p0, 0x3

    .line 118
    .line 119
    if-eqz p0, :cond_1

    .line 120
    .line 121
    if-eq p0, v1, :cond_1

    .line 122
    .line 123
    const/4 v0, 0x2

    .line 124
    if-eq p0, v0, :cond_0

    .line 125
    .line 126
    return-void

    .line 127
    :cond_0
    const/4 p0, 0x0

    .line 128
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_1
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    invoke-static {p1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->Pa:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/btm0;->I(Landroid/widget/FrameLayout;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
