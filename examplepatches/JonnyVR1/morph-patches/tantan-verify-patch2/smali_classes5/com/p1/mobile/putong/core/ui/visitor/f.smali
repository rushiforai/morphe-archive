.class public Lcom/p1/mobile/putong/core/ui/visitor/f;
.super Lcom/p1/mobile/putong/core/ui/visitor/a;
.source "SourceFile"


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cfm0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/h80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/a$a;Ll/h80;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/visitor/a$a;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->e:Ljava/util/List;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->f:Ll/h80;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/cfm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/visitor/f;->F(Landroid/view/View;Ll/cfm0;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/pec0;->g2:I

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 v0, 0x3

    .line 19
    const/4 v2, -0x1

    .line 20
    const/4 v3, -0x2

    .line 21
    if-ne p2, v0, :cond_1

    .line 22
    .line 23
    new-instance p1, Landroid/widget/LinearLayout;

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    invoke-direct {p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 31
    .line 32
    invoke-direct {p2, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 33
    .line 34
    .line 35
    const/high16 v0, 0x43020000    # 130.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 42
    .line 43
    const/high16 v0, 0x41c00000    # 24.0f

    .line 44
    .line 45
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 50
    .line 51
    const/16 v0, 0x11

    .line 52
    .line 53
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    new-instance p2, Lv/VImage;

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    invoke-direct {p2, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 69
    .line 70
    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    .line 75
    .line 76
    sget v1, Ll/gbc0;->Q5:I

    .line 77
    .line 78
    invoke-virtual {p2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 79
    .line 80
    .line 81
    const/high16 v1, 0x41100000    # 9.0f

    .line 82
    .line 83
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-static {p2, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 88
    .line 89
    .line 90
    new-instance v2, Lv/VImage;

    .line 91
    .line 92
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    invoke-direct {v2, v4}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 95
    .line 96
    .line 97
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 98
    .line 99
    invoke-direct {v4, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    .line 104
    .line 105
    sget v4, Ll/gbc0;->Q5:I

    .line 106
    .line 107
    invoke-virtual {v2, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 108
    .line 109
    .line 110
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    invoke-static {v2, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 115
    .line 116
    .line 117
    new-instance v1, Lv/VText;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    const-string p0, "#d6d6d6"

    .line 125
    .line 126
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    const/high16 p0, 0x41500000    # 13.0f

    .line 134
    .line 135
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 136
    .line 137
    .line 138
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 139
    .line 140
    invoke-direct {p0, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 147
    .line 148
    .line 149
    sget p0, Ll/ddc0;->J:I

    .line 150
    .line 151
    invoke-virtual {v1, p0}, Landroid/view/View;->setId(I)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 161
    .line 162
    .line 163
    return-object p1

    .line 164
    :cond_1
    const/4 v0, 0x1

    .line 165
    if-ne p2, v0, :cond_2

    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    sget p2, Ll/pec0;->f2:I

    .line 174
    .line 175
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    return-object p0

    .line 180
    :cond_2
    new-instance p1, Lv/VText;

    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 183
    .line 184
    invoke-direct {p1, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 185
    .line 186
    .line 187
    const-string p0, "#66000000"

    .line 188
    .line 189
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    .line 195
    .line 196
    const/high16 p0, 0x41700000    # 15.0f

    .line 197
    .line 198
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 206
    .line 207
    .line 208
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 209
    .line 210
    invoke-direct {p0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 211
    .line 212
    .line 213
    sget p2, Ll/qa00;->j:I

    .line 214
    .line 215
    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 216
    .line 217
    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 218
    .line 219
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 220
    .line 221
    .line 222
    const/16 p0, 0x50

    .line 223
    .line 224
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 225
    .line 226
    .line 227
    return-object p1
.end method

.method public E(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/cfm0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Landroid/view/View;Ll/cfm0;II)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;

    .line 5
    .line 6
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->c:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    .line 9
    .line 10
    invoke-virtual {p1, p3, p2, p4, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowNoPrivilegeItemView;->g(Lcom/p1/mobile/android/app/Act;Ll/cfm0;ILcom/p1/mobile/putong/core/ui/visitor/a$a;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x3

    .line 15
    if-ne p3, v0, :cond_1

    .line 16
    .line 17
    sget p0, Ll/ddc0;->J:I

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lv/VText;

    .line 24
    .line 25
    iget-object p1, p2, Ll/cfm0;->f:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    const/4 v0, 0x1

    .line 32
    if-ne p3, v0, :cond_2

    .line 33
    .line 34
    move-object p3, p1

    .line 35
    check-cast p3, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowHasPrivilegeItemView;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    invoke-virtual {p3, v0, p2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFlowHasPrivilegeItemView;->c(Lcom/p1/mobile/android/app/Act;Ll/cfm0;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->f:Ll/h80;

    .line 43
    .line 44
    invoke-virtual {p0, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    if-nez p3, :cond_3

    .line 49
    .line 50
    check-cast p1, Lv/VText;

    .line 51
    .line 52
    iget-object p0, p2, Ll/cfm0;->c:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    return-void
.end method

.method public G(I)Ll/cfm0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/cfm0;

    .line 8
    .line 9
    return-object p0
.end method

.method public e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->c:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/a$a;->e(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/f;->G(I)Ll/cfm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/f;->G(I)Ll/cfm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cfm0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x2

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p1, p0, Ll/cfm0;->f:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x3

    .line 22
    return p0

    .line 23
    :cond_1
    invoke-virtual {p0}, Ll/cfm0;->c()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->f:Ll/h80;

    .line 5
    .line 6
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/h80;->g(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/f;->f:Ll/h80;

    .line 5
    .line 6
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/h80;->i(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
