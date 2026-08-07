.class Lcom/clevertap/android/sdk/inbox/a;
.super Lcom/clevertap/android/sdk/inbox/d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inbox/a$a;
    }
.end annotation


# instance fields
.field private final r:Landroid/widget/TextView;

.field private final s:Landroid/widget/RelativeLayout;

.field private final t:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

.field private final u:Landroid/widget/LinearLayout;


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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/a;->t:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/a;->u:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    sget v0, Ll/icc0;->c:I

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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/a;->r:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/icc0;->b:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/a;->s:Landroid/widget/RelativeLayout;

    .line 43
    .line 44
    return-void
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
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/a;->r:Landroid/widget/TextView;

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->k()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iget-object v4, p0, Lcom/clevertap/android/sdk/inbox/d;->q:Landroid/widget/ImageView;

    .line 37
    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    const/16 v3, 0x8

    .line 41
    .line 42
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->c()J

    .line 50
    .line 51
    .line 52
    move-result-wide v3

    .line 53
    invoke-virtual {p0, v3, v4}, Lcom/clevertap/android/sdk/inbox/d;->e(J)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget-object v4, p0, Lcom/clevertap/android/sdk/inbox/a;->r:Landroid/widget/TextView;

    .line 58
    .line 59
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/a;->r:Landroid/widget/TextView;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->t()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/a;->s:Landroid/widget/RelativeLayout;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/a;->t:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    move-object v11, v0

    .line 95
    check-cast v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 96
    .line 97
    new-instance v7, Ll/nu3;

    .line 98
    .line 99
    move-object v10, p1

    .line 100
    move-object v9, p2

    .line 101
    move/from16 v12, p3

    .line 102
    .line 103
    invoke-direct/range {v7 .. v12}, Ll/nu3;-><init>(Landroid/content/Context;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Landroid/widget/LinearLayout$LayoutParams;I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/a;->t:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 107
    .line 108
    invoke-virtual {v0, v7}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/a;->u:Landroid/widget/LinearLayout;

    .line 120
    .line 121
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-lez v3, :cond_1

    .line 126
    .line 127
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/a;->u:Landroid/widget/LinearLayout;

    .line 128
    .line 129
    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 130
    .line 131
    .line 132
    :cond_1
    new-array v4, v0, [Landroid/widget/ImageView;

    .line 133
    .line 134
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/a;->u:Landroid/widget/LinearLayout;

    .line 135
    .line 136
    invoke-virtual {p0, v4, v0, v8, v3}, Lcom/clevertap/android/sdk/inbox/d;->q([Landroid/widget/ImageView;ILandroid/content/Context;Landroid/widget/LinearLayout;)V

    .line 137
    .line 138
    .line 139
    aget-object v0, v4, v2

    .line 140
    .line 141
    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    sget v3, Ll/wbc0;->m:I

    .line 146
    .line 147
    const/4 v5, 0x0

    .line 148
    invoke-static {v2, v3, v5}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 153
    .line 154
    .line 155
    new-instance v0, Lcom/clevertap/android/sdk/inbox/a$a;

    .line 156
    .line 157
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    move-object v3, p0

    .line 166
    move-object v1, p0

    .line 167
    move-object v5, p1

    .line 168
    invoke-direct/range {v0 .. v5}, Lcom/clevertap/android/sdk/inbox/a$a;-><init>(Lcom/clevertap/android/sdk/inbox/a;Landroid/content/Context;Lcom/clevertap/android/sdk/inbox/a;[Landroid/widget/ImageView;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/a;->t:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 172
    .line 173
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 174
    .line 175
    .line 176
    iget-object v9, p0, Lcom/clevertap/android/sdk/inbox/a;->s:Landroid/widget/RelativeLayout;

    .line 177
    .line 178
    new-instance v0, Lcom/clevertap/android/sdk/inbox/e;

    .line 179
    .line 180
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/a;->t:Lcom/clevertap/android/sdk/inbox/CTCarouselViewPager;

    .line 181
    .line 182
    move-object v4, v6

    .line 183
    const/4 v6, 0x1

    .line 184
    const/4 v7, -0x1

    .line 185
    const/4 v3, 0x0

    .line 186
    move-object v2, p1

    .line 187
    move/from16 v1, p3

    .line 188
    .line 189
    invoke-direct/range {v0 .. v7}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;Landroidx/viewpager/widget/ViewPager;ZI)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v9, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    .line 194
    .line 195
    move/from16 v12, p3

    .line 196
    .line 197
    invoke-virtual {p0, p1, v12}, Lcom/clevertap/android/sdk/inbox/d;->l(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;I)V

    .line 198
    .line 199
    .line 200
    return-void
.end method
