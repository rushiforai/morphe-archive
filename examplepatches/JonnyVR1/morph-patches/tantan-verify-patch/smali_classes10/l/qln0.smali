.class public Ll/qln0;
.super Ll/rs2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/rs2<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Landroid/widget/LinearLayout;

.field public f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

.field public g:Landroid/widget/HorizontalScrollView;

.field public h:Landroid/widget/LinearLayout;

.field public i:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

.field public k:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rs2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qln0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qln0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 4
    .line 5
    iget-object v2, p0, Ll/qln0;->k:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 6
    .line 7
    iget-object v3, p0, Ll/qln0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 8
    .line 9
    iget-object v4, p0, Ll/qln0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 10
    .line 11
    iget-object v5, p0, Ll/qln0;->n:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 12
    .line 13
    iget-object v6, p0, Ll/qln0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 14
    .line 15
    iget-object v7, p0, Ll/qln0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qln0;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rln0;->b(Ll/qln0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/rs2;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 5
    .line 6
    iget-object v1, p0, Ll/qln0;->g:Landroid/widget/HorizontalScrollView;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 12
    .line 13
    iget-object v1, p0, Ll/qln0;->i:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 19
    .line 20
    iget-object v1, p0, Ll/qln0;->j:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 26
    .line 27
    iget-object v1, p0, Ll/qln0;->k:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 33
    .line 34
    iget-object v1, p0, Ll/qln0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 40
    .line 41
    iget-object v1, p0, Ll/qln0;->m:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 47
    .line 48
    iget-object v1, p0, Ll/qln0;->n:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 54
    .line 55
    iget-object v1, p0, Ll/qln0;->o:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/qln0;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 61
    .line 62
    iget-object v1, p0, Ll/qln0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/call/view/NormalVoiceDeputyItemView;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;->setSwallowTarget(Landroid/view/ViewGroup;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/bnl0;->y0()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    const/high16 v1, 0x42680000    # 58.0f

    .line 72
    .line 73
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    mul-int/lit8 v1, v1, 0x5

    .line 78
    .line 79
    sub-int/2addr v0, v1

    .line 80
    const/high16 v1, 0x41a80000    # 21.0f

    .line 81
    .line 82
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    mul-int/lit8 v1, v1, 0x2

    .line 87
    .line 88
    sub-int/2addr v0, v1

    .line 89
    div-int/lit8 v0, v0, 0x4

    .line 90
    .line 91
    const/4 v1, 0x1

    .line 92
    :goto_0
    invoke-virtual {p0}, Ll/qln0;->d()Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-ge v1, v2, :cond_0

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/qln0;->d()Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    check-cast v2, Landroid/view/View;

    .line 111
    .line 112
    invoke-static {v2, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 113
    .line 114
    .line 115
    add-int/lit8 v1, v1, 0x1

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_0
    return-void
.end method
