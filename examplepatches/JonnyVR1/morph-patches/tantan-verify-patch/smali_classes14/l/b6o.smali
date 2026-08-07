.class public Ll/b6o;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/w2u;Ll/e6o;Lcom/p1/mobile/android/app/Act;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/w2u<",
            "Ll/e6o;",
            ">;",
            "Ll/e6o;",
            "Lcom/p1/mobile/android/app/Act;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v5, Ll/b8o;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {v5, p0, p2, v0}, Ll/b8o;-><init>(Ll/ner;Lcom/p1/mobile/android/app/Act;Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/qyn;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    iget-object v3, p1, Ll/e6o;->m:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 17
    .line 18
    iget-object v4, p1, Ll/e6o;->d:Lcom/google/android/material/tabs/TabLayout;

    .line 19
    .line 20
    move-object v1, p0

    .line 21
    invoke-direct/range {v0 .. v5}, Ll/qyn;-><init>(Ll/ner;Ll/nus;Landroidx/viewpager/widget/ViewPager;Lcom/google/android/material/tabs/TabLayout;Ll/b8o;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 25
    .line 26
    .line 27
    new-instance p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p1, Ll/e6o;->g:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-direct {p0, v1, p2, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/home/submodule/menu/IntlLiveHomeMenuPresenter;-><init>(Ll/ner;Ll/nus;Lv/VDraweeView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 39
    .line 40
    .line 41
    new-instance p0, Ll/qtn;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    iget-object v0, p1, Ll/e6o;->l:Lv/VFrame;

    .line 48
    .line 49
    invoke-direct {p0, v1, p2, v0}, Ll/qtn;-><init>(Ll/ner;Ll/nus;Lv/VFrame;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 53
    .line 54
    .line 55
    new-instance p0, Ll/ywn;

    .line 56
    .line 57
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object v0, p1, Ll/e6o;->l:Lv/VFrame;

    .line 62
    .line 63
    invoke-direct {p0, v1, p2, v0}, Ll/ywn;-><init>(Ll/ner;Ll/nus;Lv/VFrame;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 67
    .line 68
    .line 69
    new-instance v6, Ll/c0o;

    .line 70
    .line 71
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    iget-object v9, p1, Ll/e6o;->i:Lv/VDraweeView;

    .line 76
    .line 77
    iget-object v10, p1, Ll/e6o;->j:Lv/VText;

    .line 78
    .line 79
    iget-object v11, p1, Ll/e6o;->k:Landroid/view/View;

    .line 80
    .line 81
    move-object v7, v1

    .line 82
    invoke-direct/range {v6 .. v11}, Ll/c0o;-><init>(Ll/ner;Ll/nus;Lv/VDraweeView;Lv/VText;Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, v6}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 86
    .line 87
    .line 88
    new-instance p0, Ll/pzn;

    .line 89
    .line 90
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-direct {p0, v1, p2, v5}, Ll/pzn;-><init>(Ll/ner;Ll/nus;Ll/b8o;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 98
    .line 99
    .line 100
    new-instance p0, Ll/j2n;

    .line 101
    .line 102
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-direct {p0, v1, p2}, Ll/j2n;-><init>(Ll/ner;Ll/nus;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 110
    .line 111
    .line 112
    new-instance p0, Ll/o6v;

    .line 113
    .line 114
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    iget-object v0, p1, Ll/e6o;->h:Lv/VDraweeView;

    .line 119
    .line 120
    invoke-direct {p0, v1, p2, v0}, Ll/o6v;-><init>(Ll/ner;Ll/nus;Lv/VDraweeView;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 124
    .line 125
    .line 126
    new-instance p0, Ll/bxn;

    .line 127
    .line 128
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    invoke-direct {p0, v1, p2}, Ll/bxn;-><init>(Ll/ner;Ll/nus;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 136
    .line 137
    .line 138
    new-instance p0, Ll/svn;

    .line 139
    .line 140
    invoke-virtual {v1}, Ll/mus;->H2()Ll/nus;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    iget-object p1, p1, Ll/e6o;->f:Lv/VDraweeView;

    .line 145
    .line 146
    invoke-direct {p0, v1, p2, p1}, Ll/svn;-><init>(Ll/ner;Ll/nus;Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 150
    .line 151
    .line 152
    return-void
.end method
