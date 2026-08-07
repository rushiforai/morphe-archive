.class public Ll/gne;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Ll/tr90;

.field public v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public w:Landroid/view/View;

.field public x:Landroid/view/View;

.field public final y:Ll/t4m;


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
    new-instance p1, Ll/gne$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/gne$a;-><init>(Ll/gne;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/gne;->y:Ll/t4m;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic R(Ll/gne;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gne;->S()V

    return-void
.end method

.method private S()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/xra;->n()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget-object v2, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->R1(I)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I0(I)V

    .line 35
    .line 36
    .line 37
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method


# virtual methods
.method public j(Landroid/view/View;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41200000    # 10.0f

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setElevation(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Ll/t3m;->Y0()Landroid/view/ViewGroup;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-virtual {p1, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 23
    .line 24
    .line 25
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
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    .locals 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gne;->u:Ll/tr90;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tr90;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-direct {v0, v1, v2}, Ll/tr90;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/gne;->u:Ll/tr90;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Ll/gne;->x:Landroid/view/View;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    iget-object v0, p0, Ll/gne;->u:Ll/tr90;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, p1, v1}, Ll/tr90;->u(Landroid/view/ViewGroup;Z)Landroid/util/Pair;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Ll/gne;->u:Ll/tr90;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/tr90;->p()Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/gne;->w:Landroid/view/View;

    .line 42
    .line 43
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 46
    .line 47
    iput-object v0, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 48
    .line 49
    invoke-static {}, Ll/xra;->w()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 56
    .line 57
    const/16 v2, 0x9

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setViewCount(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/gne;->w:Landroid/view/View;

    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iget-object v0, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setSlideWithoutPress(Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;->setEnableLowPhotoValid(Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 78
    .line 79
    const-string v2, "p_edit_profile_view"

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 85
    .line 86
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    move v2, v1

    .line 91
    :goto_0
    if-ge v2, v0, :cond_8

    .line 92
    .line 93
    iget-object v3, p0, Ll/gne;->v:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 94
    .line 95
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 100
    .line 101
    invoke-static {}, Ll/xra;->w()Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    if-eqz v4, :cond_6

    .line 106
    .line 107
    const/4 v4, 0x1

    .line 108
    if-lez v2, :cond_3

    .line 109
    .line 110
    move v5, v4

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    move v5, v1

    .line 113
    :goto_1
    iput-boolean v5, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n:Z

    .line 114
    .line 115
    if-nez v2, :cond_4

    .line 116
    .line 117
    move v5, v4

    .line 118
    goto :goto_2

    .line 119
    :cond_4
    move v5, v1

    .line 120
    :goto_2
    iput-boolean v5, v3, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->p:Z

    .line 121
    .line 122
    iget-object v5, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->u:Lv/VImage;

    .line 123
    .line 124
    if-nez v2, :cond_5

    .line 125
    .line 126
    sget v6, Ll/kbc0;->s1:I

    .line 127
    .line 128
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_5
    sget v6, Ll/kbc0;->q1:I

    .line 133
    .line 134
    invoke-virtual {v5, v6}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 135
    .line 136
    .line 137
    :goto_3
    invoke-virtual {v3, v4, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->I1(ZZ)V

    .line 138
    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_6
    iget-object v4, p0, Ll/gne;->w:Landroid/view/View;

    .line 142
    .line 143
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setMainPicTag(Landroid/view/View;)V

    .line 144
    .line 145
    .line 146
    :goto_4
    invoke-static {}, Ll/xra;->n()Z

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    if-eqz v4, :cond_7

    .line 151
    .line 152
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;->EDIT:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;

    .line 153
    .line 154
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setCardDataType(Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard$CardDataType;)V

    .line 155
    .line 156
    .line 157
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_8
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 161
    .line 162
    move-object v0, p1

    .line 163
    check-cast v0, Landroid/view/View;

    .line 164
    .line 165
    iput-object v0, p0, Ll/gne;->x:Landroid/view/View;

    .line 166
    .line 167
    check-cast p1, Landroid/view/View;

    .line 168
    .line 169
    return-object p1
.end method

.method public t()V
    .locals 0

    .line 1
    return-void
.end method
