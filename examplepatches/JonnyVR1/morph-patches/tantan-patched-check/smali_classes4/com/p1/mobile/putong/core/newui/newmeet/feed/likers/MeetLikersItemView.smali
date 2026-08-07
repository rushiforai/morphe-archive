.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

.field public d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

.field public e:Lv/VPullUpRecyclerView;

.field public f:Lv/VText;

.field public g:Z

.field public h:Ll/udy;

.field public i:Ll/dzl;

.field public j:Z

.field public k:I

.field public l:I

.field public m:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/joa;->f4()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    invoke-static {}, Ll/joa;->f4()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    invoke-static {}, Ll/joa;->f4()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->o(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->q()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->p(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->r()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->n(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)Ll/udy;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    return p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)Ll/dzl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->i:Ll/dzl;

    return-object p0
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ecy;->a(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j()Lcom/p1/mobile/android/app/Act;
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

.method public final k()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->q()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/s;->r4()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/acy;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/acy;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 40
    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/s;->M4()Lrx/subjects/b;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0, v1, v2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/bcy;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/bcy;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final m()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->e:Lv/VPullUpRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->D9()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/gbc0;->Y0:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->a:Lv/VImage;

    .line 34
    .line 35
    sget v1, Ll/gbc0;->a1:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 57
    .line 58
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 59
    .line 60
    sget v2, Ll/qa00;->h:I

    .line 61
    .line 62
    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 63
    .line 64
    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 70
    .line 71
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 75
    .line 76
    sget v1, Ll/gbc0;->v0:I

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 82
    .line 83
    const-string v1, "#F2B35F"

    .line 84
    .line 85
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    sget v1, Ll/gbc0;->X0:I

    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->a:Lv/VImage;

    .line 107
    .line 108
    sget v1, Ll/gbc0;->c1:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 111
    .line 112
    .line 113
    :cond_1
    :goto_0
    new-instance v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$a;

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    const/4 v2, 0x2

    .line 120
    invoke-direct {v0, p0, v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;Landroid/content/Context;I)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->e:Lv/VPullUpRecyclerView;

    .line 124
    .line 125
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Ll/udy;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-direct {v0, v1}, Ll/udy;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->e:Lv/VPullUpRecyclerView;

    .line 140
    .line 141
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->e:Lv/VPullUpRecyclerView;

    .line 145
    .line 146
    new-instance v1, Ll/qdk;

    .line 147
    .line 148
    sget v3, Ll/qa00;->h:I

    .line 149
    .line 150
    invoke-direct {v1, v3, v2}, Ll/qdk;-><init>(II)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 154
    .line 155
    .line 156
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 157
    .line 158
    new-instance v1, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/a;

    .line 159
    .line 160
    new-instance v2, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;

    .line 161
    .line 162
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V

    .line 163
    .line 164
    .line 165
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/a;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/a$a;)V

    .line 166
    .line 167
    .line 168
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->e:Lv/VPullUpRecyclerView;

    .line 172
    .line 173
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 177
    .line 178
    const-string v1, "\u67e5\u770b\u66f4\u591a"

    .line 179
    .line 180
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 184
    .line 185
    new-instance v1, Ll/zby;

    .line 186
    .line 187
    invoke-direct {v1, p0}, Ll/zby;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V

    .line 188
    .line 189
    .line 190
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->l()V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public final synthetic n(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/udy;->I(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->k:I

    .line 7
    .line 8
    add-int/lit8 p1, p1, -0x1

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->k:I

    .line 11
    .line 12
    if-lez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->v()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->t()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->m:Ll/x20;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->m:Ll/x20;

    .line 30
    .line 31
    invoke-interface {p1}, Ll/x20;->call()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic o(Ll/uxj0;)V
    .locals 6

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 10
    .line 11
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 27
    .line 28
    iget-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ljava/lang/Long;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2

    .line 40
    const/4 v4, 0x0

    .line 41
    const-string v5, ""

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Z6(Lcom/p1/mobile/putong/data/Links;JILjava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->m()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_meet_see_total"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->w()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->M4()Lrx/subjects/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "e_meet_see_total"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->w()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;Ll/dzl;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    .line 8
    .line 9
    iget v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;->likersTotalCount:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->k:I

    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;->newLikersCount:I

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->l:I

    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->i:Ll/dzl;

    .line 18
    .line 19
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->m:Ll/x20;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;->users:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->t()V

    .line 30
    .line 31
    .line 32
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-interface {p3}, Ll/x20;->call()V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void

    .line 42
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;->users:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {p3, p2, p1}, Ll/udy;->J(Ll/dzl;Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->v()V

    .line 50
    .line 51
    .line 52
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j:Z

    .line 53
    .line 54
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->x(Ljava/lang/Boolean;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public setMyTabStyle(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->a:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->f:Lv/VText;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;->e(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->u()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final u()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->kr()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->wg()Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

    .line 50
    .line 51
    new-instance v2, Ll/dcy;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Ll/dcy;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->m(Ll/pf60;Ll/x20;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;

    .line 60
    .line 61
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->k:I

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;->o(I)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 68
    .line 69
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->k()V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void
.end method

.method public final v()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j:Z

    .line 4
    .line 5
    new-instance v2, Ll/ccy;

    .line 6
    .line 7
    invoke-direct {v2, p0}, Ll/ccy;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;->f(ZLl/x20;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->c:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;

    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    .line 16
    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->l:I

    .line 18
    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->k:I

    .line 20
    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->h:Ll/udy;

    .line 22
    .line 23
    invoke-virtual {v4}, Ll/udy;->G()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetItemLikerHeadView;->d(ZIILcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->u()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final w()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->g:Z

    .line 2
    .line 3
    const-string v1, "p_meet_view,e_see_banner,click"

    .line 4
    .line 5
    const-string v2, "p_navigation_see,default"

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j:Z

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    move-object v1, v2

    .line 22
    :cond_0
    invoke-static {v3, v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j:Z

    .line 35
    .line 36
    if-eqz v3, :cond_2

    .line 37
    .line 38
    move-object v3, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_2
    move-object v3, v1

    .line 41
    :goto_0
    invoke-static {v0, v3}, Ll/yie0;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->j:Z

    .line 60
    .line 61
    if-eqz p0, :cond_3

    .line 62
    .line 63
    move-object v1, v2

    .line 64
    :cond_3
    invoke-interface {v0, v3, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    return-void
.end method

.method public final x(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c7()Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers;->l0:Ll/byd0;

    .line 20
    .line 21
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c7()Lrx/c;

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->o5()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
