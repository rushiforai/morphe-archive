.class public Ll/tt60;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
.source "SourceFile"


# instance fields
.field public E:Ll/v0q;

.field public F:I

.field public G:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ll/v0q;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V
    .locals 7

    .line 1
    move-object v0, p0

    .line 2
    move-object v1, p1

    .line 3
    move-object v2, p3

    .line 4
    move-object v3, p4

    .line 5
    move-object v4, p5

    .line 6
    move v5, p6

    .line 7
    move v6, p7

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 9
    .line 10
    .line 11
    iput-object p2, v0, Ll/tt60;->E:Ll/v0q;

    .line 12
    .line 13
    iput-object v4, v0, Ll/tt60;->G:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public A0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public B0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public C0(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tt60;->F:I

    .line 2
    .line 3
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->g:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    const/4 v2, -0x1

    .line 29
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/tt60;->E:Ll/v0q;

    .line 33
    .line 34
    invoke-interface {v2}, Ll/v0q;->w1()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/high16 v3, 0x42e80000    # 116.0f

    .line 39
    .line 40
    const/high16 v4, 0x43160000    # 150.0f

    .line 41
    .line 42
    const/high16 v5, 0x43520000    # 210.0f

    .line 43
    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->j4:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 54
    .line 55
    sget v0, Ll/lbc0;->s:I

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 67
    .line 68
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 79
    .line 80
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 85
    .line 86
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 93
    .line 94
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->r:Z

    .line 99
    .line 100
    if-eqz v2, :cond_2

    .line 101
    .line 102
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 103
    .line 104
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->g3:I

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 110
    .line 111
    sget v0, Ll/lbc0;->X2:I

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 117
    .line 118
    const/high16 p1, 0x42200000    # 40.0f

    .line 119
    .line 120
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_2
    if-eqz v0, :cond_3

    .line 129
    .line 130
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_3
    iget p0, p0, Ll/tt60;->F:I

    .line 135
    .line 136
    if-nez p0, :cond_5

    .line 137
    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->b4:I

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_4
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->i4:I

    .line 144
    .line 145
    :cond_5
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 146
    .line 147
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 151
    .line 152
    sget v0, Ll/lbc0;->q:I

    .line 153
    .line 154
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 164
    .line 165
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_6

    .line 170
    .line 171
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 176
    .line 177
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 182
    .line 183
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 188
    .line 189
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 190
    .line 191
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 192
    .line 193
    .line 194
    :cond_6
    return-void
.end method
