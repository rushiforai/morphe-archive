.class public Ll/ufg;
.super Landroidx/recyclerview/widget/RecyclerView$e0;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VLinear;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$e0;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Ll/ufg;->a:Z

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/ufg;->a(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/jdc0;->p:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/ufg;->b:Lv/VDraweeView;

    .line 10
    .line 11
    sget v0, Ll/jdc0;->r0:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Ll/ufg;->c:Lv/VText;

    .line 20
    .line 21
    sget v0, Ll/jdc0;->V:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VText;

    .line 28
    .line 29
    iput-object v0, p0, Ll/ufg;->d:Lv/VText;

    .line 30
    .line 31
    sget v0, Ll/jdc0;->R0:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VLinear;

    .line 38
    .line 39
    iput-object v0, p0, Ll/ufg;->f:Lv/VLinear;

    .line 40
    .line 41
    sget v0, Ll/jdc0;->G:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lv/VText;

    .line 48
    .line 49
    iput-object p1, p0, Ll/ufg;->e:Lv/VText;

    .line 50
    .line 51
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ufg;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getAvatar()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "context_livingAct"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/ufg;->c:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ufg;->c:Lv/VText;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/ufg;->e:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getDesc()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/ufg;->d:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getCategory()Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/ufg;->d:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getCategory()Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$CategoryBean;->getColor()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/ufg;->f:Lv/VLinear;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViewsInLayout()V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/ufg;->f:Lv/VLinear;

    .line 79
    .line 80
    const/4 v1, 0x0

    .line 81
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getTags()Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-nez v0, :cond_0

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$FansbaseGroupsItem;->getTags()Ljava/util/List;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_2

    .line 104
    .line 105
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$TagItemBean;

    .line 110
    .line 111
    iget-boolean v1, p0, Ll/ufg;->a:Z

    .line 112
    .line 113
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 114
    .line 115
    if-eqz v1, :cond_1

    .line 116
    .line 117
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    sget v3, Ll/vec0;->E:I

    .line 122
    .line 123
    invoke-static {v1, v3, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lv/VText;

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_1
    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    sget v3, Ll/vec0;->D:I

    .line 135
    .line 136
    invoke-static {v1, v3, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    check-cast v1, Lv/VText;

    .line 141
    .line 142
    :goto_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean$TagItemBean;->getName()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 150
    .line 151
    const/4 v3, -0x2

    .line 152
    invoke-direct {v0, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 153
    .line 154
    .line 155
    sget v3, Ll/qa00;->e:I

    .line 156
    .line 157
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 158
    .line 159
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Ll/ufg;->f:Lv/VLinear;

    .line 163
    .line 164
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 165
    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_2
    :goto_2
    return-void
.end method
