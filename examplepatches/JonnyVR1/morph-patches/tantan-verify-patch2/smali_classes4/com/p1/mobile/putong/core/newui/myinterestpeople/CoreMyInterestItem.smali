.class public Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/c39;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/c39<",
        "Ll/f59;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public A:Landroid/widget/LinearLayout;

.field public B:Lv/VText;

.field public C:Lv/VText;

.field public D:Landroid/widget/LinearLayout;

.field public E:Lv/VText;

.field public E0:Lv/VText;

.field public F:Lv/VText;

.field public F0:Lv/VText;

.field public G:Landroid/widget/LinearLayout;

.field public G0:Landroid/widget/LinearLayout;

.field public H:Lv/VText;

.field public H0:Lv/VText;

.field public I:Lv/VText;

.field public I0:Lv/VText;

.field public J:Landroid/widget/LinearLayout;

.field public J0:Landroid/widget/LinearLayout;

.field public K:Lv/VText;

.field public K0:Lv/VText;

.field public L:Lv/VText;

.field public L0:Lv/VText;

.field public M:Landroid/widget/LinearLayout;

.field public M0:Landroid/widget/LinearLayout;

.field public N:Lv/VText;

.field public N0:Lv/VText;

.field public O:Lv/VText;

.field public O0:Lv/VText;

.field public P:Landroid/widget/LinearLayout;

.field public P0:Lv/VText;

.field public Q:Lv/VText;

.field public Q0:Landroid/widget/LinearLayout;

.field public R:Lv/VText;

.field public R0:Lv/VText;

.field public S:Landroid/widget/LinearLayout;

.field public S0:Lv/VText;

.field public T:Lv/VText;

.field public T0:Landroid/widget/LinearLayout;

.field public U:Lv/VText;

.field public U0:Lv/VText;

.field public V:Landroid/widget/LinearLayout;

.field public V0:Lv/VText;

.field public W:Lv/VText;

.field public W0:Landroid/widget/LinearLayout;

.field public X0:Lv/VText;

.field public Y0:Lv/VText;

.field public Z0:Landroid/widget/LinearLayout;

.field public a:Landroid/widget/FrameLayout;

.field public a1:Lv/VText;

.field public b:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardScrollView;

.field public b1:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public c1:Landroid/widget/TextView;

.field public d:Lv/VDraweeView;

.field public d1:Lv/VText_Tags;

.field public e:Landroid/widget/RelativeLayout;

.field public e1:Landroid/widget/TextView;

.field public f:Landroid/widget/ImageView;

.field public f1:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;

.field public g1:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;

.field public h:Landroid/widget/LinearLayout;

.field public h1:Ll/r2a;

.field public i:Lv/VText;

.field public i1:Ll/f59;

.field public j:Lv/VText;

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

.field public k0:Lv/VText;

.field public l:Landroid/widget/ImageView;

.field public m:Lv/VText;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lv/VDraweeView;

.field public p0:Landroid/widget/LinearLayout;

.field public q:Lv/VDraweeView;

.field public r:Lv/VDraweeView;

.field public s:Lv/VDraweeView;

.field public t:Lv/VText;

.field public u:Landroid/widget/LinearLayout;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Landroid/widget/LinearLayout;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j1:Ljava/util/HashMap;

    .line 10
    .line 11
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

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j1:Ljava/util/HashMap;

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

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j1:Ljava/util/HashMap;

    return-void
.end method

.method public static I(Ljava/util/List;Ljava/util/List;IZI)Landroid/text/SpannableStringBuilder;
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
    new-instance v10, Ll/df00;

    .line 86
    .line 87
    sget-object v11, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

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
    invoke-direct/range {v10 .. v20}, Ll/df00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFZI)V

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
    new-instance v21, Ll/df00;

    .line 156
    .line 157
    sget-object v22, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

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
    invoke-direct/range {v21 .. v33}, Ll/df00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIFZI)V

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

.method public static Y()Z
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

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->E(Ll/f59;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->A(Ll/f59;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->H(Ll/f59;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->C(Ll/f59;Landroid/view/View;)V

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

.method public static synthetic m(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/text/SpannableStringBuilder;
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
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->I(Ljava/util/List;Ljava/util/List;IZI)Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->F(Ll/f59;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->D(Ll/f59;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->G(Ll/f59;Landroid/view/View;)V

    return-void
.end method

.method public static v(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
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

.method public static w(Lcom/p1/mobile/putong/data/User;)J
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
.method public final synthetic A(Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p0, p1, p2}, Ll/r2a;->e(Ll/f59;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic C(Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/r2a;->O(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic D(Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p0, p1, p2}, Ll/r2a;->e(Ll/f59;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic E(Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/r2a;->O(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F(Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    invoke-interface {p0, p1, p2}, Ll/r2a;->e(Ll/f59;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic G(Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    invoke-interface {p0, p1, p2}, Ll/r2a;->e(Ll/f59;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic H(Ll/f59;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/r2a;->r0(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J(Ll/f59;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i1:Ll/f59;

    .line 2
    .line 3
    invoke-super {p0, p1}, Ll/c39;->a(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K()V
    .locals 12

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "SHARE_TIP_MYINTEREST"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const-wide/16 v3, 0xbb8

    .line 13
    .line 14
    const/high16 v5, 0x41500000    # 13.0f

    .line 15
    .line 16
    const/high16 v6, 0x41100000    # 9.0f

    .line 17
    .line 18
    const/4 v7, 0x1

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i1:Ll/f59;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/f59;->d()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->tf()Ll/byd0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/Long;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 44
    .line 45
    .line 46
    move-result-wide v8

    .line 47
    invoke-static {}, Ll/pzi0;->o()J

    .line 48
    .line 49
    .line 50
    move-result-wide v10

    .line 51
    invoke-static {v8, v9, v10, v11}, Ll/pzi0;->C(JJ)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    goto/16 :goto_0

    .line 78
    .line 79
    :cond_1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-direct {v0, v8}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 86
    .line 87
    .line 88
    const-string v8, "\u70b9\u51fb\u793c\u8c8c\u56de\u8c22\uff0c\u8868\u8fbe\u4f60\u7684\u611f\u8c22"

    .line 89
    .line 90
    invoke-virtual {v0, v8}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 91
    .line 92
    .line 93
    move-result-object v8

    .line 94
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    invoke-virtual {v8, v6}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    invoke-virtual {v8}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    sget v9, Ll/c9c0;->I:I

    .line 111
    .line 112
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    filled-new-array {v8}, [I

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    invoke-virtual {v6, v8}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    invoke-virtual {v6, v5}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5, v7}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    const/high16 v6, 0x40a00000    # 5.0f

    .line 133
    .line 134
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v6

    .line 138
    neg-int v6, v6

    .line 139
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    const/4 v6, 0x0

    .line 144
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result v6

    .line 148
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/ui/bubble/a;->u(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-virtual {v5, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v3, v7}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-virtual {v3, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    sget v3, Ll/zvk;->C:I

    .line 165
    .line 166
    const/high16 v4, 0x42600000    # 56.0f

    .line 167
    .line 168
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 169
    .line 170
    .line 171
    move-result v4

    .line 172
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 177
    .line 178
    sget v4, Ll/zvk;->C:I

    .line 179
    .line 180
    or-int/2addr v3, v4

    .line 181
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 182
    .line 183
    .line 184
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 189
    .line 190
    invoke-virtual {v2, v0, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->tf()Ll/byd0;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {}, Ll/pzi0;->o()J

    .line 202
    .line 203
    .line 204
    move-result-wide v0

    .line 205
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_2
    new-instance v0, Ll/byd0;

    .line 214
    .line 215
    new-instance v8, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    const-string v9, "show_guide_time_interest_people"

    .line 218
    .line 219
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 223
    .line 224
    .line 225
    move-result-object v9

    .line 226
    invoke-interface {v9}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v9

    .line 230
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v8

    .line 237
    const-wide/16 v9, 0x0

    .line 238
    .line 239
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 240
    .line 241
    .line 242
    move-result-object v9

    .line 243
    invoke-direct {v0, v8, v9}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v8

    .line 250
    check-cast v8, Ljava/lang/Long;

    .line 251
    .line 252
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 253
    .line 254
    .line 255
    move-result-wide v8

    .line 256
    invoke-static {}, Ll/pzi0;->o()J

    .line 257
    .line 258
    .line 259
    move-result-wide v10

    .line 260
    invoke-static {v8, v9, v10, v11}, Ll/pzi0;->C(JJ)Z

    .line 261
    .line 262
    .line 263
    move-result v8

    .line 264
    if-eqz v8, :cond_4

    .line 265
    .line 266
    :cond_3
    :goto_0
    return-void

    .line 267
    :cond_4
    new-instance v8, Lcom/p1/mobile/android/ui/bubble/a;

    .line 268
    .line 269
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    invoke-direct {v8, v9}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 274
    .line 275
    .line 276
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i1:Ll/f59;

    .line 277
    .line 278
    invoke-virtual {v9}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 279
    .line 280
    .line 281
    move-result-object v9

    .line 282
    invoke-virtual {p0, v9}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v9

    .line 286
    new-instance v10, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    const-string v11, "\u4ed6\u4eec\u90fd\u5bf9\u4f60\u5f88\u611f\u5174\u8da3\uff0c\u5bf9"

    .line 289
    .line 290
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    const-string v11, "\u611f\u5174\u8da3\u5c31\u5173\u6ce8"

    .line 297
    .line 298
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    const-string v9, "\u5427"

    .line 305
    .line 306
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v9

    .line 313
    invoke-virtual {v8, v9}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 314
    .line 315
    .line 316
    move-result-object v9

    .line 317
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 318
    .line 319
    .line 320
    move-result v6

    .line 321
    invoke-virtual {v9, v6}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 322
    .line 323
    .line 324
    move-result-object v6

    .line 325
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 326
    .line 327
    .line 328
    move-result-object v9

    .line 329
    invoke-virtual {v9}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 330
    .line 331
    .line 332
    move-result-object v9

    .line 333
    sget v10, Ll/c9c0;->I:I

    .line 334
    .line 335
    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    .line 336
    .line 337
    .line 338
    move-result v9

    .line 339
    filled-new-array {v9}, [I

    .line 340
    .line 341
    .line 342
    move-result-object v9

    .line 343
    invoke-virtual {v6, v9}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 344
    .line 345
    .line 346
    move-result-object v6

    .line 347
    invoke-virtual {v6, v5}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 348
    .line 349
    .line 350
    move-result-object v5

    .line 351
    invoke-virtual {v5, v7}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 352
    .line 353
    .line 354
    move-result-object v5

    .line 355
    const/high16 v6, 0x41400000    # 12.0f

    .line 356
    .line 357
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 358
    .line 359
    .line 360
    move-result v6

    .line 361
    neg-int v6, v6

    .line 362
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 363
    .line 364
    .line 365
    move-result-object v5

    .line 366
    const/high16 v6, 0x42200000    # 40.0f

    .line 367
    .line 368
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 369
    .line 370
    .line 371
    move-result v6

    .line 372
    invoke-virtual {v5, v6}, Lcom/p1/mobile/android/ui/bubble/a;->u(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 373
    .line 374
    .line 375
    move-result-object v5

    .line 376
    invoke-virtual {v5, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 377
    .line 378
    .line 379
    move-result-object v3

    .line 380
    invoke-virtual {v3, v7}, Lcom/p1/mobile/android/ui/bubble/a;->M(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 381
    .line 382
    .line 383
    move-result-object v3

    .line 384
    invoke-virtual {v3, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    sget v3, Ll/zvk;->C:I

    .line 389
    .line 390
    const/high16 v4, 0x41200000    # 10.0f

    .line 391
    .line 392
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 393
    .line 394
    .line 395
    move-result v4

    .line 396
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 397
    .line 398
    .line 399
    move-result-object v2

    .line 400
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 401
    .line 402
    sget v4, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 403
    .line 404
    or-int/2addr v3, v4

    .line 405
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 406
    .line 407
    .line 408
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 409
    .line 410
    .line 411
    move-result-object v2

    .line 412
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 413
    .line 414
    invoke-virtual {v2, v8, p0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    invoke-static {}, Ll/pzi0;->o()J

    .line 418
    .line 419
    .line 420
    move-result-wide v1

    .line 421
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 422
    .line 423
    .line 424
    move-result-object p0

    .line 425
    invoke-virtual {v0, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    sget v0, Ll/dbc0;->p8:I

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    sget-object v0, Ll/h1e0;->g:Ll/h1e0;

    .line 75
    .line 76
    invoke-direct {p2, p0, v0}, Ll/x0e0;-><init>(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p2}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    return-void
.end method

.method public M(Ll/f59;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/f59;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 8
    .line 9
    const-string v1, "\u76f4\u63a5\u914d\u5bf9"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x7

    .line 15
    invoke-virtual {p1, v0}, Ll/f59;->g(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 19
    .line 20
    new-instance v1, Ll/g2a;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Ll/g2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p1}, Ll/f59;->d()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_5

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->so()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Hj()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v0}, Ll/epc0;->c(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 68
    .line 69
    const-string v1, "\u804a\u5929"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    const/4 v0, 0x3

    .line 75
    invoke-virtual {p1, v0}, Ll/f59;->g(I)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 79
    .line 80
    new-instance v1, Ll/h2a;

    .line 81
    .line 82
    invoke-direct {v1, p0, p1}, Ll/h2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 96
    .line 97
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->vj(Z)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-eqz v0, :cond_2

    .line 110
    .line 111
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_2

    .line 122
    .line 123
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 130
    .line 131
    iget v0, v0, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    .line 132
    .line 133
    if-lez v0, :cond_2

    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 136
    .line 137
    const-string v1, "\u9001\u5c0f\u7ea2\u82b1"

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    const/4 v0, 0x6

    .line 143
    invoke-virtual {p1, v0}, Ll/f59;->g(I)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 147
    .line 148
    new-instance v1, Ll/i2a;

    .line 149
    .line 150
    invoke-direct {v1, p0, p1}, Ll/i2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 158
    .line 159
    const-string v1, "\u6253\u62db\u547c"

    .line 160
    .line 161
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    .line 163
    .line 164
    const/4 v0, 0x4

    .line 165
    invoke-virtual {p1, v0}, Ll/f59;->g(I)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 169
    .line 170
    new-instance v1, Ll/j2a;

    .line 171
    .line 172
    invoke-direct {v1, p0, p1}, Ll/j2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 180
    .line 181
    const-string v1, "\u793c\u8c8c\u56de\u8c22"

    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    const/4 v0, 0x5

    .line 187
    invoke-virtual {p1, v0}, Ll/f59;->g(I)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 191
    .line 192
    new-instance v1, Ll/k2a;

    .line 193
    .line 194
    invoke-direct {v1, p0, p1}, Ll/k2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V

    .line 195
    .line 196
    .line 197
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 202
    .line 203
    const-string v1, "\u5173\u6ce8"

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    const/4 v0, 0x1

    .line 209
    invoke-virtual {p1, v0}, Ll/f59;->g(I)V

    .line 210
    .line 211
    .line 212
    goto :goto_0

    .line 213
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 214
    .line 215
    const-string v1, "\u56de\u5173"

    .line 216
    .line 217
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    const/4 v0, 0x2

    .line 221
    invoke-virtual {p1, v0}, Ll/f59;->g(I)V

    .line 222
    .line 223
    .line 224
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f1:Landroid/widget/TextView;

    .line 225
    .line 226
    new-instance v1, Ll/l2a;

    .line 227
    .line 228
    invoke-direct {v1, p0, p1}, Ll/l2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/data/User;)V
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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->d1:Lv/VText_Tags;

    .line 17
    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->c1:Landroid/widget/TextView;

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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

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
    new-instance v2, Ll/n2a;

    .line 73
    .line 74
    invoke-direct {v2, p1}, Ll/n2a;-><init>(Ljava/util/HashSet;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->d1:Lv/VText_Tags;

    .line 83
    .line 84
    new-instance v1, Ll/o2a;

    .line 85
    .line 86
    invoke-direct {v1, v0, p1}, Ll/o2a;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v1}, Lv/VText_Tags;->setTags(Ll/rcj;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i:Lv/VText;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i:Lv/VText;

    .line 12
    .line 13
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j:Lv/VText;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j:Lv/VText;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->m:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->V(Lcom/p1/mobile/putong/data/User;Lv/VText;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->l:Landroid/widget/ImageView;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->k:Landroid/widget/ImageView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j:Lv/VText;

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

.method public P(Ll/f59;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/f59;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->e1:Landroid/widget/TextView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->e1:Landroid/widget/TextView;

    .line 21
    .line 22
    new-instance v1, Ll/p2a;

    .line 23
    .line 24
    invoke-direct {v1, p0, p1}, Ll/p2a;-><init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/User;)V
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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L:Lv/VText;

    .line 13
    .line 14
    sget v4, Lcom/p1/mobile/putong/core/R$string;->tl:I

    .line 15
    .line 16
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->O:Lv/VText;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->O:Lv/VText;

    .line 29
    .line 30
    sget v4, Lcom/p1/mobile/putong/core/R$string;->ml:I

    .line 31
    .line 32
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setHint(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->R:Lv/VText;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->R:Lv/VText;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L:Lv/VText;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L:Lv/VText;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L:Lv/VText;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L:Lv/VText;

    .line 179
    .line 180
    const-string v4, "\u6dfb\u52a0\u804c\u4e1a\u4fe1\u606f"

    .line 181
    .line 182
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 183
    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->R:Lv/VText;

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
    new-instance v1, Ljava/lang/StringBuilder;

    .line 195
    .line 196
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 197
    .line 198
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 199
    .line 200
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 204
    .line 205
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    if-eqz v4, :cond_6

    .line 210
    .line 211
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 212
    .line 213
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->hideSchoolName()Z

    .line 214
    .line 215
    .line 216
    move-result v4

    .line 217
    if-eqz v4, :cond_6

    .line 218
    .line 219
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    if-eqz v4, :cond_6

    .line 224
    .line 225
    const-string v4, "("

    .line 226
    .line 227
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    sget v5, Lcom/p1/mobile/putong/core/R$string;->C0:I

    .line 235
    .line 236
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v4

    .line 240
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v4, ")"

    .line 244
    .line 245
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->U:Lv/VText;

    .line 249
    .line 250
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v1

    .line 254
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 255
    .line 256
    .line 257
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->U:Lv/VText;

    .line 258
    .line 259
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Z(Lv/VText;)V

    .line 260
    .line 261
    .line 262
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->F:Lv/VText;

    .line 263
    .line 264
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->X(Landroid/view/View;I)V

    .line 265
    .line 266
    .line 267
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->I:Lv/VText;

    .line 268
    .line 269
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->X(Landroid/view/View;I)V

    .line 270
    .line 271
    .line 272
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Y()Z

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    const/4 v4, 0x1

    .line 277
    const-string v5, "unknown_"

    .line 278
    .line 279
    if-eqz v1, :cond_8

    .line 280
    .line 281
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 282
    .line 283
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 284
    .line 285
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 286
    .line 287
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-nez v1, :cond_7

    .line 292
    .line 293
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 294
    .line 295
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 296
    .line 297
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 298
    .line 299
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    check-cast v1, Lcom/p1/mobile/putong/data/BloodType;

    .line 304
    .line 305
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-nez v1, :cond_7

    .line 310
    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->C:Lv/VText;

    .line 312
    .line 313
    invoke-static {v1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 314
    .line 315
    .line 316
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->C:Lv/VText;

    .line 317
    .line 318
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 319
    .line 320
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 321
    .line 322
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 323
    .line 324
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v6

    .line 328
    check-cast v6, Lcom/p1/mobile/putong/data/BloodType;

    .line 329
    .line 330
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->z(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v6

    .line 334
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    .line 336
    .line 337
    goto :goto_2

    .line 338
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->C:Lv/VText;

    .line 339
    .line 340
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 341
    .line 342
    .line 343
    goto :goto_2

    .line 344
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->C:Lv/VText;

    .line 345
    .line 346
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 347
    .line 348
    .line 349
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->F0:Lv/VText;

    .line 350
    .line 351
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->x(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v6

    .line 355
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 356
    .line 357
    .line 358
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L0:Lv/VText;

    .line 359
    .line 360
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 361
    .line 362
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 363
    .line 364
    .line 365
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L:Lv/VText;

    .line 366
    .line 367
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Z(Lv/VText;)V

    .line 368
    .line 369
    .line 370
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->O:Lv/VText;

    .line 371
    .line 372
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Z(Lv/VText;)V

    .line 373
    .line 374
    .line 375
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->R:Lv/VText;

    .line 376
    .line 377
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Z(Lv/VText;)V

    .line 378
    .line 379
    .line 380
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->F0:Lv/VText;

    .line 381
    .line 382
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Z(Lv/VText;)V

    .line 383
    .line 384
    .line 385
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L0:Lv/VText;

    .line 386
    .line 387
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Z(Lv/VText;)V

    .line 388
    .line 389
    .line 390
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->O:Lv/VText;

    .line 391
    .line 392
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->X(Landroid/view/View;I)V

    .line 393
    .line 394
    .line 395
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 396
    .line 397
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 402
    .line 403
    .line 404
    move-result v6

    .line 405
    if-nez v6, :cond_a

    .line 406
    .line 407
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Y()Z

    .line 408
    .line 409
    .line 410
    move-result v6

    .line 411
    if-eqz v6, :cond_9

    .line 412
    .line 413
    goto :goto_3

    .line 414
    :cond_9
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->z:Lv/VText;

    .line 415
    .line 416
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 417
    .line 418
    .line 419
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->x:Landroid/widget/LinearLayout;

    .line 420
    .line 421
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 422
    .line 423
    .line 424
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t:Lv/VText;

    .line 425
    .line 426
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 427
    .line 428
    .line 429
    goto :goto_4

    .line 430
    :cond_a
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->x:Landroid/widget/LinearLayout;

    .line 431
    .line 432
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 433
    .line 434
    .line 435
    :goto_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 436
    .line 437
    .line 438
    move-result-object v1

    .line 439
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 440
    .line 441
    invoke-interface {v1, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 442
    .line 443
    .line 444
    move-result-object p1

    .line 445
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 446
    .line 447
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->M0:Landroid/widget/LinearLayout;

    .line 452
    .line 453
    if-eqz v1, :cond_b

    .line 454
    .line 455
    invoke-virtual {p0, v6, v2}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->X(Landroid/view/View;I)V

    .line 456
    .line 457
    .line 458
    goto :goto_5

    .line 459
    :cond_b
    invoke-virtual {p0, v6, v3}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->X(Landroid/view/View;I)V

    .line 460
    .line 461
    .line 462
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->O0:Lv/VText;

    .line 463
    .line 464
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 465
    .line 466
    .line 467
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t:Lv/VText;

    .line 468
    .line 469
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 470
    .line 471
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 472
    .line 473
    .line 474
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->K:Lv/VText;

    .line 475
    .line 476
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 477
    .line 478
    .line 479
    move-result-object v1

    .line 480
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 481
    .line 482
    .line 483
    move-result-object v1

    .line 484
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ol:I

    .line 485
    .line 486
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v1

    .line 490
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 491
    .line 492
    .line 493
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Y()Z

    .line 494
    .line 495
    .line 496
    move-result p1

    .line 497
    if-eqz p1, :cond_c

    .line 498
    .line 499
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 500
    .line 501
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 502
    .line 503
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 504
    .line 505
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 506
    .line 507
    .line 508
    move-result p1

    .line 509
    if-nez p1, :cond_c

    .line 510
    .line 511
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 512
    .line 513
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 514
    .line 515
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Physical;->bloodType:Ljava/util/List;

    .line 516
    .line 517
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 518
    .line 519
    .line 520
    move-result-object p1

    .line 521
    check-cast p1, Lcom/p1/mobile/putong/data/BloodType;

    .line 522
    .line 523
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 524
    .line 525
    .line 526
    move-result p1

    .line 527
    if-nez p1, :cond_c

    .line 528
    .line 529
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->A:Landroid/widget/LinearLayout;

    .line 530
    .line 531
    invoke-static {p0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 532
    .line 533
    .line 534
    :cond_c
    return-void
.end method

.method public R(Ll/f59;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->m:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->V(Lcom/p1/mobile/putong/data/User;Lv/VText;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->O(Lcom/p1/mobile/putong/data/User;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->d:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->d:Lv/VDraweeView;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->d:Lv/VDraweeView;

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
    invoke-virtual {p1}, Ll/f59;->e()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_0

    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f:Landroid/widget/ImageView;

    .line 90
    .line 91
    sget v1, Ll/dbc0;->zf:I

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->g:Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

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
    invoke-virtual {p1}, Ll/f59;->d()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->f:Landroid/widget/ImageView;

    .line 125
    .line 126
    if-eqz v0, :cond_1

    .line 127
    .line 128
    sget v0, Ll/dbc0;->zf:I

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->g:Landroid/widget/TextView;

    .line 134
    .line 135
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

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
    sget v0, Ll/dbc0;->yf:I

    .line 158
    .line 159
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 160
    .line 161
    .line 162
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->g:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

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

.method public S(Ll/f59;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->C:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->A:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->F:Lv/VText;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->D:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->I:Lv/VText;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->G:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->J:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->O:Lv/VText;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->M:Landroid/widget/LinearLayout;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->R:Lv/VText;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->P:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->U:Lv/VText;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->S:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->F0:Lv/VText;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->p0:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L0:Lv/VText;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->J0:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->I0:Lv/VText;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->G0:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->k0:Lv/VText;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->V:Landroid/widget/LinearLayout;

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->P0:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->S0:Lv/VText;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Q0:Landroid/widget/LinearLayout;

    .line 86
    .line 87
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->V0:Lv/VText;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->T0:Landroid/widget/LinearLayout;

    .line 93
    .line 94
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Y0:Lv/VText;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->W0:Landroid/widget/LinearLayout;

    .line 100
    .line 101
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->b1:Lv/VText;

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Z0:Landroid/widget/LinearLayout;

    .line 107
    .line 108
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->t(Landroid/view/View;Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->Q(Lcom/p1/mobile/putong/data/User;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public T(Ll/f59;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->N(Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U(Ll/f59;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/f59;->b()Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->n:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->o:Landroid/widget/LinearLayout;

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
    check-cast v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 42
    .line 43
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

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
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

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
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

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
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

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
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->s:Lv/VDraweeView;

    .line 103
    .line 104
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_5
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r:Lv/VDraweeView;

    .line 109
    .line 110
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_6
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->q:Lv/VDraweeView;

    .line 115
    .line 116
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_7
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->p:Lv/VDraweeView;

    .line 121
    .line 122
    invoke-virtual {p0, v6, v7}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->L(Lcom/p1/mobile/putong/data/Media;Lv/VDraweeView;)V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->n:Landroid/widget/TextView;

    .line 135
    .line 136
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->o:Landroid/widget/LinearLayout;

    .line 140
    .line 141
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->s()V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/User;Lv/VText;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->u(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

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
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->X(Landroid/view/View;I)V

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

.method public final W(Landroid/view/View;F)V
    .locals 0

    .line 1
    new-instance p0, Ll/vl5;

    .line 2
    .line 3
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    int-to-float p2, p2

    .line 8
    invoke-direct {p0, p2}, Ll/vl5;-><init>(F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setClipToOutline(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public X(Landroid/view/View;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j1:Ljava/util/HashMap;

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

.method public Z(Lv/VText;)V
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
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->X(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f59;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->S(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f59;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->U(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic d(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f59;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->M(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic e(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f59;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->R(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic f(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f59;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->P(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic g(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f59;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->T(Ll/f59;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i1:Ll/f59;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/f59;->c()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->i1:Ll/f59;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/f59;->e()Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    const-string v8, "p_interested_user"

    .line 62
    .line 63
    const/4 v9, 0x0

    .line 64
    const-string v4, "FROM_MINE_INTEREST_LIST"

    .line 65
    .line 66
    const/4 v5, -0x1

    .line 67
    const-string v6, ""

    .line 68
    .line 69
    const/4 v7, 0x2

    .line 70
    invoke-interface/range {v1 .. v9}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->bb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->g1:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->b:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardScrollView;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->b(Lv/VScroll;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->a:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    const/high16 v1, 0x41800000    # 16.0f

    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->W(Landroid/view/View;F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->c:Landroid/widget/LinearLayout;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/dbc0;->Rp:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/q2a;->a(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final s()V
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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->p:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->q:Lv/VDraweeView;

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->s:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->p:Lv/VDraweeView;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->q:Lv/VDraweeView;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r:Lv/VDraweeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->s:Lv/VDraweeView;

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

.method public setClickCallBack(Ll/r2a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->h1:Ll/r2a;

    .line 2
    .line 3
    return-void
.end method

.method public t(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->j1:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
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
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Sk:I

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->w(Lcom/p1/mobile/putong/data/User;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    long-to-double v3, v3

    .line 39
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_3

    .line 56
    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget v3, Lcom/p1/mobile/putong/core/R$string;->m3:I

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    goto :goto_0

    .line 87
    :cond_1
    move-object v0, v1

    .line 88
    goto :goto_0

    .line 89
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Sk:I

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 100
    .line 101
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 102
    .line 103
    invoke-static {v3, v4}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v0, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    :cond_3
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hideLocation(Lcom/p1/mobile/putong/data/User;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_4

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_4
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 143
    .line 144
    if-eqz v1, :cond_5

    .line 145
    .line 146
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 147
    .line 148
    const/4 v1, 0x1

    .line 149
    invoke-static {p1, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    :goto_1
    move-object v1, p1

    .line 154
    goto :goto_2

    .line 155
    :cond_5
    invoke-static {p1}, Ll/q8g0;->R(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    goto :goto_1

    .line 160
    :goto_2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_6

    .line 165
    .line 166
    return-object v0

    .line 167
    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-eqz p1, :cond_7

    .line 172
    .line 173
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    return-object p0

    .line 178
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ql:I

    .line 183
    .line 184
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    return-object p0
.end method

.method public final x(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->v(Lcom/p1/mobile/putong/data/Profile;)Ljava/lang/String;

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

.method public y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
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

.method public z(Lcom/p1/mobile/putong/data/BloodType;)Ljava/lang/String;
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    sget p1, Lcom/p1/mobile/putong/core/R$string;->w0:I

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget p1, Lcom/p1/mobile/putong/core/R$string;->t0:I

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    return-object p0

    .line 107
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    sget p1, Lcom/p1/mobile/putong/core/R$string;->v0:I

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0

    .line 122
    :pswitch_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    sget p1, Lcom/p1/mobile/putong/core/R$string;->u0:I

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0

    .line 137
    :pswitch_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->r()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    sget p1, Lcom/p1/mobile/putong/core/R$string;->s0:I

    .line 146
    .line 147
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    return-object p0

    .line 152
    nop

    .line 153
    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_4
        0x42 -> :sswitch_3
        0x4f -> :sswitch_2
        0x821 -> :sswitch_1
        0x19d1382a -> :sswitch_0
    .end sparse-switch

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
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
