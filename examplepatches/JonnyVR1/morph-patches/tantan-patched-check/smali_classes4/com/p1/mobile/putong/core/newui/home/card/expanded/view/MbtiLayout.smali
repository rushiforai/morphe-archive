.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

.field public b:Lv/VLinear;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public e:Lv/VImage;

.field public f:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public h:Lv/VText;

.field public i:Lv/VFrame;

.field public j:Lv/VLinear;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public n:Lv/VFrame_Shadow;

.field public o:Lv/VImage;

.field public p:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

.field public q:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MbtiMatchScore;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MbtiMatchScore;->key:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aix;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/data/LabelData;)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    sget v1, Ll/bnl0;->f:I

    .line 13
    .line 14
    invoke-direct {p0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LabelData;->iconDrawableRes:I

    .line 23
    .line 24
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpTagView;->h(Ljava/lang/String;IZ)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public d(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelData;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/yhx;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/yhx;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/zhx;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/zhx;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public e()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->c:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 8
    .line 9
    const/high16 v2, 0x41500000    # 13.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 19
    .line 20
    sget v2, Ll/qa00;->j:I

    .line 21
    .line 22
    invoke-static {v0, v2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->b:Lv/VLinear;

    .line 31
    .line 32
    sget v3, Ll/qa00;->c:I

    .line 33
    .line 34
    invoke-static {v0, v3}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->b:Lv/VLinear;

    .line 38
    .line 39
    const/high16 v3, 0x41300000    # 11.0f

    .line 40
    .line 41
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-static {v0, v3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->i:Lv/VFrame;

    .line 49
    .line 50
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 54
    .line 55
    sget v2, Ll/qa00;->e:I

    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 61
    .line 62
    sget v2, Ll/qa00;->a:I

    .line 63
    .line 64
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 68
    .line 69
    invoke-static {v0, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 73
    .line 74
    const-string v2, "#e6000000"

    .line 75
    .line 76
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->d:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 84
    .line 85
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->j:Lv/VLinear;

    .line 91
    .line 92
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    invoke-static {p1}, Ll/aw90;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_7

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Ll/uhx;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MbtiInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_6

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 33
    .line 34
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MbtiInfo;->key:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MbtiInfo;->character:Ljava/lang/String;

    .line 37
    .line 38
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v4, "%s%s"

    .line 43
    .line 44
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->h:Lv/VText;

    .line 52
    .line 53
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MbtiInfo;->desc:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->f:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 61
    .line 62
    iget-object v4, v0, Lcom/p1/mobile/putong/core/data/MbtiInfo;->pic:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/MbtiInfo;->labels:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_1

    .line 83
    .line 84
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Ljava/lang/String;

    .line 89
    .line 90
    new-instance v5, Lcom/p1/mobile/putong/core/data/LabelData;

    .line 91
    .line 92
    invoke-direct {v5}, Lcom/p1/mobile/putong/core/data/LabelData;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v4, v5, Lcom/p1/mobile/putong/core/data/LabelData;->name:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {}, Ll/gra;->z()Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-eqz v4, :cond_0

    .line 102
    .line 103
    iput-boolean v1, v5, Lcom/p1/mobile/putong/core/data/LabelData;->highlight:Z

    .line 104
    .line 105
    :cond_0
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_1
    invoke-static {}, Ll/gra;->z()Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-eqz v3, :cond_2

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->p:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 116
    .line 117
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    if-eqz v3, :cond_3

    .line 122
    .line 123
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->p:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 124
    .line 125
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->d(Ljava/util/List;)Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 130
    .line 131
    .line 132
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->j:Lv/VLinear;

    .line 133
    .line 134
    sget v3, Ll/qa00;->i:I

    .line 135
    .line 136
    invoke-static {v2, v3}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 137
    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->q:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 141
    .line 142
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    if-eqz v3, :cond_3

    .line 147
    .line 148
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->q:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 149
    .line 150
    const-string v4, "mbti"

    .line 151
    .line 152
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->setTestKey(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->q:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 156
    .line 157
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->setLabel(Ljava/util/List;)V

    .line 158
    .line 159
    .line 160
    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->j:Lv/VLinear;

    .line 161
    .line 162
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    const/4 v4, 0x1

    .line 167
    xor-int/2addr v3, v4

    .line 168
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    if-nez v2, :cond_6

    .line 176
    .line 177
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 178
    .line 179
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 180
    .line 181
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-static {v2}, Ll/aw90;->Q(Lcom/p1/mobile/putong/data/User;)Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    if-eqz v3, :cond_5

    .line 190
    .line 191
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 192
    .line 193
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 194
    .line 195
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 196
    .line 197
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->mbti:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    check-cast v2, Ljava/lang/String;

    .line 204
    .line 205
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MbtiInfo;->matchScores:Ljava/util/List;

    .line 206
    .line 207
    new-instance v3, Ll/xhx;

    .line 208
    .line 209
    invoke-direct {v3, v2}, Ll/xhx;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    invoke-static {v0, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    check-cast v0, Lcom/p1/mobile/putong/core/data/MbtiMatchScore;

    .line 217
    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 219
    .line 220
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    if-eqz p1, :cond_4

    .line 229
    .line 230
    const-string p1, "\u5979"

    .line 231
    .line 232
    goto :goto_2

    .line 233
    :cond_4
    const-string p1, "\u4ed6"

    .line 234
    .line 235
    :goto_2
    iget v5, v0, Lcom/p1/mobile/putong/core/data/MbtiMatchScore;->matchScore:I

    .line 236
    .line 237
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 238
    .line 239
    .line 240
    move-result-object v5

    .line 241
    filled-new-array {p1, v5}, [Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    const-string v5, "\u548c%s\u5339\u914d\u5ea6%d%%"

    .line 246
    .line 247
    invoke-static {v4, v5, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    .line 253
    .line 254
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->l:Lv/VText;

    .line 255
    .line 256
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    iget v0, v0, Lcom/p1/mobile/putong/core/data/MbtiMatchScore;->matchScore:I

    .line 261
    .line 262
    invoke-static {v0}, Ll/aw90;->J(I)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    const-string v2, "\u6211\u662f%s\uff0c%s"

    .line 271
    .line 272
    invoke-static {v3, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 277
    .line 278
    .line 279
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 280
    .line 281
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 286
    .line 287
    const-string v0, "\u6d4b\u8bd5\u6211\u7684MBTI"

    .line 288
    .line 289
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->l:Lv/VText;

    .line 293
    .line 294
    const-string v0, "\u6d4b\u8bd5\u5b8c\u5373\u53ef\u67e5\u770b\u6211\u4eec\u7684\u5339\u914d\u7a0b\u5ea6"

    .line 295
    .line 296
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    .line 298
    .line 299
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 300
    .line 301
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 302
    .line 303
    .line 304
    :cond_6
    return-void

    .line 305
    :cond_7
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 306
    .line 307
    .line 308
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 309
    .line 310
    const-string p1, "mbti \u6570\u636e\u4e3a\u7a7a\uff0c\u5374\u8fdb\u884c\u4e86\u6e32\u67d3"

    .line 311
    .line 312
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-static {p0}, Ll/qu2;->w(Ljava/lang/Throwable;)V

    .line 316
    .line 317
    .line 318
    return-void
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, -0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 15
    .line 16
    sget v2, Ll/qa00;->q:I

    .line 17
    .line 18
    invoke-static {v0, v2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;

    .line 22
    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->c:Lv/VImage;

    .line 27
    .line 28
    sget v2, Ll/dbc0;->S6:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->e:Lv/VImage;

    .line 34
    .line 35
    sget v2, Ll/dbc0;->Ys:I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->j:Lv/VLinear;

    .line 41
    .line 42
    sget v2, Ll/dbc0;->T6:I

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->o:Lv/VImage;

    .line 48
    .line 49
    sget v2, Ll/dbc0;->in:I

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 52
    .line 53
    .line 54
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;-><init>(Landroid/content/Context;)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->p:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->i:Lv/VFrame;

    .line 66
    .line 67
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 68
    .line 69
    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->c:Lv/VImage;

    .line 77
    .line 78
    sget v2, Ll/dbc0;->qn:I

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->e:Lv/VImage;

    .line 84
    .line 85
    sget v2, Ll/dbc0;->um:I

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->j:Lv/VLinear;

    .line 91
    .line 92
    sget v2, Ll/dbc0;->a8:I

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->o:Lv/VImage;

    .line 98
    .line 99
    sget v2, Ll/dbc0;->hn:I

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 102
    .line 103
    .line 104
    new-instance v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;-><init>(Landroid/content/Context;)V

    .line 111
    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->q:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 114
    .line 115
    const/high16 v2, 0x41400000    # 12.0f

    .line 116
    .line 117
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    const/4 v3, 0x5

    .line 122
    const/4 v4, 0x6

    .line 123
    invoke-virtual {v0, v3, v4, v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView3;->e(III)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->i:Lv/VFrame;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/MbtiLayout;->q:Lcom/p1/mobile/putong/core/view/CardLabelShowView3;

    .line 129
    .line 130
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 131
    .line 132
    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method
