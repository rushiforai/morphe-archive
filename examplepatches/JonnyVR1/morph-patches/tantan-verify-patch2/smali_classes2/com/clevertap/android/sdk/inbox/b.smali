.class Lcom/clevertap/android/sdk/inbox/b;
.super Lcom/clevertap/android/sdk/inbox/d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inbox/b$a;
    }
.end annotation


# instance fields
.field private final r:Landroid/widget/RelativeLayout;

.field private final s:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

.field private final t:Landroid/widget/LinearLayout;

.field private final u:Landroid/widget/TextView;

.field private final v:Landroid/widget/TextView;

.field private final w:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inbox/d;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/icc0;->e0:I

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->s:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 13
    .line 14
    sget v0, Ll/icc0;->L0:I

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/widget/LinearLayout;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->t:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    sget v0, Ll/icc0;->F0:I

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->u:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/icc0;->E0:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/TextView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->v:Landroid/widget/TextView;

    .line 43
    .line 44
    sget v0, Ll/icc0;->P0:I

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/widget/TextView;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->w:Landroid/widget/TextView;

    .line 53
    .line 54
    sget v0, Ll/icc0;->b:I

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/b;->r:Landroid/widget/RelativeLayout;

    .line 63
    .line 64
    return-void
.end method

.method public static synthetic t(Lcom/clevertap/android/sdk/inbox/b;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/b;->u:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u(Lcom/clevertap/android/sdk/inbox/b;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/b;->v:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public f(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;I)V
    .locals 13

    .line 1
    invoke-super/range {p0 .. p3}, Lcom/clevertap/android/sdk/inbox/d;->f(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/d;->i()Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 5
    .line 6
    .line 7
    move-result-object v6

    .line 8
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v8

    .line 16
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 26
    .line 27
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->u:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->v:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->u:Landroid/widget/TextView;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->s()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->u:Landroid/widget/TextView;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->t()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->v:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->p()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->v:Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->q()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->k()Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    iget-object v4, p0, Lcom/clevertap/android/sdk/inbox/d;->q:Landroid/widget/ImageView;

    .line 86
    .line 87
    if-eqz v3, :cond_0

    .line 88
    .line 89
    const/16 v3, 0x8

    .line 90
    .line 91
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    :goto_0
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->w:Landroid/widget/TextView;

    .line 99
    .line 100
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->c()J

    .line 104
    .line 105
    .line 106
    move-result-wide v3

    .line 107
    invoke-virtual {p0, v3, v4}, Lcom/clevertap/android/sdk/inbox/d;->e(J)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    iget-object v4, p0, Lcom/clevertap/android/sdk/inbox/b;->w:Landroid/widget/TextView;

    .line 112
    .line 113
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->w:Landroid/widget/TextView;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->t()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->r:Landroid/widget/RelativeLayout;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->s:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 143
    .line 144
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    move-object v11, v0

    .line 149
    check-cast v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 150
    .line 151
    new-instance v7, Ll/nu3;

    .line 152
    .line 153
    move-object v10, p1

    .line 154
    move-object v9, p2

    .line 155
    move/from16 v12, p3

    .line 156
    .line 157
    invoke-direct/range {v7 .. v12}, Ll/nu3;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Landroid/widget/LinearLayout$LayoutParams;I)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/b;->s:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 161
    .line 162
    invoke-virtual {v0, v7}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->t:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    if-lez v3, :cond_1

    .line 180
    .line 181
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->t:Landroid/widget/LinearLayout;

    .line 182
    .line 183
    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 184
    .line 185
    .line 186
    :cond_1
    new-array v4, v0, [Landroid/widget/ImageView;

    .line 187
    .line 188
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/b;->t:Landroid/widget/LinearLayout;

    .line 189
    .line 190
    invoke-virtual {p0, v4, v0, v8, v3}, Lcom/clevertap/android/sdk/inbox/d;->q([Landroid/widget/ImageView;ILandroid/content/Context;Landroid/widget/LinearLayout;)V

    .line 191
    .line 192
    .line 193
    aget-object v0, v4, v2

    .line 194
    .line 195
    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    sget v3, Ll/wbc0;->m:I

    .line 200
    .line 201
    const/4 v5, 0x0

    .line 202
    invoke-static {v2, v3, v5}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 207
    .line 208
    .line 209
    new-instance v0, Lcom/clevertap/android/sdk/inbox/b$a;

    .line 210
    .line 211
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    move-object v3, p0

    .line 220
    move-object v1, p0

    .line 221
    move-object v5, p1

    .line 222
    invoke-direct/range {v0 .. v5}, Lcom/clevertap/android/sdk/inbox/b$a;-><init>(Lcom/clevertap/android/sdk/inbox/b;Landroid/content/Context;Lcom/clevertap/android/sdk/inbox/b;[Landroid/widget/ImageView;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)V

    .line 223
    .line 224
    .line 225
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/b;->s:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 226
    .line 227
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 228
    .line 229
    .line 230
    iget-object v9, p0, Lcom/clevertap/android/sdk/inbox/b;->r:Landroid/widget/RelativeLayout;

    .line 231
    .line 232
    new-instance v0, Lcom/clevertap/android/sdk/inbox/e;

    .line 233
    .line 234
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/b;->s:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 235
    .line 236
    move-object v4, v6

    .line 237
    const/4 v6, 0x1

    .line 238
    const/4 v7, -0x1

    .line 239
    const/4 v3, 0x0

    .line 240
    move-object v2, p1

    .line 241
    move/from16 v1, p3

    .line 242
    .line 243
    invoke-direct/range {v0 .. v7}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;Landroidx/viewpager/widget/ViewPager;ZI)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v9, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    .line 248
    .line 249
    move/from16 v12, p3

    .line 250
    .line 251
    invoke-virtual {p0, p1, v12}, Lcom/clevertap/android/sdk/inbox/d;->l(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;I)V

    .line 252
    .line 253
    .line 254
    return-void
.end method
