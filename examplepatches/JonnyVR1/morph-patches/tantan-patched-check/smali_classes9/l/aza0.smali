.class public Ll/aza0;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/Question;",
            "Lcom/p1/mobile/putong/data/Answer;",
            ">;>;"
        }
    .end annotation
.end field

.field public y:Landroid/view/View;

.field public z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CategoriesDetail;",
            ">;"
        }
    .end annotation
.end field


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
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/aza0;->x:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/aza0;->z:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic R(Ll/aza0;Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/aza0;->T(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;Landroid/view/View;)V

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

.method public S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bza0;->b(Ll/aza0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;Landroid/view/View;)V
    .locals 4

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    iget-object v0, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->title:Ljava/lang/String;

    .line 4
    .line 5
    const/16 v1, 0x1f4

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-static {p3, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->getCreateTagInfo(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setSubTitle(Ljava/lang/String;Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v3, p2, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setEditObjKey(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setDefaultContent(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setEmptyInput(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Question;->source:Ljava/lang/String;

    .line 37
    .line 38
    const-string v1, "tacitTest"

    .line 39
    .line 40
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->setHarmonyTest(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-interface {p1}, Ll/nol;->act()Landroid/app/Activity;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopCreateTagAct;->c2(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;Landroid/content/Context;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    iget p2, p3, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->requestCode:I

    .line 64
    .line 65
    invoke-interface {p0, p1, p2}, Ll/t3m;->startActivityForResult(Landroid/content/Intent;I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final U(Lcom/p1/mobile/putong/core/ui/profile/AnswerView;ZZ)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

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
    invoke-virtual {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;->c(ZZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final V(Landroid/view/View;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-le p2, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public final W(II)V
    .locals 2

    .line 1
    add-int v0, p1, p2

    .line 2
    .line 3
    iget-object v1, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    if-ltz p1, :cond_1

    .line 8
    .line 9
    if-ltz p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-le v0, v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/data/User;)V
    .locals 10

    .line 1
    instance-of v0, p0, Ll/mpe;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->L3()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 14
    .line 15
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    add-int/lit8 v3, v3, -0x4

    .line 20
    .line 21
    invoke-virtual {p0, v1, v3}, Ll/aza0;->W(II)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v3, p0, Ll/aza0;->y:Landroid/view/View;

    .line 26
    .line 27
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iget-object v4, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 32
    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    add-int/lit8 v3, v3, -0x4

    .line 40
    .line 41
    invoke-virtual {p0, v1, v3}, Ll/aza0;->W(II)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    add-int/lit8 v3, v3, -0x3

    .line 50
    .line 51
    invoke-virtual {p0, v2, v3}, Ll/aza0;->W(II)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object v3, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 56
    .line 57
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    sub-int/2addr v3, v1

    .line 62
    invoke-virtual {p0, v2, v3}, Ll/aza0;->W(II)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object v3, p0, Ll/aza0;->x:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 68
    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    move v4, v3

    .line 76
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    if-ge v4, v5, :cond_8

    .line 81
    .line 82
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    check-cast v5, Lcom/p1/mobile/putong/data/Answer;

    .line 87
    .line 88
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 91
    .line 92
    iget-object v7, v5, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v6, v7}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    if-eqz v7, :cond_7

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-interface {v7}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    sget v8, Ll/kec0;->He:I

    .line 113
    .line 114
    iget-object v9, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 115
    .line 116
    invoke-virtual {v7, v8, v9, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v7

    .line 120
    check-cast v7, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;

    .line 121
    .line 122
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 123
    .line 124
    .line 125
    move-result v8

    .line 126
    sub-int/2addr v8, v2

    .line 127
    if-ne v4, v8, :cond_3

    .line 128
    .line 129
    move v8, v2

    .line 130
    goto :goto_2

    .line 131
    :cond_3
    move v8, v3

    .line 132
    :goto_2
    if-nez v4, :cond_4

    .line 133
    .line 134
    move v9, v2

    .line 135
    goto :goto_3

    .line 136
    :cond_4
    move v9, v3

    .line 137
    :goto_3
    invoke-virtual {p0, v7, v8, v9}, Ll/aza0;->U(Lcom/p1/mobile/putong/core/ui/profile/AnswerView;ZZ)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v7, v5}, Lcom/p1/mobile/putong/core/ui/profile/AnswerView;->b(Lcom/p1/mobile/putong/data/Answer;)V

    .line 141
    .line 142
    .line 143
    iget-object v8, p0, Ll/aza0;->u:Lv/VLinear_Dividers;

    .line 144
    .line 145
    if-eqz v0, :cond_5

    .line 146
    .line 147
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I

    .line 148
    .line 149
    .line 150
    move-result v8

    .line 151
    sub-int/2addr v8, v1

    .line 152
    invoke-virtual {p0, v7, v8}, Ll/aza0;->V(Landroid/view/View;I)V

    .line 153
    .line 154
    .line 155
    goto :goto_4

    .line 156
    :cond_5
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I

    .line 157
    .line 158
    .line 159
    move-result v8

    .line 160
    sub-int/2addr v8, v2

    .line 161
    invoke-virtual {p0, v7, v8}, Ll/aza0;->V(Landroid/view/View;I)V

    .line 162
    .line 163
    .line 164
    :goto_4
    iget-object v8, p0, Ll/aza0;->x:Ljava/util/List;

    .line 165
    .line 166
    invoke-static {v6, v5}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 167
    .line 168
    .line 169
    move-result-object v9

    .line 170
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    invoke-interface {v8}, Ll/t3m;->m0()Z

    .line 178
    .line 179
    .line 180
    move-result v8

    .line 181
    if-eqz v8, :cond_6

    .line 182
    .line 183
    new-instance v8, Ll/zya0;

    .line 184
    .line 185
    invoke-direct {v8, p0, v6, v5}, Ll/zya0;-><init>(Ll/aza0;Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)V

    .line 186
    .line 187
    .line 188
    invoke-static {v7, v8}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 189
    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_6
    const/4 v5, 0x0

    .line 193
    invoke-virtual {v7, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v7, v7}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 197
    .line 198
    .line 199
    :cond_7
    :goto_5
    add-int/lit8 v4, v4, 0x1

    .line 200
    .line 201
    goto :goto_1

    .line 202
    :cond_8
    iget-object p1, p0, Ll/aza0;->w:Lv/VText;

    .line 203
    .line 204
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/aza0;->v:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget v0, Ll/c9c0;->Q1:I

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    xor-int/lit8 p0, p0, 0x1

    .line 30
    .line 31
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

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
    invoke-virtual {p0, v0, p1}, Ll/aza0;->S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/aza0;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :goto_0
    invoke-virtual {p0, v0}, Ll/aza0;->X(Lcom/p1/mobile/putong/data/User;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
