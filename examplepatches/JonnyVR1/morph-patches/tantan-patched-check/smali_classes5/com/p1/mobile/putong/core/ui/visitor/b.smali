.class public Lcom/p1/mobile/putong/core/ui/visitor/b;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->e:Ljava/util/List;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->f:Ll/h80;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/ui/visitor/b;Ll/cfm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/b;->K(Ll/cfm0;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/cfm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/visitor/b;->G(Landroid/view/View;Ll/cfm0;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->e:Ljava/util/List;

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
    sget p2, Ll/pec0;->j2:I

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
    const/4 v3, 0x4

    .line 21
    if-eq p2, v0, :cond_3

    .line 22
    .line 23
    if-ne p2, v3, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v0, 0x1

    .line 27
    if-ne p2, v0, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget p2, Ll/pec0;->h2:I

    .line 36
    .line 37
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_2
    new-instance p1, Lv/VText;

    .line 43
    .line 44
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    invoke-direct {p1, p2}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    sget p2, Ll/f9c0;->e:I

    .line 56
    .line 57
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    const/high16 p0, 0x41600000    # 14.0f

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 74
    .line 75
    .line 76
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 77
    .line 78
    const/high16 p2, 0x42300000    # 44.0f

    .line 79
    .line 80
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    invoke-direct {p0, v2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 85
    .line 86
    .line 87
    const/high16 p2, 0x41800000    # 16.0f

    .line 88
    .line 89
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 94
    .line 95
    const/high16 p2, 0x40800000    # 4.0f

    .line 96
    .line 97
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    .line 105
    .line 106
    const/16 p0, 0x50

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 109
    .line 110
    .line 111
    return-object p1

    .line 112
    :cond_3
    :goto_0
    new-instance p1, Landroid/widget/LinearLayout;

    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 117
    .line 118
    .line 119
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 120
    .line 121
    const/4 v1, -0x2

    .line 122
    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 123
    .line 124
    .line 125
    const/high16 v2, 0x43020000    # 130.0f

    .line 126
    .line 127
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 132
    .line 133
    const/high16 v2, 0x41c00000    # 24.0f

    .line 134
    .line 135
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 140
    .line 141
    if-ne p2, v3, :cond_4

    .line 142
    .line 143
    const/high16 p2, 0x42a80000    # 84.0f

    .line 144
    .line 145
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    iput p2, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 150
    .line 151
    const/high16 p2, 0x42080000    # 34.0f

    .line 152
    .line 153
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    iput p2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 158
    .line 159
    :cond_4
    const/16 p2, 0x11

    .line 160
    .line 161
    iput p2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 162
    .line 163
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    .line 168
    .line 169
    new-instance v0, Lv/VImage;

    .line 170
    .line 171
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 172
    .line 173
    invoke-direct {v0, v2}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 174
    .line 175
    .line 176
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 177
    .line 178
    invoke-direct {v2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    .line 183
    .line 184
    sget v2, Ll/gbc0;->Q5:I

    .line 185
    .line 186
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 187
    .line 188
    .line 189
    const/high16 v2, 0x41100000    # 9.0f

    .line 190
    .line 191
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 192
    .line 193
    .line 194
    move-result v3

    .line 195
    invoke-static {v0, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 196
    .line 197
    .line 198
    new-instance v3, Lv/VImage;

    .line 199
    .line 200
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 201
    .line 202
    invoke-direct {v3, v4}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 203
    .line 204
    .line 205
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 206
    .line 207
    invoke-direct {v4, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 211
    .line 212
    .line 213
    sget v4, Ll/gbc0;->Q5:I

    .line 214
    .line 215
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 216
    .line 217
    .line 218
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    invoke-static {v3, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 223
    .line 224
    .line 225
    new-instance v2, Lv/VText;

    .line 226
    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 228
    .line 229
    invoke-direct {v2, p0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 230
    .line 231
    .line 232
    const-string p0, "#d6d6d6"

    .line 233
    .line 234
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 239
    .line 240
    .line 241
    const/high16 p0, 0x41500000    # 13.0f

    .line 242
    .line 243
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 244
    .line 245
    .line 246
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 247
    .line 248
    invoke-direct {p0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v2, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 255
    .line 256
    .line 257
    sget p0, Ll/ddc0;->J:I

    .line 258
    .line 259
    invoke-virtual {v2, p0}, Landroid/view/View;->setId(I)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 269
    .line 270
    .line 271
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G(Landroid/view/View;Ll/cfm0;II)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->c:Lcom/p1/mobile/putong/core/ui/visitor/a$a;

    .line 7
    .line 8
    invoke-virtual {p1, p2, p4, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsUnPrivilegeView;->q(Ll/cfm0;ILcom/p1/mobile/putong/core/ui/visitor/a$a;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x3

    .line 13
    if-eq p3, v0, :cond_4

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    if-ne p3, v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 v0, 0x1

    .line 20
    if-ne p3, v0, :cond_2

    .line 21
    .line 22
    move-object p3, p1

    .line 23
    check-cast p3, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsView;

    .line 24
    .line 25
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsView;->d(Ll/cfm0;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->f:Ll/h80;

    .line 29
    .line 30
    invoke-virtual {v0, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p3, p2}, Lcom/p1/mobile/putong/core/ui/visitor/b;->J(Landroid/view/View;Ll/cfm0;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    if-nez p3, :cond_3

    .line 38
    .line 39
    check-cast p1, Lv/VText;

    .line 40
    .line 41
    iget-object p0, p2, Ll/cfm0;->c:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :cond_3
    return-void

    .line 47
    :cond_4
    :goto_0
    sget p0, Ll/ddc0;->J:I

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Lv/VText;

    .line 54
    .line 55
    iget-object p1, p2, Ll/cfm0;->f:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final H(Ll/cfm0;)V
    .locals 1

    .line 1
    const-string p0, "moment_visitor_type"

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cfm0;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Visitor;->userId:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "owner_id"

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "e_moment_visitor_detail"

    .line 26
    .line 27
    const-string v0, "p_moment_visitor"

    .line 28
    .line 29
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public I(I)Ll/cfm0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->e:Ljava/util/List;

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

.method public final J(Landroid/view/View;Ll/cfm0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ot00;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/ot00;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/b;Ll/cfm0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic K(Ll/cfm0;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/b;->H(Ll/cfm0;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/a;->d:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iget-object p1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Visitor;->userId:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "moment_visitor"

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-interface {v0, p0, p1, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->jr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/b;->I(I)Ll/cfm0;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/b;->I(I)Ll/cfm0;

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
    if-nez p1, :cond_2

    .line 20
    .line 21
    iget-boolean p0, p0, Ll/cfm0;->g:Z

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x4

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x3

    .line 28
    return p0

    .line 29
    :cond_2
    invoke-virtual {p0}, Ll/cfm0;->c()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_3
    const/4 p0, 0x0

    .line 38
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->f:Ll/h80;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/b;->f:Ll/h80;

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
