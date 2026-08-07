.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->z(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->g(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string v1, "0"

    .line 17
    .line 18
    iget-object v2, v0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    const/16 v3, 0x8

    .line 26
    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->b:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->d:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->f(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->c:Lv/VDraweeView;

    .line 46
    .line 47
    if-ne p2, v1, :cond_1

    .line 48
    .line 49
    sget v1, Ll/lbc0;->k0:I

    .line 50
    .line 51
    invoke-virtual {v3, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    sget v1, Ll/lbc0;->j0:I

    .line 56
    .line 57
    invoke-virtual {v3, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->b:Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->f(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->d:Landroid/view/View;

    .line 73
    .line 74
    if-ne p2, v1, :cond_3

    .line 75
    .line 76
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget-boolean v1, v0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isIconLocal:Z

    .line 84
    .line 85
    if-eqz v1, :cond_4

    .line 86
    .line 87
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->c:Lv/VDraweeView;

    .line 90
    .line 91
    new-instance v4, Ljava/lang/StringBuilder;

    .line 92
    .line 93
    const-string v5, "file://"

    .line 94
    .line 95
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getIconUrl()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-virtual {v1, v3, v4}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_4
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->c:Lv/VDraweeView;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getIconUrl()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v1, v3, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    .line 125
    .line 126
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->f(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-ne p2, v1, :cond_5

    .line 131
    .line 132
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->a:Landroid/widget/TextView;

    .line 133
    .line 134
    const/4 v2, 0x1

    .line 135
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->a:Landroid/widget/TextView;

    .line 144
    .line 145
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 150
    .line 151
    .line 152
    :goto_2
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->a:Landroid/widget/TextView;

    .line 153
    .line 154
    const-string v2, "#ffffff"

    .line 155
    .line 156
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    .line 162
    .line 163
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->c:Lv/VDraweeView;

    .line 164
    .line 165
    sget v2, Ll/lbc0;->e0:I

    .line 166
    .line 167
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 168
    .line 169
    .line 170
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->a:Landroid/widget/TextView;

    .line 171
    .line 172
    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getName()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    .line 178
    .line 179
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->b:Landroid/widget/TextView;

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getPercent()F

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    const/high16 v2, 0x42c80000    # 100.0f

    .line 186
    .line 187
    mul-float/2addr v0, v2

    .line 188
    float-to-int v0, v0

    .line 189
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->e:Landroid/view/View;

    .line 197
    .line 198
    new-instance v1, Ll/imi;

    .line 199
    .line 200
    invoke-direct {v1, p0, p1}, Ll/imi;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->getItemCount()I

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;->a(II)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public C(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/tec0;->S:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;-><init>(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-object p1
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->g(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->A(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->C(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$c;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;->e(Lcom/p1/mobile/putong/feed/newui/camera/widget/FilterMenuView;)Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getAdapterPosition()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
