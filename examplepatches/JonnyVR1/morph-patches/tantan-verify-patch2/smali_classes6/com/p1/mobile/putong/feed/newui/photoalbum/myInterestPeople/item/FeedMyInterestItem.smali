.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/uql;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/uql<",
        "Ll/mah;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText;

.field public C:Landroid/widget/LinearLayout;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public E0:Lv/VText;

.field public F:Landroid/widget/LinearLayout;

.field public F0:Landroid/widget/LinearLayout;

.field public G:Lv/VText;

.field public G0:Lv/VText;

.field public H:Lv/VText;

.field public H0:Lv/VText;

.field public I:Landroid/widget/LinearLayout;

.field public I0:Landroid/widget/LinearLayout;

.field public J:Lv/VText;

.field public J0:Lv/VText;

.field public K:Lv/VText;

.field public K0:Lv/VText;

.field public L:Landroid/widget/LinearLayout;

.field public L0:Landroid/widget/LinearLayout;

.field public M:Lv/VText;

.field public M0:Lv/VText;

.field public N:Lv/VText;

.field public N0:Lv/VText;

.field public O:Landroid/widget/LinearLayout;

.field public O0:Lv/VText;

.field public P:Lv/VText;

.field public P0:Landroid/widget/LinearLayout;

.field public Q:Lv/VText;

.field public Q0:Lv/VText;

.field public R:Landroid/widget/LinearLayout;

.field public R0:Lv/VText;

.field public S:Lv/VText;

.field public S0:Landroid/widget/LinearLayout;

.field public T:Lv/VText;

.field public T0:Lv/VText;

.field public U:Landroid/widget/LinearLayout;

.field public U0:Lv/VText;

.field public V:Lv/VText;

.field public V0:Landroid/widget/LinearLayout;

.field public W:Lv/VText;

.field public W0:Lv/VText;

.field public X0:Lv/VText;

.field public Y0:Landroid/widget/LinearLayout;

.field public Z0:Lv/VText;

.field public a:Lv/VScroll;

.field public a1:Lv/VText;

.field public b:Landroid/widget/LinearLayout;

.field public b1:Landroid/widget/TextView;

.field public c:Lv/VDraweeView;

.field public c1:Lv/VText_Tags;

.field public d:Landroid/widget/RelativeLayout;

.field public d1:Landroid/widget/TextView;

.field public e:Landroid/widget/ImageView;

.field public e1:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public f1:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

.field public g:Landroid/widget/LinearLayout;

.field public g1:Lcom/p1/mobile/android/app/Act;

.field public h:Lv/VText;

.field public h1:Ll/lrl;

.field public i:Lv/VText;

.field public i1:Ll/mah;

.field public j:Landroid/widget/ImageView;

.field public final j1:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/view/View;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public k:Landroid/widget/ImageView;

.field public k0:Landroid/widget/LinearLayout;

.field public k1:I

.field public l:Lv/VText;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/LinearLayout;

.field public o:Lv/VDraweeView;

.field public p:Lv/VDraweeView;

.field public p0:Lv/VText;

.field public q:Lv/VDraweeView;

.field public r:Lv/VDraweeView;

.field public s:Lv/VText;

.field public t:Landroid/widget/LinearLayout;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Landroid/widget/LinearLayout;

.field public x:Lv/VText;

.field public y:Lv/VText;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/lrl;I)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->j1:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->h1:Ll/lrl;

    .line 14
    .line 15
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    const/high16 p2, 0x41800000    # 16.0f

    .line 27
    .line 28
    invoke-static {p1, p2}, Ll/ezq;->b(Landroid/view/View;F)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->b:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    sget p1, Ll/lbc0;->V4:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 43
    .line 44
    .line 45
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->k1:I

    .line 46
    .line 47
    return-void
.end method

.method public static F(Ljava/util/List;Ljava/util/List;IZI)Landroid/text/SpannableStringBuilder;
    .locals 34
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;IZI)",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x3

    .line 12
    if-lt v1, v3, :cond_0

    .line 13
    .line 14
    move-object/from16 v4, p0

    .line 15
    .line 16
    invoke-interface {v4, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->clear()V

    .line 21
    .line 22
    .line 23
    move-object/from16 v3, p1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object/from16 v4, p0

    .line 27
    .line 28
    sub-int/2addr v3, v1

    .line 29
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    move-object/from16 v3, p1

    .line 38
    .line 39
    invoke-interface {v3, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    move-object v3, v1

    .line 44
    move-object v1, v4

    .line 45
    :goto_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const-string v5, " "

    .line 50
    .line 51
    const/16 v6, 0x21

    .line 52
    .line 53
    const/high16 v7, 0x42300000    # 44.0f

    .line 54
    .line 55
    const-string v8, "1"

    .line 56
    .line 57
    if-eqz v4, :cond_2

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    if-eqz v4, :cond_2

    .line 68
    .line 69
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    check-cast v4, Lcom/p1/mobile/putong/data/Tag;

    .line 74
    .line 75
    if-eqz p3, :cond_1

    .line 76
    .line 77
    invoke-virtual {v0, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v9, v4, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v9}, Lcom/p1/mobile/putong/data/Profile;->categoryToIndex(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    new-instance v10, Ll/hfh;

    .line 86
    .line 87
    sget-object v11, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 88
    .line 89
    iget-object v12, v4, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 90
    .line 91
    const/16 v19, 0x1

    .line 92
    .line 93
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v20

    .line 97
    const/4 v13, -0x1

    .line 98
    const v14, -0x181e3

    .line 99
    .line 100
    .line 101
    const/16 v16, 0x6

    .line 102
    .line 103
    const/high16 v18, 0x41500000    # 13.0f

    .line 104
    .line 105
    move/from16 v15, p2

    .line 106
    .line 107
    move/from16 v17, p4

    .line 108
    .line 109
    invoke-direct/range {v10 .. v20}, Ll/hfh;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFZI)V

    .line 110
    .line 111
    .line 112
    add-int/lit8 v4, v2, 0x1

    .line 113
    .line 114
    invoke-virtual {v0, v10, v2, v4, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 115
    .line 116
    .line 117
    move v2, v4

    .line 118
    goto :goto_1

    .line 119
    :cond_1
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_2
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_4

    .line 128
    .line 129
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v3

    .line 137
    if-eqz v3, :cond_4

    .line 138
    .line 139
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/p1/mobile/putong/data/Tag;

    .line 144
    .line 145
    if-eqz p3, :cond_3

    .line 146
    .line 147
    invoke-virtual {v0, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 148
    .line 149
    .line 150
    iget-object v4, v3, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v4}, Lcom/p1/mobile/putong/data/Profile;->categoryToIndex(Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    new-instance v21, Ll/hfh;

    .line 156
    .line 157
    sget-object v22, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 158
    .line 159
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 160
    .line 161
    const/high16 v4, 0x40400000    # 3.0f

    .line 162
    .line 163
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    int-to-float v4, v4

    .line 168
    const/16 v32, 0x1

    .line 169
    .line 170
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 171
    .line 172
    .line 173
    move-result v33

    .line 174
    const/high16 v24, -0x1a000000

    .line 175
    .line 176
    const v25, 0xffffff

    .line 177
    .line 178
    .line 179
    const/16 v27, 0x6

    .line 180
    .line 181
    const/high16 v29, 0x41500000    # 13.0f

    .line 182
    .line 183
    const/high16 v30, 0x7000000

    .line 184
    .line 185
    move/from16 v26, p2

    .line 186
    .line 187
    move/from16 v28, p4

    .line 188
    .line 189
    move-object/from16 v23, v3

    .line 190
    .line 191
    move/from16 v31, v4

    .line 192
    .line 193
    invoke-direct/range {v21 .. v33}, Ll/hfh;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIFZI)V

    .line 194
    .line 195
    .line 196
    move-object/from16 v3, v21

    .line 197
    .line 198
    add-int/lit8 v4, v2, 0x1

    .line 199
    .line 200
    invoke-virtual {v0, v3, v2, v4, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 201
    .line 202
    .line 203
    move v2, v4

    .line 204
    goto :goto_2

    .line 205
    :cond_3
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 206
    .line 207
    .line 208
    goto :goto_2

    .line 209
    :cond_4
    return-object v0
.end method

.method public static T()Z
    .locals 5

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v3, "ja"

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    move v3, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v3, v1

    .line 24
    :goto_0
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v4, "ko"

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    move v0, v2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_1
    if-nez v3, :cond_3

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_2
    return v1

    .line 47
    :cond_3
    :goto_2
    return v2
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->z(Ll/mah;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->C(Ll/mah;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ljava/util/HashSet;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->D(Ll/mah;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->A(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->E(Ll/mah;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const/high16 v0, 0x41800000    # 16.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->F(Ljava/util/List;Ljava/util/List;IZI)Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static u(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    move-object v2, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 31
    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Ljava/lang/String;

    .line 41
    .line 42
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_2

    .line 47
    .line 48
    const-string v4, "\u4e2d\u56fd"

    .line 49
    .line 50
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-nez v4, :cond_2

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 60
    .line 61
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 62
    .line 63
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    move-object v2, v1

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 74
    .line 75
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ljava/lang/String;

    .line 84
    .line 85
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    const-string v5, "\u00b7"

    .line 90
    .line 91
    if-nez v4, :cond_5

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-nez v4, :cond_4

    .line 102
    .line 103
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 110
    .line 111
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 112
    .line 113
    iget-object v2, v2, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-eqz v2, :cond_6

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    move-object v1, p0

    .line 133
    check-cast v1, Ljava/lang/String;

    .line 134
    .line 135
    :goto_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_7

    .line 140
    .line 141
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0
.end method

.method public static v(Lcom/p1/mobile/putong/data/User;)J
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 36
    .line 37
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->frozenTime:J

    .line 38
    .line 39
    cmp-long p0, v1, v3

    .line 40
    .line 41
    if-lez p0, :cond_0

    .line 42
    .line 43
    return-wide v1

    .line 44
    :cond_0
    return-wide v3

    .line 45
    :cond_1
    const-wide/16 v0, 0x0

    .line 46
    .line 47
    return-wide v0
.end method


# virtual methods
.method public final synthetic A(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const-string p0, "\u793c\u8c8c\u56de\u8c22\u5df2\u53d1\u9001"

    .line 27
    .line 28
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic C(Ll/mah;Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {}, Ll/bch;->b()Ll/bch;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/bch;->c()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    const-string p2, "reply_thanks"

    .line 22
    .line 23
    invoke-static {p2}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    new-instance v7, Ll/ajh;

    .line 28
    .line 29
    invoke-direct {v7, p0}, Ll/ajh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;)V

    .line 30
    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    const/4 v5, 0x0

    .line 34
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    const-string v0, "moments_user_id"

    .line 44
    .line 45
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    filled-new-array {p2}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v0, "e_polite_gratitude"

    .line 54
    .line 55
    const-string v1, "p_interested_user"

    .line 56
    .line 57
    invoke-static {v0, v1, p2}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->h1:Ll/lrl;

    .line 61
    .line 62
    const/4 p2, 0x1

    .line 63
    invoke-interface {p0, p1, p2}, Ll/lrl;->q0(Ll/mah;Z)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic D(Ll/mah;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "card_user_id"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "e_follow"

    .line 18
    .line 19
    const-string v1, "p_interested_user"

    .line 20
    .line 21
    invoke-static {v0, v1, p2}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->h1:Ll/lrl;

    .line 25
    .line 26
    const/4 p2, 0x0

    .line 27
    invoke-interface {p0, p1, p2}, Ll/lrl;->q0(Ll/mah;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic E(Ll/mah;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "card_user_id"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    filled-new-array {p2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "e_interested_user_card_close"

    .line 18
    .line 19
    const-string v1, "p_interested_user"

    .line 20
    .line 21
    invoke-static {v0, v1, p2}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->h1:Ll/lrl;

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ll/lrl;->U(Ll/mah;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public G(Ll/mah;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i1:Ll/mah;

    .line 2
    .line 3
    invoke-super {p0, p1}, Ll/uql;->a(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v0, p2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Ll/wlj;

    .line 57
    .line 58
    new-instance p2, Ll/x0e0;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget v0, Ll/lbc0;->h1:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget-object v0, Ll/h1e0;->g:Ll/h1e0;

    .line 73
    .line 74
    invoke-direct {p2, p0, v0}, Ll/x0e0;-><init>(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public I(Ll/mah;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/mah;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 8
    .line 9
    const-string v1, "\u76f4\u63a5\u914d\u5bf9"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 15
    .line 16
    new-instance v1, Ll/xih;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Ll/xih;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p1}, Ll/mah;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-static {}, Ll/cmg;->K()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const-string v0, "\u793c\u8c8c\u56de\u8c22"

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 45
    .line 46
    new-instance v1, Ll/yih;

    .line 47
    .line 48
    invoke-direct {v1, p0, p1}, Ll/yih;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    const-string v0, "\u5173\u6ce8"

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 62
    .line 63
    const-string v1, "\u56de\u5173"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 69
    .line 70
    new-instance v1, Ll/zih;

    .line 71
    .line 72
    invoke-direct {v1, p0, p1}, Ll/zih;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->c1:Lv/VText_Tags;

    .line 17
    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->b1:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    new-instance p1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    new-instance p1, Ljava/util/HashSet;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 59
    .line 60
    invoke-direct {p1, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 61
    .line 62
    .line 63
    new-instance v1, Ll/m2a;

    .line 64
    .line 65
    invoke-direct {v1, p1}, Ll/m2a;-><init>(Ljava/util/HashSet;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Ll/uih;

    .line 73
    .line 74
    invoke-direct {v2, p1}, Ll/uih;-><init>(Ljava/util/HashSet;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    move-object v0, v1

    .line 82
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->c1:Lv/VText_Tags;

    .line 83
    .line 84
    new-instance v1, Ll/vih;

    .line 85
    .line 86
    invoke-direct {v1, v0, p1}, Ll/vih;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v1}, Lv/VText_Tags;->setTags(Ll/rcj;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->h:Lv/VText;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->h:Lv/VText;

    .line 12
    .line 13
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i:Lv/VText;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVipWithOutMe()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    xor-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->l:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->R(Lcom/p1/mobile/putong/data/User;Lv/VText;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->k:Landroid/widget/ImageView;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->j:Landroid/widget/ImageView;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i:Lv/VText;

    .line 69
    .line 70
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    :cond_1
    :goto_0
    return-void
.end method

.method public L(Ll/mah;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/mah;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->d1:Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "\u9519\u8fc7\u5979"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "\u4e0d\u611f\u5174\u8da3"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->d1:Landroid/widget/TextView;

    .line 21
    .line 22
    new-instance v1, Ll/wih;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/wih;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Ll/mah;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public M(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 6
    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K:Lv/VText;

    .line 13
    .line 14
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->F4:I

    .line 15
    .line 16
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->N:Lv/VText;

    .line 20
    .line 21
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 22
    .line 23
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->N:Lv/VText;

    .line 29
    .line 30
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->C4:I

    .line 31
    .line 32
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setHint(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->Q:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    goto/16 :goto_1

    .line 41
    .line 42
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->Q:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K:Lv/VText;

    .line 58
    .line 59
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 60
    .line 61
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 70
    .line 71
    const-string v4, "\u5176\u4ed6"

    .line 72
    .line 73
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    const-string v5, "\u5176\u5b83"

    .line 78
    .line 79
    if-nez v1, :cond_2

    .line 80
    .line 81
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 92
    .line 93
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_4

    .line 100
    .line 101
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 102
    .line 103
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_3

    .line 110
    .line 111
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K:Lv/VText;

    .line 122
    .line 123
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_4
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K:Lv/VText;

    .line 136
    .line 137
    if-eqz v1, :cond_5

    .line 138
    .line 139
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .line 151
    .line 152
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 153
    .line 154
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v5, "\u00b7"

    .line 160
    .line 161
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    iget-object v5, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 165
    .line 166
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 167
    .line 168
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K:Lv/VText;

    .line 179
    .line 180
    const-string v4, "\u6dfb\u52a0\u804c\u4e1a\u4fe1\u606f"

    .line 181
    .line 182
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->Q:Lv/VText;

    .line 186
    .line 187
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 188
    .line 189
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 190
    .line 191
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    .line 193
    .line 194
    :goto_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 195
    .line 196
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 197
    .line 198
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 199
    .line 200
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v4

    .line 204
    if-eqz v4, :cond_6

    .line 205
    .line 206
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 207
    .line 208
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    if-eqz v4, :cond_6

    .line 213
    .line 214
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    if-eqz v4, :cond_6

    .line 219
    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    .line 221
    .line 222
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 223
    .line 224
    .line 225
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 226
    .line 227
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string v4, "("

    .line 233
    .line 234
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 238
    .line 239
    sget v5, Lcom/p1/mobile/putong/feed/R$string;->y:I

    .line 240
    .line 241
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    const-string v4, ")"

    .line 249
    .line 250
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->T:Lv/VText;

    .line 258
    .line 259
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 260
    .line 261
    .line 262
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->T:Lv/VText;

    .line 263
    .line 264
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U(Lv/VText;)V

    .line 265
    .line 266
    .line 267
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->E:Lv/VText;

    .line 268
    .line 269
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S(Landroid/view/View;I)V

    .line 270
    .line 271
    .line 272
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->H:Lv/VText;

    .line 273
    .line 274
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S(Landroid/view/View;I)V

    .line 275
    .line 276
    .line 277
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->T()Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    const/4 v4, 0x1

    .line 282
    const-string v5, "unknown_"

    .line 283
    .line 284
    if-eqz v1, :cond_8

    .line 285
    .line 286
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 287
    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 289
    .line 290
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 291
    .line 292
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    if-nez v1, :cond_7

    .line 297
    .line 298
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 299
    .line 300
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 301
    .line 302
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 303
    .line 304
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    check-cast v1, Lcom/p1/mobile/putong/data/BloodType;

    .line 309
    .line 310
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    if-nez v1, :cond_7

    .line 315
    .line 316
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->B:Lv/VText;

    .line 317
    .line 318
    invoke-static {v1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 319
    .line 320
    .line 321
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->B:Lv/VText;

    .line 322
    .line 323
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 324
    .line 325
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 326
    .line 327
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 328
    .line 329
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object v6

    .line 333
    check-cast v6, Lcom/p1/mobile/putong/data/BloodType;

    .line 334
    .line 335
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->y(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v6

    .line 339
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 340
    .line 341
    .line 342
    goto :goto_2

    .line 343
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->B:Lv/VText;

    .line 344
    .line 345
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 346
    .line 347
    .line 348
    goto :goto_2

    .line 349
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->B:Lv/VText;

    .line 350
    .line 351
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 352
    .line 353
    .line 354
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->E0:Lv/VText;

    .line 355
    .line 356
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->w(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v6

    .line 360
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 361
    .line 362
    .line 363
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K0:Lv/VText;

    .line 364
    .line 365
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 366
    .line 367
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 368
    .line 369
    .line 370
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K:Lv/VText;

    .line 371
    .line 372
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U(Lv/VText;)V

    .line 373
    .line 374
    .line 375
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->N:Lv/VText;

    .line 376
    .line 377
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U(Lv/VText;)V

    .line 378
    .line 379
    .line 380
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->Q:Lv/VText;

    .line 381
    .line 382
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U(Lv/VText;)V

    .line 383
    .line 384
    .line 385
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->E0:Lv/VText;

    .line 386
    .line 387
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U(Lv/VText;)V

    .line 388
    .line 389
    .line 390
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K0:Lv/VText;

    .line 391
    .line 392
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U(Lv/VText;)V

    .line 393
    .line 394
    .line 395
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->N:Lv/VText;

    .line 396
    .line 397
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S(Landroid/view/View;I)V

    .line 398
    .line 399
    .line 400
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 401
    .line 402
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v1

    .line 406
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 407
    .line 408
    .line 409
    move-result v6

    .line 410
    if-nez v6, :cond_a

    .line 411
    .line 412
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->T()Z

    .line 413
    .line 414
    .line 415
    move-result v6

    .line 416
    if-eqz v6, :cond_9

    .line 417
    .line 418
    goto :goto_3

    .line 419
    :cond_9
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->y:Lv/VText;

    .line 420
    .line 421
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 422
    .line 423
    .line 424
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->w:Landroid/widget/LinearLayout;

    .line 425
    .line 426
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 427
    .line 428
    .line 429
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s:Lv/VText;

    .line 430
    .line 431
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 432
    .line 433
    .line 434
    goto :goto_4

    .line 435
    :cond_a
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->w:Landroid/widget/LinearLayout;

    .line 436
    .line 437
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 438
    .line 439
    .line 440
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 441
    .line 442
    .line 443
    move-result-object v1

    .line 444
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 445
    .line 446
    invoke-interface {v1, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 447
    .line 448
    .line 449
    move-result-object p1

    .line 450
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 451
    .line 452
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 453
    .line 454
    .line 455
    move-result v1

    .line 456
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->L0:Landroid/widget/LinearLayout;

    .line 457
    .line 458
    if-eqz v1, :cond_b

    .line 459
    .line 460
    invoke-virtual {p0, v6, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S(Landroid/view/View;I)V

    .line 461
    .line 462
    .line 463
    goto :goto_5

    .line 464
    :cond_b
    invoke-virtual {p0, v6, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S(Landroid/view/View;I)V

    .line 465
    .line 466
    .line 467
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->N0:Lv/VText;

    .line 468
    .line 469
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 470
    .line 471
    .line 472
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s:Lv/VText;

    .line 473
    .line 474
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 475
    .line 476
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 477
    .line 478
    .line 479
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->J:Lv/VText;

    .line 480
    .line 481
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 482
    .line 483
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->D4:I

    .line 488
    .line 489
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object v1

    .line 493
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 494
    .line 495
    .line 496
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->T()Z

    .line 497
    .line 498
    .line 499
    move-result p1

    .line 500
    if-eqz p1, :cond_c

    .line 501
    .line 502
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 503
    .line 504
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 505
    .line 506
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 507
    .line 508
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 509
    .line 510
    .line 511
    move-result p1

    .line 512
    if-nez p1, :cond_c

    .line 513
    .line 514
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 515
    .line 516
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 517
    .line 518
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 519
    .line 520
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 521
    .line 522
    .line 523
    move-result-object p1

    .line 524
    check-cast p1, Lcom/p1/mobile/putong/data/BloodType;

    .line 525
    .line 526
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 527
    .line 528
    .line 529
    move-result p1

    .line 530
    if-nez p1, :cond_c

    .line 531
    .line 532
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->z:Landroid/widget/LinearLayout;

    .line 533
    .line 534
    invoke-static {p0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 535
    .line 536
    .line 537
    :cond_c
    return-void
.end method

.method public N(Ll/mah;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->l:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->R(Lcom/p1/mobile/putong/data/User;Lv/VText;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->c:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const/high16 v0, 0x41800000    # 16.0f

    .line 41
    .line 42
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    int-to-float v0, v0

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-static {v1, v0, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->v(Z)Lcom/facebook/drawee/generic/RoundingParams;

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->c:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Ll/wlj;

    .line 68
    .line 69
    invoke-virtual {v2, v1}, Ll/wlj;->y(I)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->c:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ll/wlj;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Ll/mah;->d()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_0

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e:Landroid/widget/ImageView;

    .line 90
    .line 91
    sget v1, Ll/lbc0;->U1:I

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->f:Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const-string p1, "%s\u901a\u8fc7\u7cbe\u9009\u52a8\u6001\u559c\u6b22\u4e86\u4f60"

    .line 111
    .line 112
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_0
    invoke-virtual {p1}, Ll/mah;->c()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e:Landroid/widget/ImageView;

    .line 125
    .line 126
    if-eqz v0, :cond_1

    .line 127
    .line 128
    sget v0, Ll/lbc0;->U1:I

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->f:Landroid/widget/TextView;

    .line 134
    .line 135
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const-string p1, "%s\u70b9\u8d5e\u4e86\u4f60"

    .line 148
    .line 149
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_1
    sget v0, Ll/lbc0;->T1:I

    .line 158
    .line 159
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->f:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    const-string p1, "%s\u5173\u6ce8\u4e86\u4f60"

    .line 177
    .line 178
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public O(Ll/mah;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->B:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->z:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->E:Lv/VText;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->C:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->H:Lv/VText;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->F:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->I:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->N:Lv/VText;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->L:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->Q:Lv/VText;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->O:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->T:Lv/VText;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->R:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->E0:Lv/VText;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->k0:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->K0:Lv/VText;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->I0:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->H0:Lv/VText;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->F0:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->W:Lv/VText;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->O0:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->R0:Lv/VText;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->P0:Landroid/widget/LinearLayout;

    .line 86
    .line 87
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->U0:Lv/VText;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S0:Landroid/widget/LinearLayout;

    .line 93
    .line 94
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->X0:Lv/VText;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->V0:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->a1:Lv/VText;

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->Y0:Landroid/widget/LinearLayout;

    .line 107
    .line 108
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->s(Landroid/view/View;Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->M(Lcom/p1/mobile/putong/data/User;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public P(Ll/mah;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->J(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public Q(Ll/mah;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/mah;->a()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->m:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->n:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    move v2, v0

    .line 26
    move v3, v2

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-ge v2, v4, :cond_9

    .line 32
    .line 33
    const/4 v4, 0x4

    .line 34
    if-ne v3, v4, :cond_1

    .line 35
    .line 36
    goto :goto_3

    .line 37
    :cond_1
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    check-cast v5, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iget-object v6, v5, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    if-eqz v6, :cond_8

    .line 50
    .line 51
    iget-object v6, v5, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    instance-of v6, v6, Lcom/p1/mobile/putong/data/Picture;

    .line 58
    .line 59
    if-nez v6, :cond_2

    .line 60
    .line 61
    iget-object v6, v5, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    instance-of v6, v6, Lcom/p1/mobile/putong/data/Video;

    .line 68
    .line 69
    if-nez v6, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-eqz v6, :cond_8

    .line 83
    .line 84
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    check-cast v6, Lcom/p1/mobile/putong/data/Media;

    .line 89
    .line 90
    if-eqz v3, :cond_7

    .line 91
    .line 92
    const/4 v7, 0x1

    .line 93
    if-eq v3, v7, :cond_6

    .line 94
    .line 95
    const/4 v7, 0x2

    .line 96
    if-eq v3, v7, :cond_5

    .line 97
    .line 98
    const/4 v7, 0x3

    .line 99
    if-eq v3, v7, :cond_4

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_4
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->r:Lv/VDraweeView;

    .line 103
    .line 104
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->H(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_5
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->q:Lv/VDraweeView;

    .line 109
    .line 110
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->H(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_6
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->p:Lv/VDraweeView;

    .line 115
    .line 116
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->H(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_7
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->o:Lv/VDraweeView;

    .line 121
    .line 122
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->H(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 123
    .line 124
    .line 125
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 126
    .line 127
    if-ne v3, v4, :cond_3

    .line 128
    .line 129
    :cond_8
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_9
    :goto_3
    if-nez v3, :cond_a

    .line 133
    .line 134
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->m:Landroid/widget/TextView;

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->n:Landroid/widget/LinearLayout;

    .line 140
    .line 141
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->r()V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/data/User;Lv/VText;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->t(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_3

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 26
    .line 27
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 28
    .line 29
    if-eqz v2, :cond_3

    .line 30
    .line 31
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 32
    .line 33
    if-eqz v2, :cond_3

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_3

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_1

    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_0

    .line 70
    .line 71
    const-string p0, ""

    .line 72
    .line 73
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 86
    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p1, " \u00b7 "

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_4

    .line 130
    .line 131
    const/16 p1, 0x8

    .line 132
    .line 133
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S(Landroid/view/View;I)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :cond_4
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public S(Landroid/view/View;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->j1:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/View;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public U(Lv/VText;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->N0(Landroid/widget/TextView;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->S(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->G(Ll/mah;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->O(Ll/mah;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->Q(Ll/mah;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic d(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->I(Ll/mah;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic e(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->N(Ll/mah;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic f(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->L(Ll/mah;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic g(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->P(Ll/mah;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->k1:I

    .line 2
    .line 3
    return p0
.end method

.method public h()V
    .locals 15

    .line 1
    invoke-static {}, Ll/cmg;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "SHARE_TIP_MYINTEREST"

    .line 6
    .line 7
    const/high16 v2, 0x41200000    # 10.0f

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const-wide/16 v4, 0xbb8

    .line 11
    .line 12
    const/high16 v6, 0x42200000    # 40.0f

    .line 13
    .line 14
    const/high16 v7, 0x41400000    # 12.0f

    .line 15
    .line 16
    const/high16 v8, 0x41500000    # 13.0f

    .line 17
    .line 18
    const/high16 v9, 0x41100000    # 9.0f

    .line 19
    .line 20
    const/4 v10, 0x1

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i1:Ll/mah;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/mah;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 32
    .line 33
    iget-object v0, v0, Ll/jka;->L:Ll/byd0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ljava/lang/Long;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 42
    .line 43
    .line 44
    move-result-wide v11

    .line 45
    invoke-static {}, Ll/pzi0;->o()J

    .line 46
    .line 47
    .line 48
    move-result-wide v13

    .line 49
    invoke-static {v11, v12, v13, v14}, Ll/p6i;->l(JJ)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_0

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :cond_0
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 58
    .line 59
    iget-object v11, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-direct {v0, v11}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    const-string v11, "\u70b9\u51fb\u793c\u8c8c\u56de\u8c22\uff0c\u8868\u8fbe\u4f60\u7684\u611f\u8c22"

    .line 65
    .line 66
    invoke-virtual {v0, v11}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 67
    .line 68
    .line 69
    move-result-object v11

    .line 70
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    invoke-virtual {v11, v9}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    iget-object v11, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    invoke-virtual {v11}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    sget v12, Ll/k9c0;->n:I

    .line 85
    .line 86
    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getColor(I)I

    .line 87
    .line 88
    .line 89
    move-result v11

    .line 90
    filled-new-array {v11}, [I

    .line 91
    .line 92
    .line 93
    move-result-object v11

    .line 94
    invoke-virtual {v9, v11}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 95
    .line 96
    .line 97
    move-result-object v9

    .line 98
    invoke-virtual {v9, v8}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 99
    .line 100
    .line 101
    move-result-object v8

    .line 102
    invoke-virtual {v8, v10}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v7

    .line 110
    neg-int v7, v7

    .line 111
    invoke-virtual {v8, v7}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 116
    .line 117
    .line 118
    move-result v6

    .line 119
    invoke-virtual {v7, v6}, Lcom/p1/mobile/android/ui/bubble/a;->u(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    invoke-virtual {v6, v4, v5}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-virtual {v4, v10}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 128
    .line 129
    .line 130
    move-result-object v4

    .line 131
    invoke-virtual {v4, v3}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    sget v4, Ll/zvk;->C:I

    .line 136
    .line 137
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-virtual {v3, v4, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 146
    .line 147
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 148
    .line 149
    or-int/2addr v3, v4

    .line 150
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 151
    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 158
    .line 159
    invoke-virtual {v2, v0, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 163
    .line 164
    iget-object p0, p0, Ll/jka;->L:Ll/byd0;

    .line 165
    .line 166
    invoke-static {}, Ll/pzi0;->o()J

    .line 167
    .line 168
    .line 169
    move-result-wide v0

    .line 170
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_1
    new-instance v0, Ll/byd0;

    .line 179
    .line 180
    new-instance v11, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v12, "show_guide_time_interest_people"

    .line 183
    .line 184
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 188
    .line 189
    .line 190
    move-result-object v12

    .line 191
    invoke-interface {v12}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v12

    .line 195
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v11

    .line 202
    const-wide/16 v12, 0x0

    .line 203
    .line 204
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 205
    .line 206
    .line 207
    move-result-object v12

    .line 208
    invoke-direct {v0, v11, v12}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v11

    .line 215
    check-cast v11, Ljava/lang/Long;

    .line 216
    .line 217
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    .line 218
    .line 219
    .line 220
    move-result-wide v11

    .line 221
    invoke-static {}, Ll/pzi0;->o()J

    .line 222
    .line 223
    .line 224
    move-result-wide v13

    .line 225
    invoke-static {v11, v12, v13, v14}, Ll/p6i;->l(JJ)Z

    .line 226
    .line 227
    .line 228
    move-result v11

    .line 229
    if-eqz v11, :cond_2

    .line 230
    .line 231
    :goto_0
    return-void

    .line 232
    :cond_2
    new-instance v11, Lcom/p1/mobile/android/ui/bubble/a;

    .line 233
    .line 234
    iget-object v12, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 235
    .line 236
    invoke-direct {v11, v12}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 237
    .line 238
    .line 239
    iget-object v12, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i1:Ll/mah;

    .line 240
    .line 241
    invoke-virtual {v12}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 242
    .line 243
    .line 244
    move-result-object v12

    .line 245
    invoke-virtual {p0, v12}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v12

    .line 249
    new-instance v13, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    const-string v14, "\u4ed6\u4eec\u90fd\u5bf9\u4f60\u5f88\u611f\u5174\u8da3\uff0c\u5bf9"

    .line 252
    .line 253
    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string v14, "\u611f\u5174\u8da3\u5c31\u5173\u6ce8"

    .line 260
    .line 261
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string v12, "\u5427"

    .line 268
    .line 269
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v12

    .line 276
    invoke-virtual {v11, v12}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 277
    .line 278
    .line 279
    move-result-object v12

    .line 280
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 281
    .line 282
    .line 283
    move-result v9

    .line 284
    invoke-virtual {v12, v9}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 285
    .line 286
    .line 287
    move-result-object v9

    .line 288
    iget-object v12, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 289
    .line 290
    invoke-virtual {v12}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 291
    .line 292
    .line 293
    move-result-object v12

    .line 294
    sget v13, Ll/k9c0;->n:I

    .line 295
    .line 296
    invoke-virtual {v12, v13}, Landroid/content/res/Resources;->getColor(I)I

    .line 297
    .line 298
    .line 299
    move-result v12

    .line 300
    filled-new-array {v12}, [I

    .line 301
    .line 302
    .line 303
    move-result-object v12

    .line 304
    invoke-virtual {v9, v12}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 305
    .line 306
    .line 307
    move-result-object v9

    .line 308
    invoke-virtual {v9, v8}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 309
    .line 310
    .line 311
    move-result-object v8

    .line 312
    invoke-virtual {v8, v10}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 313
    .line 314
    .line 315
    move-result-object v8

    .line 316
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 317
    .line 318
    .line 319
    move-result v7

    .line 320
    neg-int v7, v7

    .line 321
    invoke-virtual {v8, v7}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 322
    .line 323
    .line 324
    move-result-object v7

    .line 325
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 326
    .line 327
    .line 328
    move-result v6

    .line 329
    invoke-virtual {v7, v6}, Lcom/p1/mobile/android/ui/bubble/a;->u(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 330
    .line 331
    .line 332
    move-result-object v6

    .line 333
    invoke-virtual {v6, v4, v5}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    invoke-virtual {v4, v10}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 338
    .line 339
    .line 340
    move-result-object v4

    .line 341
    invoke-virtual {v4, v3}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 342
    .line 343
    .line 344
    move-result-object v3

    .line 345
    sget v4, Ll/zvk;->C:I

    .line 346
    .line 347
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 348
    .line 349
    .line 350
    move-result v2

    .line 351
    invoke-virtual {v3, v4, v2}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 356
    .line 357
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 358
    .line 359
    or-int/2addr v3, v4

    .line 360
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 361
    .line 362
    .line 363
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->e1:Landroid/widget/TextView;

    .line 368
    .line 369
    invoke-virtual {v2, v11, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    invoke-static {}, Ll/pzi0;->o()J

    .line 373
    .line 374
    .line 375
    move-result-wide v1

    .line 376
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i1:Ll/mah;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->i1:Ll/mah;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/mah;->d()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "respond_match"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 21
    .line 22
    :goto_0
    const-string v1, "notes_type"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "card_user_id"

    .line 29
    .line 30
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "e_interested_user_card"

    .line 41
    .line 42
    const-string v2, "p_interested_user"

    .line 43
    .line 44
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v0, -0x1

    .line 52
    const/4 v1, 0x2

    .line 53
    const-string v2, "FROM_MINE_INTEREST_LIST"

    .line 54
    .line 55
    invoke-static {p0, p1, v2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;II)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->f1:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->a:Lv/VScroll;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->e(Lv/VScroll;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->f1:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->b:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;->setMaxLength(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->f1:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/SmartScrollBar;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bjh;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final r()V
    .locals 5

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42c00000    # 96.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    div-int/lit8 v0, v0, 0x4

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->o:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->p:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->q:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->r:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->o:Lv/VDraweeView;

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    new-array v3, v2, [Landroid/view/View;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    aput-object v1, v3, v4

    .line 41
    .line 42
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->p:Lv/VDraweeView;

    .line 46
    .line 47
    new-array v3, v2, [Landroid/view/View;

    .line 48
    .line 49
    aput-object v1, v3, v4

    .line 50
    .line 51
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->q:Lv/VDraweeView;

    .line 55
    .line 56
    new-array v3, v2, [Landroid/view/View;

    .line 57
    .line 58
    aput-object v1, v3, v4

    .line 59
    .line 60
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->r:Lv/VDraweeView;

    .line 64
    .line 65
    new-array v1, v2, [Landroid/view/View;

    .line 66
    .line 67
    aput-object p0, v1, v4

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public s(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->j1:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final t(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hideActiveTime(Lcom/p1/mobile/putong/data/User;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->B4:I

    .line 31
    .line 32
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->v(Lcom/p1/mobile/putong/data/User;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    long-to-double v3, v3

    .line 37
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->J:I

    .line 70
    .line 71
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    move-object v0, v1

    .line 84
    goto :goto_0

    .line 85
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->B4:I

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 94
    .line 95
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 96
    .line 97
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    :cond_3
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hideLocation(Lcom/p1/mobile/putong/data/User;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_4

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_4
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 137
    .line 138
    if-eqz v1, :cond_5

    .line 139
    .line 140
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 141
    .line 142
    const/4 v1, 0x1

    .line 143
    invoke-static {p1, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    :goto_1
    move-object v1, p1

    .line 148
    goto :goto_2

    .line 149
    :cond_5
    invoke-static {p1}, Ll/q8g0;->R(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    goto :goto_1

    .line 154
    :goto_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_6

    .line 159
    .line 160
    return-object v0

    .line 161
    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-eqz p1, :cond_7

    .line 166
    .line 167
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    return-object p0

    .line 172
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 173
    .line 174
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->E4:I

    .line 175
    .line 176
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    return-object p0
.end method

.method public final w(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->u(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    return-object p0
.end method

.method public x(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u5979"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "\u4ed6"

    .line 11
    .line 12
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, -0x1

    .line 13
    sparse-switch v0, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :sswitch_0
    const-string v0, "UNKNOWN"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x4

    .line 27
    goto :goto_0

    .line 28
    :sswitch_1
    const-string v0, "AB"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x3

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v0, "O"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, 0x2

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v0, "B"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v1, 0x1

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string v0, "A"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v1, 0x0

    .line 71
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 72
    .line 73
    .line 74
    const-string p0, ""

    .line 75
    .line 76
    return-object p0

    .line 77
    :pswitch_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->x:I

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :pswitch_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->u:I

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :pswitch_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->w:I

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0

    .line 116
    :pswitch_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->v:I

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    return-object p0

    .line 129
    :pswitch_4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->t:I

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    nop

    .line 143
    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_4
        0x42 -> :sswitch_3
        0x4f -> :sswitch_2
        0x821 -> :sswitch_1
        0x19d1382a -> :sswitch_0
    .end sparse-switch

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic z(Ll/mah;Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->g1:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string p2, "momentPick"

    .line 12
    .line 13
    invoke-static {p2}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    const/4 v6, 0x1

    .line 18
    const-string v7, "featured"

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v5, 0x0

    .line 22
    invoke-interface/range {v0 .. v7}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Rs(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;ZLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/mah;->b()Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "user_id"

    .line 32
    .line 33
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    filled-new-array {p2}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const-string v0, "e_respond_match"

    .line 42
    .line 43
    const-string v1, "p_interested_user"

    .line 44
    .line 45
    invoke-static {v0, v1, p2}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;->h1:Ll/lrl;

    .line 49
    .line 50
    const/4 p2, 0x1

    .line 51
    invoke-interface {p0, p1, p2}, Ll/lrl;->q0(Ll/mah;Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
