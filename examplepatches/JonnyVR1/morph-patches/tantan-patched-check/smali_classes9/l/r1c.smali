.class public Ll/r1c;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lv/VText;

.field public v:Lv/VImage;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/r1c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r1c;->S(Landroid/view/View;)V

    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/uyf;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/r1c;->O()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/uyf;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/dkb;->Z7()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const/4 v0, 0x1

    .line 25
    const-string v1, "profile_edit"

    .line 26
    .line 27
    invoke-virtual {p1, p0, v0, v1}, Ll/uyf;->C(ZZLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/uyf;->show()V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/on2;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/t3m;

    .line 4
    .line 5
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->p3:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Ll/r1c;->u:Lv/VText;

    .line 13
    .line 14
    sget v0, Ll/adc0;->Qe:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VImage;

    .line 21
    .line 22
    iput-object v0, p0, Ll/r1c;->v:Lv/VImage;

    .line 23
    .line 24
    sget v0, Ll/adc0;->t6:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 31
    .line 32
    iput-object p1, p0, Ll/r1c;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 33
    .line 34
    iget-object p1, p0, Ll/r1c;->u:Lv/VText;

    .line 35
    .line 36
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ll/gra;->L3()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Ll/r1c;->u:Lv/VText;

    .line 48
    .line 49
    const-string v0, "\u6211\u7684\u751f\u6d3b\u7167"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Ll/r1c;->v:Lv/VImage;

    .line 55
    .line 56
    new-instance v0, Ll/q1c;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/q1c;-><init>(Ll/r1c;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/gra;->L3()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Ll/r1c;->v:Lv/VImage;

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    :cond_1
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/r1c;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/r1c;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/kec0;->La:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public t()V
    .locals 8

    .line 1
    invoke-static {}, Ll/gra;->L3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/r1c;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_5

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->picture:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    move v3, v2

    .line 27
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_1

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    if-lez v4, :cond_0

    .line 44
    .line 45
    add-int/lit8 v3, v3, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/r1c;->O()Ll/t3m;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    move v4, v2

    .line 57
    move v5, v4

    .line 58
    :goto_1
    iget-object v6, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-ge v4, v6, :cond_2

    .line 73
    .line 74
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    check-cast v6, Ljava/lang/Integer;

    .line 79
    .line 80
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    add-int/2addr v5, v6

    .line 85
    add-int/lit8 v4, v4, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_2
    move v4, v2

    .line 89
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    if-ge v2, v6, :cond_3

    .line 94
    .line 95
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    check-cast v6, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 102
    .line 103
    .line 104
    move-result v6

    .line 105
    add-int/2addr v4, v6

    .line 106
    add-int/lit8 v2, v2, 0x1

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_3
    if-eq v4, v5, :cond_4

    .line 110
    .line 111
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    sub-int/2addr v3, v0

    .line 118
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const-string v1, "\u6dfb\u52a0%s\u5f20\u7167\u7247"

    .line 127
    .line 128
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->pictureExtendedText:Ljava/lang/String;

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_4
    const-string v0, ""

    .line 142
    .line 143
    move-object v1, v0

    .line 144
    :goto_3
    iget-object p0, p0, Ll/r1c;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 145
    .line 146
    invoke-virtual {p0, v5, v4, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;->Q(IILjava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_5
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    return-void
.end method
