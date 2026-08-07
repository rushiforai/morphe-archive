.class public Ll/t2u;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/w2u;Ll/x2u;Lcom/p1/mobile/android/app/Act;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/w2u<",
            "Ll/x2u;",
            ">;",
            "Ll/x2u;",
            "Lcom/p1/mobile/android/app/Act;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/vys;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p1, Ll/x2u;->l:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/teenmode/LiveTeenModeViewModel;

    .line 8
    .line 9
    invoke-direct {v0, p0, v1, v2}, Ll/vys;-><init>(Ll/ner;Ll/nus;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/teenmode/LiveTeenModeViewModel;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 13
    .line 14
    .line 15
    new-instance v3, Ll/dxs;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    iget-object v6, p1, Ll/x2u;->d:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 22
    .line 23
    iget-object v7, p1, Ll/x2u;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 24
    .line 25
    iget-object v8, p1, Ll/x2u;->e:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 26
    .line 27
    iget-object v0, p1, Ll/x2u;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;->d:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 30
    .line 31
    iget-object v9, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->a:Lv/VDraweeView;

    .line 32
    .line 33
    iget-object v10, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->b:Lv/VDraweeView;

    .line 34
    .line 35
    move-object v4, p0

    .line 36
    invoke-direct/range {v3 .. v10}, Ll/dxs;-><init>(Ll/ner;Ll/nus;Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4, v3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 40
    .line 41
    .line 42
    new-instance p0, Ll/urr;

    .line 43
    .line 44
    invoke-virtual {v4}, Ll/mus;->H2()Ll/nus;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v1, p1, Ll/x2u;->b:Lv/VFrame;

    .line 49
    .line 50
    invoke-direct {p0, v4, v0, v1}, Ll/urr;-><init>(Ll/ner;Ll/nus;Lv/VFrame;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 54
    .line 55
    .line 56
    new-instance p0, Ll/bys;

    .line 57
    .line 58
    invoke-virtual {v4}, Ll/mus;->H2()Ll/nus;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-direct {p0, v4, v0}, Ll/bys;-><init>(Ll/ner;Ll/nus;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 66
    .line 67
    .line 68
    instance-of p0, p2, Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    if-eqz p0, :cond_0

    .line 71
    .line 72
    new-instance p0, Ll/o0g0;

    .line 73
    .line 74
    invoke-virtual {v4}, Ll/mus;->H2()Ll/nus;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v5, Ll/s0g0;

    .line 79
    .line 80
    iget-object v6, p1, Ll/x2u;->i:Lcom/google/android/material/tabs/TabLayout;

    .line 81
    .line 82
    iget-object v7, p1, Ll/x2u;->c:Landroid/view/View;

    .line 83
    .line 84
    iget-object v8, p1, Ll/x2u;->e:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 85
    .line 86
    iget-object v9, p1, Ll/x2u;->d:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 87
    .line 88
    iget-object v10, p1, Ll/x2u;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 89
    .line 90
    move-object v11, p2

    .line 91
    invoke-direct/range {v5 .. v11}, Ll/s0g0;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lcom/p1/mobile/android/app/Act;)V

    .line 92
    .line 93
    .line 94
    invoke-direct {p0, v4, v0, v5}, Ll/o0g0;-><init>(Ll/ner;Ll/nus;Ll/s0g0;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v4, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 98
    .line 99
    .line 100
    :cond_0
    new-instance p0, Ll/gbu;

    .line 101
    .line 102
    invoke-virtual {v4}, Ll/mus;->H2()Ll/nus;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-direct {p0, v4, p2}, Ll/gbu;-><init>(Ll/ner;Ll/nus;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v4, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 110
    .line 111
    .line 112
    new-instance p0, Ll/q40;

    .line 113
    .line 114
    invoke-virtual {v4}, Ll/mus;->H2()Ll/nus;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-direct {p0, v4, p2}, Ll/q40;-><init>(Ll/ner;Ll/nus;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v4, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 122
    .line 123
    .line 124
    new-instance p0, Ll/r6u;

    .line 125
    .line 126
    invoke-virtual {v4}, Ll/mus;->H2()Ll/nus;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    iget-object p1, p1, Ll/x2u;->j:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;

    .line 131
    .line 132
    invoke-direct {p0, v4, p2, p1}, Ll/r6u;-><init>(Ll/ner;Ll/nus;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v4, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 136
    .line 137
    .line 138
    return-void
.end method
