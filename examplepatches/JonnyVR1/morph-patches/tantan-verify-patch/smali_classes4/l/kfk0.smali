.class public Ll/kfk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y6k0;


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

.field public C:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

.field public D:Lcom/p1/mobile/android/app/Act;

.field public E:Lcom/p1/mobile/putong/data/User;

.field public F:I

.field public G:Ljava/lang/Runnable;

.field public a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

.field public b:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public c:Lv/VLinear;

.field public d:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

.field public e:Lv/VImage;

.field public f:Lv/VLinear;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

.field public j:Lv/VDraweeView;

.field public k:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

.field public l:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VImage;

.field public p:Lv/VImage;

.field public q:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

.field public r:Lv/VLinear;

.field public s:Lv/VLinear;

.field public t:Lv/VDraweeView;

.field public u:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public v:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public w:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public x:Lv/VLinear;

.field public y:Lv/VLinear;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/kfk0;->F:I

    .line 6
    .line 7
    new-instance v0, Ll/kfk0$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/kfk0$b;-><init>(Ll/kfk0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/kfk0;->G:Ljava/lang/Runnable;

    .line 13
    .line 14
    iput-object p1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B(Ll/kfk0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kfk0;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/kfk0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kfk0;->T(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic D(Ll/kfk0;Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kfk0;->O(Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/kfk0;Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kfk0;->P(Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/kfk0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kfk0;->U(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic G(Ll/kfk0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/kfk0;->F:I

    return p0
.end method

.method public static bridge synthetic H(Ll/kfk0;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kfk0;->X(F)V

    return-void
.end method

.method private K()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/kfk0;->d:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 2
    .line 3
    new-instance v1, Ll/afk0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/afk0;-><init>(Ll/kfk0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/kfk0;->L()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/kfk0;->x:Lv/VLinear;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/kfk0;->r:Lv/VLinear;

    .line 25
    .line 26
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/kfk0;->w:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 30
    .line 31
    new-instance v1, Ll/bfk0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/bfk0;-><init>(Ll/kfk0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/kfk0;->r:Lv/VLinear;

    .line 44
    .line 45
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ll/gra;->z()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iget-object v1, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    sget v0, Ll/dbc0;->kq:I

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->s0()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 67
    .line 68
    sget v1, Ll/dbc0;->kq:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/kfk0;->C:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->o()V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    sget v0, Ll/dbc0;->lq:I

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 82
    .line 83
    .line 84
    :goto_0
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 87
    .line 88
    const-string v1, "\u66f4\u591a"

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 104
    .line 105
    .line 106
    :cond_2
    :goto_1
    invoke-static {}, Ll/gra;->z()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v1, p0, Ll/kfk0;->b:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 111
    .line 112
    if-eqz v0, :cond_3

    .line 113
    .line 114
    sget v0, Ll/dbc0;->Kp:I

    .line 115
    .line 116
    invoke-virtual {v1, v0, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/kfk0;->i:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    .line 120
    .line 121
    iget-object v1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    sget v2, Ll/c9c0;->A:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->setRingColor(I)V

    .line 130
    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_3
    sget v0, Ll/dbc0;->Jp:I

    .line 134
    .line 135
    invoke-virtual {v1, v0, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/kfk0;->i:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    .line 139
    .line 140
    iget-object v1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 141
    .line 142
    sget v2, Ll/c9c0;->I:I

    .line 143
    .line 144
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->setRingColor(I)V

    .line 149
    .line 150
    .line 151
    :goto_2
    iget-object v0, p0, Ll/kfk0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 152
    .line 153
    new-instance v1, Ll/kfk0$a;

    .line 154
    .line 155
    invoke-direct {v1, p0}, Ll/kfk0$a;-><init>(Ll/kfk0;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->setTransCallback(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout$c;)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ll/gra;->p2()Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-eqz v0, :cond_4

    .line 166
    .line 167
    new-instance v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 168
    .line 169
    const v1, 0xffffff

    .line 170
    .line 171
    .line 172
    const v2, 0x66ffffff

    .line 173
    .line 174
    .line 175
    filled-new-array {v1, v2, v2, v1}, [I

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const/4 v2, 0x4

    .line 180
    new-array v2, v2, [F

    .line 181
    .line 182
    fill-array-data v2, :array_0

    .line 183
    .line 184
    .line 185
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;-><init>([I[F)V

    .line 186
    .line 187
    .line 188
    const/high16 v1, 0x41f00000    # 30.0f

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->n(F)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    const/high16 v2, 0x42340000    # 45.0f

    .line 195
    .line 196
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->p(I)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    const-wide/16 v2, 0x41a

    .line 205
    .line 206
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->l(J)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    const/high16 v2, 0x41a00000    # 20.0f

    .line 211
    .line 212
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 213
    .line 214
    .line 215
    move-result v2

    .line 216
    int-to-float v2, v2

    .line 217
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->m(F)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, Ll/kfk0;->k:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 221
    .line 222
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->setShimmerConfig(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)V

    .line 223
    .line 224
    .line 225
    :cond_4
    return-void

    .line 226
    nop

    :array_0
    .array-data 4
        0x0
        0x3edc28f6    # 0.43f
        0x3f11eb85    # 0.57f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic w(Ll/kfk0;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kfk0;->R(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/kfk0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kfk0;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/kfk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kfk0;->S()V

    return-void
.end method

.method public static synthetic z(Ll/kfk0;Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kfk0;->Q(Landroid/view/View$OnClickListener;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lfk0;->b(Ll/kfk0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public J()V
    .locals 3

    .line 1
    iget v0, p0, Ll/kfk0;->F:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    rem-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    iput v0, p0, Ll/kfk0;->F:I

    .line 8
    .line 9
    iget-object v2, p0, Ll/kfk0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 10
    .line 11
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->j(I)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/kfk0;->F:I

    .line 15
    .line 16
    iget-object v2, p0, Ll/kfk0;->d:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->O(Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->x()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final L()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/e7d0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic M(Landroid/view/View;)V
    .locals 4

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array v0, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_self_edit"

    .line 5
    .line 6
    const-string v2, "p_navigation_view"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 16
    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "profile_frag_me_avatar"

    .line 22
    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-static {v0, v1, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "preview_type"

    .line 29
    .line 30
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 9

    .line 1
    const-string p1, "e_my_moment"

    .line 2
    .line 3
    const-string v0, "p_navigation_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v7, "pageid"

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    const-string v3, "from_profile"

    .line 28
    .line 29
    const/4 v4, -0x1

    .line 30
    const-string v5, ""

    .line 31
    .line 32
    const/4 v6, 0x2

    .line 33
    invoke-interface/range {v0 .. v8}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->bb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic O(Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "state_id"

    .line 6
    .line 7
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    filled-new-array {p3}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    const-string v0, "e_my_state"

    .line 16
    .line 17
    const-string v1, "p_navigation_view"

    .line 18
    .line 19
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget-object p0, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p3, p0, p2, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic P(Ll/bkj0;Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p3, Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "state_id"

    .line 6
    .line 7
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    filled-new-array {p3}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    const-string v0, "e_my_state"

    .line 16
    .line 17
    const-string v1, "p_navigation_view"

    .line 18
    .line 19
    invoke-static {v0, v1, p3}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    iget-object p0, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p3, p0, p2, p1, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Dk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic Q(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/kfk0;->C:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic R(Landroid/view/View$OnClickListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1, p2}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/kfk0;->C:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic S()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->D6:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/kfk0;->k:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic T(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->E6:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/kfk0;->k:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_complete_card_info_close"

    .line 2
    .line 3
    const-string v0, "p_navigation_view"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    iget-object p2, p2, Ll/dkb;->w6:Ll/jxd0;

    .line 13
    .line 14
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/kfk0;->m(Lcom/p1/mobile/putong/data/User;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/data/User;)Z
    .locals 7

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object p0, p0, Ll/dkb;->w6:Ll/jxd0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    return v0

    .line 28
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object p0, p0, Ll/dkb;->x6:Ll/byd0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Long;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-static {}, Ll/gra;->i3()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    const-wide/16 v3, 0x1

    .line 49
    .line 50
    cmp-long v3, v1, v3

    .line 51
    .line 52
    if-lez v3, :cond_2

    .line 53
    .line 54
    if-lez p0, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ll/pzi0;->o()J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    sub-long/2addr v3, v1

    .line 61
    const-wide/32 v1, 0x5265c00

    .line 62
    .line 63
    .line 64
    int-to-long v5, p0

    .line 65
    mul-long/2addr v5, v1

    .line 66
    cmp-long p0, v3, v5

    .line 67
    .line 68
    if-lez p0, :cond_2

    .line 69
    .line 70
    return v0

    .line 71
    :cond_2
    invoke-static {}, Ll/gra;->X2()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 80
    .line 81
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    check-cast p0, Ljava/lang/String;

    .line 88
    .line 89
    const-string v1, "marryMode"

    .line 90
    .line 91
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_3

    .line 96
    .line 97
    return v0

    .line 98
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 99
    .line 100
    .line 101
    move-result-wide v1

    .line 102
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 103
    .line 104
    double-to-long v3, v3

    .line 105
    invoke-static {}, Ll/gra;->j3()I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    invoke-static {v1, v2, v3, v4, p0}, Ll/tzi0;->h(JJI)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-nez p0, :cond_5

    .line 114
    .line 115
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-nez p0, :cond_4

    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    const/4 p1, 0x3

    .line 130
    if-ge p0, p1, :cond_5

    .line 131
    .line 132
    :cond_4
    const/4 p0, 0x1

    .line 133
    return p0

    .line 134
    :cond_5
    return v0
.end method

.method public W(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kfk0;->c:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/kfk0;->d:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->O(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->x()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Ll/kfk0;->f:Lv/VLinear;

    .line 20
    .line 21
    xor-int/lit8 p1, p1, 0x1

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final X(F)V
    .locals 5

    .line 1
    const v0, 0x3f0f5c29    # 0.56f

    .line 2
    .line 3
    .line 4
    cmpg-float v1, p1, v0

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-gez v1, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sub-float v0, p1, v0

    .line 12
    .line 13
    const v1, 0x3ee147ae    # 0.44f

    .line 14
    .line 15
    .line 16
    div-float/2addr v0, v1

    .line 17
    :goto_0
    const v1, 0x3f4ccccd    # 0.8f

    .line 18
    .line 19
    .line 20
    cmpg-float v3, p1, v1

    .line 21
    .line 22
    if-gez v3, :cond_1

    .line 23
    .line 24
    move v1, v2

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    sub-float v1, p1, v1

    .line 27
    .line 28
    const v3, 0x3e4ccccc    # 0.19999999f

    .line 29
    .line 30
    .line 31
    div-float/2addr v1, v3

    .line 32
    :goto_1
    iget-object v3, p0, Ll/kfk0;->c:Lv/VLinear;

    .line 33
    .line 34
    const/high16 v4, 0x3f800000    # 1.0f

    .line 35
    .line 36
    invoke-static {v4, v0}, Ljava/lang/Math;->min(FF)F

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {v3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/kfk0;->b:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 44
    .line 45
    invoke-static {v4, v1}, Ljava/lang/Math;->min(FF)F

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/kfk0;->f:Lv/VLinear;

    .line 53
    .line 54
    mul-float/2addr p1, v4

    .line 55
    sub-float/2addr v4, p1

    .line 56
    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public a()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/kfk0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/kfk0;->x:Lv/VLinear;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/kfk0;->r:Lv/VLinear;

    .line 15
    .line 16
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/kfk0;->r:Lv/VLinear;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 29
    .line 30
    xor-int/lit8 v1, p1, 0x1

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/kfk0;->C:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kfk0;->p:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;Ll/bkj0;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kfk0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/kfk0;->s:Lv/VLinear;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/kfk0;->v:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/kfk0;->u:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 20
    .line 21
    iget-object v1, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object v1, p0, Ll/kfk0;->t:Lv/VDraweeView;

    .line 31
    .line 32
    iget-object v2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v2, Ljava/lang/String;

    .line 35
    .line 36
    const/high16 v3, 0x41b00000    # 22.0f

    .line 37
    .line 38
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/kfk0;->s:Lv/VLinear;

    .line 50
    .line 51
    new-instance v1, Ll/efk0;

    .line 52
    .line 53
    invoke-direct {v1, p0, p2, p1}, Ll/efk0;-><init>(Ll/kfk0;Ll/bkj0;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    iget-object v0, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const/4 v2, -0x2

    .line 67
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 68
    .line 69
    iget-object v2, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 70
    .line 71
    sget v3, Ll/qa00;->h:I

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    sget v5, Ll/qa00;->j:I

    .line 78
    .line 79
    iget-object v6, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 80
    .line 81
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 89
    .line 90
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/kfk0;->z:Lv/VDraweeView;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget v2, Ll/qa00;->q:I

    .line 100
    .line 101
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 102
    .line 103
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 104
    .line 105
    iget-object v2, p0, Ll/kfk0;->z:Lv/VDraweeView;

    .line 106
    .line 107
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 117
    .line 118
    sget v2, Ll/qa00;->e:I

    .line 119
    .line 120
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 121
    .line 122
    iget-object v2, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 123
    .line 124
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 128
    .line 129
    const/high16 v2, 0x41500000    # 13.0f

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 144
    .line 145
    const-string v2, "#6a000000"

    .line 146
    .line 147
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 155
    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 157
    .line 158
    const/4 v2, 0x3

    .line 159
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 171
    .line 172
    const-string v3, "#1A1A1B"

    .line 173
    .line 174
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 182
    .line 183
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-static {v2, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 192
    .line 193
    .line 194
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 195
    .line 196
    iget-object v2, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast v2, Ljava/lang/CharSequence;

    .line 199
    .line 200
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Ll/kfk0;->z:Lv/VDraweeView;

    .line 204
    .line 205
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 206
    .line 207
    .line 208
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 209
    .line 210
    iget-object v1, p0, Ll/kfk0;->z:Lv/VDraweeView;

    .line 211
    .line 212
    iget-object v2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 213
    .line 214
    check-cast v2, Ljava/lang/String;

    .line 215
    .line 216
    const/high16 v3, 0x41c00000    # 24.0f

    .line 217
    .line 218
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 219
    .line 220
    .line 221
    move-result v4

    .line 222
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    invoke-virtual {v0, v1, v2, v4, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 230
    .line 231
    new-instance v1, Ll/ffk0;

    .line 232
    .line 233
    invoke-direct {v1, p0, p2, p1}, Ll/ffk0;-><init>(Ll/kfk0;Ll/bkj0;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v0, v1}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/kfk0;->e:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object p0, p0, Ll/dkb;->x6:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    const-wide/16 v2, 0x1

    .line 26
    .line 27
    cmp-long p0, v0, v2

    .line 28
    .line 29
    if-gez p0, :cond_0

    .line 30
    .line 31
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    iget-object p0, p0, Ll/dkb;->x6:Ll/byd0;

    .line 36
    .line 37
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    const-string p0, "e_complete_card_info_close"

    .line 49
    .line 50
    const-string v0, "p_navigation_view"

    .line 51
    .line 52
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public g()Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kfk0;->q:Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfk0;->k:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kfk0;->I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/kfk0;->d:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->setRenderType(I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/kfk0;->K()V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public j(Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kfk0;->h:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qa00;->O:I

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/kfk0;->j:Lv/VDraweeView;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {v0, p0, p1, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Ll/kfk0;->V(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/kfk0;->F:I

    .line 6
    .line 7
    if-eq v1, v0, :cond_3

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    const/4 v4, 0x1

    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    move v1, v4

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v1, v3

    .line 17
    :goto_0
    iput v0, p0, Ll/kfk0;->F:I

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/kfk0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;->j(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    iget-object v0, p0, Ll/kfk0;->G:Ljava/lang/Runnable;

    .line 28
    .line 29
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    iget-object v1, p0, Ll/kfk0;->G:Ljava/lang/Runnable;

    .line 35
    .line 36
    const-wide/16 v5, 0x1f4

    .line 37
    .line 38
    invoke-static {v0, v1, v5, v6}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 39
    .line 40
    .line 41
    :goto_1
    iget v0, p0, Ll/kfk0;->F:I

    .line 42
    .line 43
    if-ne v0, v4, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Ll/kfk0;->d:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 46
    .line 47
    iget-object v1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->O(Lcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/kfk0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 53
    .line 54
    new-instance v1, Ll/gfk0;

    .line 55
    .line 56
    invoke-direct {v1}, Ll/gfk0;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/kfk0;->e:Lv/VImage;

    .line 63
    .line 64
    new-instance v1, Ll/hfk0;

    .line 65
    .line 66
    invoke-direct {v1, p0, p1}, Ll/hfk0;-><init>(Ll/kfk0;Lcom/p1/mobile/putong/data/User;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/kfk0;->e:Lv/VImage;

    .line 73
    .line 74
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    iget-object p1, p0, Ll/kfk0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/kfk0;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/UserInfoProfileOptTransAnimLayout;

    .line 85
    .line 86
    invoke-virtual {p0, v3}, Landroid/view/View;->setClickable(Z)V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public n(Landroid/view/View$OnClickListener;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/kfk0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/kfk0;->s:Lv/VLinear;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/kfk0;->v:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/kfk0;->v:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 20
    .line 21
    new-instance v1, Ll/ifk0;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/ifk0;-><init>(Ll/kfk0;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/high16 v2, 0x42a00000    # 80.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 43
    .line 44
    iget-object v2, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/kfk0;->z:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget v2, Ll/qa00;->m:I

    .line 56
    .line 57
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 58
    .line 59
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 60
    .line 61
    iget-object v2, p0, Ll/kfk0;->z:Lv/VDraweeView;

    .line 62
    .line 63
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 73
    .line 74
    sget v2, Ll/qa00;->e:I

    .line 75
    .line 76
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 77
    .line 78
    sget v2, Ll/qa00;->c:I

    .line 79
    .line 80
    iput v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 81
    .line 82
    iget-object v2, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 83
    .line 84
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 88
    .line 89
    const/high16 v2, 0x41600000    # 14.0f

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/kfk0;->B:Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/statussquare/CoreStatusSquareEnterView;->l:Lv/VText;

    .line 97
    .line 98
    const/high16 v2, 0x41500000    # 13.0f

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 104
    .line 105
    const/high16 v2, -0x1000000

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 111
    .line 112
    const/4 v2, 0x3

    .line 113
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Ll/kfk0;->A:Landroid/widget/TextView;

    .line 121
    .line 122
    const-string v1, "\u72b6\u6001"

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 128
    .line 129
    iget-object v1, p0, Ll/kfk0;->z:Lv/VDraweeView;

    .line 130
    .line 131
    invoke-static {}, Ll/gra;->z()Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-eqz v2, :cond_1

    .line 136
    .line 137
    sget v2, Ll/dbc0;->Of:I

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_1
    sget v2, Ll/dbc0;->Nf:I

    .line 141
    .line 142
    :goto_0
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/kfk0;->y:Lv/VLinear;

    .line 146
    .line 147
    new-instance v1, Ll/jfk0;

    .line 148
    .line 149
    invoke-direct {v1, p0, p1}, Ll/jfk0;-><init>(Ll/kfk0;Landroid/view/View$OnClickListener;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/kfk0;->E:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/kfk0;->D:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Ll/aw90;->B(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {}, Ll/gra;->X2()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/16 v2, 0x64

    .line 18
    .line 19
    const-string v3, "marryMode"

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 26
    .line 27
    iget-object v1, v1, Ll/dkb;->Z3:Ll/wyd0;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    move v0, v2

    .line 42
    :cond_0
    if-lt v0, v2, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/kfk0;->i:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/kfk0;->j:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/high16 v1, 0x42b40000    # 90.0f

    .line 57
    .line 58
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 69
    .line 70
    iget-object v1, p0, Ll/kfk0;->j:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/kfk0;->m:Lv/VText;

    .line 76
    .line 77
    const/high16 v1, 0x41500000    # 13.0f

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 80
    .line 81
    .line 82
    const-string v0, "\u7f16\u8f91"

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    iget-object v1, p0, Ll/kfk0;->j:Lv/VDraweeView;

    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const/high16 v2, 0x429c0000    # 78.0f

    .line 92
    .line 93
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 98
    .line 99
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 104
    .line 105
    iget-object v2, p0, Ll/kfk0;->j:Lv/VDraweeView;

    .line 106
    .line 107
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Ll/kfk0;->i:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    .line 111
    .line 112
    const/4 v2, 0x1

    .line 113
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Ll/kfk0;->i:Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;

    .line 117
    .line 118
    int-to-float v2, v0

    .line 119
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/RingProgressBarView;->setProgress(F)V

    .line 120
    .line 121
    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v0, "%"

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iget-object v1, p0, Ll/kfk0;->m:Lv/VText;

    .line 140
    .line 141
    const/high16 v2, 0x41600000    # 14.0f

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 144
    .line 145
    .line 146
    :goto_0
    invoke-static {}, Ll/gra;->p2()Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-eqz v1, :cond_7

    .line 151
    .line 152
    invoke-static {}, Ll/gra;->e2()Z

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    if-eqz v1, :cond_2

    .line 157
    .line 158
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 159
    .line 160
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 161
    .line 162
    iget-object v1, v1, Ll/dkb;->Z3:Ll/wyd0;

    .line 163
    .line 164
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    check-cast v1, Ljava/lang/CharSequence;

    .line 169
    .line 170
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    if-nez v1, :cond_7

    .line 175
    .line 176
    :cond_2
    invoke-static {p1}, Ll/aw90;->U(Lcom/p1/mobile/putong/data/User;)Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    const/high16 v1, 0x41200000    # 10.0f

    .line 181
    .line 182
    const/16 v2, 0x3c

    .line 183
    .line 184
    if-eqz p1, :cond_4

    .line 185
    .line 186
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 187
    .line 188
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 189
    .line 190
    iget-object p1, p1, Ll/dkb;->D6:Ll/jxd0;

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    check-cast p1, Ljava/lang/Boolean;

    .line 197
    .line 198
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    if-nez p1, :cond_3

    .line 203
    .line 204
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 209
    .line 210
    if-ne p1, v0, :cond_3

    .line 211
    .line 212
    iget-object p1, p0, Ll/kfk0;->l:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

    .line 213
    .line 214
    sget v0, Ll/dbc0;->mg:I

    .line 215
    .line 216
    new-instance v3, Ll/cfk0;

    .line 217
    .line 218
    invoke-direct {v3, p0}, Ll/cfk0;-><init>(Ll/kfk0;)V

    .line 219
    .line 220
    .line 221
    const-string v4, "https://auto.tancdn.com/v1/raw/21b5cc87-9734-44c1-b353-993bb8cc343e14.svga"

    .line 222
    .line 223
    invoke-virtual {p1, v4, v0, v2, v3}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->e(Ljava/lang/String;IILjava/lang/Runnable;)V

    .line 224
    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_3
    iget-object p1, p0, Ll/kfk0;->l:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

    .line 228
    .line 229
    sget v0, Ll/dbc0;->mg:I

    .line 230
    .line 231
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->setLocalRes(I)V

    .line 232
    .line 233
    .line 234
    :goto_1
    iget-object p1, p0, Ll/kfk0;->m:Lv/VText;

    .line 235
    .line 236
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 237
    .line 238
    .line 239
    const-string v0, "\u5438\u5f15\u529b\u8f83\u4f4e"

    .line 240
    .line 241
    goto/16 :goto_3

    .line 242
    .line 243
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 244
    .line 245
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 246
    .line 247
    iget-object p1, p1, Ll/dkb;->j7:Lrx/subjects/a;

    .line 248
    .line 249
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-eqz p1, :cond_6

    .line 258
    .line 259
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 260
    .line 261
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 262
    .line 263
    iget-object p1, p1, Ll/dkb;->j7:Lrx/subjects/a;

    .line 264
    .line 265
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 270
    .line 271
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 272
    .line 273
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    if-nez p1, :cond_6

    .line 278
    .line 279
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 280
    .line 281
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 282
    .line 283
    iget-object p1, p1, Ll/dkb;->j7:Lrx/subjects/a;

    .line 284
    .line 285
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 290
    .line 291
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->title:Ljava/lang/String;

    .line 292
    .line 293
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 294
    .line 295
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 296
    .line 297
    iget-object p1, p1, Ll/dkb;->E6:Ll/wyd0;

    .line 298
    .line 299
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    check-cast p1, Ljava/lang/CharSequence;

    .line 304
    .line 305
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    if-nez p1, :cond_5

    .line 310
    .line 311
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 316
    .line 317
    if-ne p1, v3, :cond_5

    .line 318
    .line 319
    iget-object p1, p0, Ll/kfk0;->l:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

    .line 320
    .line 321
    sget v3, Ll/dbc0;->pg:I

    .line 322
    .line 323
    new-instance v4, Ll/dfk0;

    .line 324
    .line 325
    invoke-direct {v4, p0, v0}, Ll/dfk0;-><init>(Ll/kfk0;Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    const-string v5, "https://fe-static.tancdn.com/v1/raw/f2005b92-dd66-401a-abd9-9b6dca2c049814.svga"

    .line 329
    .line 330
    invoke-virtual {p1, v5, v3, v2, v4}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->e(Ljava/lang/String;IILjava/lang/Runnable;)V

    .line 331
    .line 332
    .line 333
    goto :goto_2

    .line 334
    :cond_5
    iget-object p1, p0, Ll/kfk0;->l:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

    .line 335
    .line 336
    sget v2, Ll/dbc0;->pg:I

    .line 337
    .line 338
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->setLocalRes(I)V

    .line 339
    .line 340
    .line 341
    :goto_2
    iget-object p1, p0, Ll/kfk0;->m:Lv/VText;

    .line 342
    .line 343
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 344
    .line 345
    .line 346
    goto :goto_3

    .line 347
    :cond_6
    iget-object p1, p0, Ll/kfk0;->l:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

    .line 348
    .line 349
    sget v1, Ll/dbc0;->Ug:I

    .line 350
    .line 351
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->setLocalRes(I)V

    .line 352
    .line 353
    .line 354
    goto :goto_3

    .line 355
    :cond_7
    iget-object p1, p0, Ll/kfk0;->l:Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;

    .line 356
    .line 357
    sget v1, Ll/dbc0;->Ug:I

    .line 358
    .line 359
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->setLocalRes(I)V

    .line 360
    .line 361
    .line 362
    :goto_3
    iget-object p0, p0, Ll/kfk0;->m:Lv/VText;

    .line 363
    .line 364
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    .line 366
    .line 367
    return-void
.end method

.method public r()Z
    .locals 2

    .line 1
    iget v0, p0, Ll/kfk0;->F:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-super {p0}, Ll/y6k0;->r()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public t()Lv/VText;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kfk0;->n:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/kfk0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/kfk0;->C:Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/statussquare/CoreMyTabStatusPostView;->p()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public v()Lv/VImage;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kfk0;->o:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method
