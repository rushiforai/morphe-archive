.class public Ll/mwe;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/sve;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Landroid/text/SpannableString;

.field public F:Landroid/text/style/ClickableSpan;

.field public G:Z

.field public H:Z

.field public I:Ll/l4g0;

.field public J:Ll/l4g0;

.field public c:Lv/VScroll;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public g:Lv/VEditText;

.field public h:Lv/VImage;

.field public i:Lv/VLinear;

.field public j:Lv/VEditText;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lv/VEditText;

.field public o:Lv/VImage;

.field public p:Lv/VText;

.field public q:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public r:Landroid/widget/LinearLayout;

.field public s:Lv/VText;

.field public t:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Z

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/mwe;->y:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/mwe;->A:Z

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/mwe;->B:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Ll/mwe;->C:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/mwe;->D:Z

    .line 15
    .line 16
    new-instance p1, Ll/l4g0;

    .line 17
    .line 18
    const-class v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "p_intl_sign_in_email_verification_address_view"

    .line 25
    .line 26
    invoke-direct {p1, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/mwe;->I:Ll/l4g0;

    .line 30
    .line 31
    new-instance p1, Ll/l4g0;

    .line 32
    .line 33
    const-string v1, "p_intl_sign_in_email_password_view"

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-direct {p1, v1, v0}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/mwe;->J:Ll/l4g0;

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic A(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->o0()V

    return-void
.end method

.method public static synthetic C(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/mwe;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->K(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic F(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->p0()V

    return-void
.end method

.method public static bridge synthetic G(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->I()V

    return-void
.end method

.method public static synthetic j(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/mwe;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->l0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->Z()V

    return-void
.end method

.method public static synthetic m(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->a0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic m0(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "e_intl_email_log_in_with_verification_button"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Ll/mwe;->y:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 15
    .line 16
    check-cast p0, Ll/sve;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/sve;->y2()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Ll/mwe;->t0(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic n(Ll/mwe;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mwe;->g0(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic p(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->q0()V

    return-void
.end method

.method public static synthetic q(Ll/mwe;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->i0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private r0()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast v0, Ll/sve;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/sve;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 12
    .line 13
    check-cast v0, Ll/sve;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/sve;->R1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 23
    .line 24
    check-cast v0, Ll/sve;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/sve;->Q1()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->pageId()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "e_intl_replace_email_verfify_btn"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 47
    .line 48
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->pageId()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "e_intl_add_email_verfify_btn"

    .line 55
    .line 56
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    const/4 v1, 0x1

    .line 70
    const/4 v2, 0x0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 74
    .line 75
    check-cast v0, Ll/sve;

    .line 76
    .line 77
    iget-object v3, p0, Ll/mwe;->g:Lv/VEditText;

    .line 78
    .line 79
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v0, v3}, Ll/sve;->I1(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    move v0, v1

    .line 94
    goto :goto_2

    .line 95
    :cond_3
    move v0, v2

    .line 96
    :goto_2
    iget-boolean v3, p0, Ll/mwe;->y:Z

    .line 97
    .line 98
    if-eqz v3, :cond_7

    .line 99
    .line 100
    const-string v3, "e_intl_email_password_signin_button"

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-static {v3, v4}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Ll/mwe;->j:Lv/VEditText;

    .line 110
    .line 111
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-nez v3, :cond_4

    .line 120
    .line 121
    iget-object v3, p0, Ll/mwe;->j:Lv/VEditText;

    .line 122
    .line 123
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    const/4 v4, 0x6

    .line 132
    if-lt v3, v4, :cond_4

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_4
    move v1, v2

    .line 136
    :goto_3
    if-nez v0, :cond_5

    .line 137
    .line 138
    sget p0, Lcom/p1/mobile/putong/account/R$string;->j2:I

    .line 139
    .line 140
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_5
    if-nez v1, :cond_6

    .line 145
    .line 146
    sget p0, Lcom/p1/mobile/putong/account/R$string;->i2:I

    .line 147
    .line 148
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_6
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 153
    .line 154
    check-cast p0, Ll/sve;

    .line 155
    .line 156
    invoke-virtual {p0}, Ll/sve;->A2()V

    .line 157
    .line 158
    .line 159
    return-void

    .line 160
    :cond_7
    const-string v0, "e_intl_email_address_continue_button"

    .line 161
    .line 162
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ll/mwe;->O()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    const/4 v1, 0x4

    .line 178
    if-eqz v0, :cond_9

    .line 179
    .line 180
    invoke-virtual {p0}, Ll/mwe;->V()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_8

    .line 185
    .line 186
    iget-object v0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 187
    .line 188
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    if-lt v0, v1, :cond_8

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_8
    invoke-virtual {p0}, Ll/mwe;->I()V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 203
    .line 204
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 208
    .line 209
    check-cast p0, Ll/sve;

    .line 210
    .line 211
    invoke-virtual {p0}, Ll/sve;->y2()V

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :cond_9
    :goto_4
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 216
    .line 217
    check-cast v0, Ll/sve;

    .line 218
    .line 219
    invoke-virtual {p0}, Ll/mwe;->M()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {v0, v2}, Ll/sve;->I1(Ljava/lang/String;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-eqz v0, :cond_b

    .line 228
    .line 229
    invoke-virtual {p0}, Ll/mwe;->V()Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-eqz v0, :cond_a

    .line 234
    .line 235
    iget-object v0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 236
    .line 237
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-lt v0, v1, :cond_a

    .line 246
    .line 247
    invoke-virtual {p0}, Ll/mwe;->O()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-static {v0}, Ll/l51;->K(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    :cond_a
    invoke-virtual {p0}, Ll/mwe;->x0()V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :cond_b
    sget p0, Lcom/p1/mobile/putong/account/R$string;->j2:I

    .line 259
    .line 260
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 261
    .line 262
    .line 263
    return-void
.end method

.method public static synthetic s(Ll/mwe;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mwe;->c0(Landroid/view/View;Z)V

    return-void
.end method

.method public static synthetic u(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->n0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->e0()V

    return-void
.end method

.method public static synthetic x(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mwe;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/mwe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mwe;->j0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/mwe;->y:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/mwe;->t0(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public B0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/mwe;->D:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/mwe;->q:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    new-instance v1, Ll/mwe$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/mwe$a;-><init>(Ll/mwe;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "account_loading_progress.svga"

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    invoke-virtual {v0, p0, v2, v1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->startSVGAAnimWithListener(Ljava/lang/String;ILcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public D0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/mwe;->D:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/mwe;->q:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->stopAnimCompletely()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 4
    .line 5
    new-instance v1, Ll/tve;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/tve;-><init>(Ll/mwe;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public G0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->D0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nwe;->b(Ll/mwe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final I()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/mwe;->y:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v3, 0x6

    .line 30
    if-lt v0, v3, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 45
    .line 46
    check-cast v0, Ll/sve;

    .line 47
    .line 48
    iget-object v3, p0, Ll/mwe;->g:Lv/VEditText;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v0, v3}, Ll/sve;->I1(Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    move v1, v2

    .line 65
    :cond_0
    iget-object v0, p0, Ll/mwe;->s:Lv/VText;

    .line 66
    .line 67
    sget v2, Lcom/p1/mobile/putong/account/R$string;->o2:I

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    iget-boolean v0, p0, Ll/mwe;->C:Z

    .line 74
    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    iget-object v0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    const/4 v3, 0x4

    .line 88
    if-lt v0, v3, :cond_3

    .line 89
    .line 90
    :cond_2
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_3

    .line 101
    .line 102
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 103
    .line 104
    check-cast v0, Ll/sve;

    .line 105
    .line 106
    iget-object v3, p0, Ll/mwe;->g:Lv/VEditText;

    .line 107
    .line 108
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    invoke-virtual {v0, v3}, Ll/sve;->I1(Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_3

    .line 121
    .line 122
    move v1, v2

    .line 123
    :cond_3
    iget-object v0, p0, Ll/mwe;->s:Lv/VText;

    .line 124
    .line 125
    sget v2, Lcom/p1/mobile/putong/account/R$string;->h2:I

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 128
    .line 129
    .line 130
    :goto_0
    iget-object v0, p0, Ll/mwe;->s:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Ll/mwe;->s:Lv/VText;

    .line 136
    .line 137
    if-eqz v1, :cond_4

    .line 138
    .line 139
    sget v0, Ll/bbc0;->I1:I

    .line 140
    .line 141
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_4
    sget v0, Ll/bbc0;->H1:I

    .line 146
    .line 147
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public final J()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 4
    .line 5
    new-instance v1, Ll/wve;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/wve;-><init>(Ll/mwe;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x96

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final K(Ljava/lang/CharSequence;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v2, v1, [Ll/pf60;

    .line 7
    .line 8
    const-string v3, "e_email_input"

    .line 9
    .line 10
    invoke-static {v3, v0, v2}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/mwe;->p:Lv/VText;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/mwe;->I()V

    .line 19
    .line 20
    .line 21
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x1

    .line 26
    if-lez p1, :cond_0

    .line 27
    .line 28
    move v1, v0

    .line 29
    :cond_0
    iget-object p1, p0, Ll/mwe;->h:Lv/VImage;

    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/mwe;->h:Lv/VImage;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public L()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public M()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public N()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public O()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "account_sign_"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/mwe;->M()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public P(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwe;->w:Lv/VText;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/mwe;->w:Lv/VText;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/high16 p1, 0x3f000000    # 0.5f

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/mwe;->C:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public R()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/mwe$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mwe$b;-><init>(Ll/mwe;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/mwe;->o:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/cwe;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/cwe;-><init>(Ll/mwe;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public S()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwe;->s:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/vve;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/vve;-><init>(Ll/mwe;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/mwe;->I()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public T()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VEditText;->i(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v2, Ll/hwe;

    .line 9
    .line 10
    invoke-direct {v2, p0}, Ll/hwe;-><init>(Ll/mwe;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 21
    .line 22
    new-instance v2, Ll/iwe;

    .line 23
    .line 24
    invoke-direct {v2, p0}, Ll/iwe;-><init>(Ll/mwe;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 31
    .line 32
    new-instance v2, Ll/jwe;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/jwe;-><init>(Ll/mwe;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/kwe;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/kwe;-><init>(Ll/mwe;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 49
    .line 50
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->d2()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_0

    .line 61
    .line 62
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 63
    .line 64
    iget-object v2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 65
    .line 66
    check-cast v2, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->d2()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->f:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 85
    .line 86
    sget-object v2, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->f:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/mwe;->h:Lv/VImage;

    .line 92
    .line 93
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/mwe;->h:Lv/VImage;

    .line 97
    .line 98
    new-instance v1, Ll/lwe;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/lwe;-><init>(Ll/mwe;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final U()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    .line 4
    .line 5
    const/16 v2, 0x14

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    aput-object v1, v2, v3

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 20
    .line 21
    new-instance v1, Ll/xve;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/xve;-><init>(Ll/mwe;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 30
    .line 31
    new-instance v1, Ll/yve;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/yve;-><init>(Ll/mwe;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/mwe;->k:Lv/VImage;

    .line 40
    .line 41
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Lv/VEditText;->i(Z)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/zve;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/zve;-><init>(Ll/mwe;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/mwe;->k:Lv/VImage;

    .line 63
    .line 64
    new-instance v1, Ll/awe;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/awe;-><init>(Ll/mwe;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/mwe;->l:Lv/VImage;

    .line 73
    .line 74
    new-instance v1, Ll/bwe;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/bwe;-><init>(Ll/mwe;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public V()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public W()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mwe;->y:Z

    .line 2
    .line 3
    return p0
.end method

.method public final X()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 2
    .line 3
    check-cast p0, Ll/sve;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/sve;->i:Z

    .line 6
    .line 7
    return p0
.end method

.method public Y()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mwe;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/mwe;->t:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sub-int/2addr v0, v1

    .line 24
    iget-object v1, p0, Ll/mwe;->c:Lv/VScroll;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    sub-int/2addr v0, v1

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/mwe;->c:Lv/VScroll;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p0, v1, v0}, Landroid/widget/ScrollView;->smoothScrollTo(II)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/mwe;->o:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 8
    .line 9
    check-cast p0, Ll/sve;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/sve;->v2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic b0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mwe;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c0(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string p1, "e_email_input"

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "e_email_input"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/jbf0;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mwe;->J:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4g0;->e()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/mwe;->I:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/l4g0;->e()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/mwe;->E:Landroid/text/SpannableString;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/mwe;->F:Landroid/text/style/ClickableSpan;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/mwe;->E:Landroid/text/SpannableString;

    .line 31
    .line 32
    iget-object p0, p0, Ll/mwe;->F:Landroid/text/style/ClickableSpan;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Landroid/text/SpannableString;->removeSpan(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 20
    .line 21
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 22
    .line 23
    iget-object p0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const-string p1, "e_password_input"

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic h0(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "e_password_input"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mwe;->p:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    xor-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic i0(Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mwe;->k:Lv/VImage;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-lez v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v1, v2

    .line 13
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-array v1, v2, [Ll/pf60;

    .line 21
    .line 22
    const-string v2, "e_password_input"

    .line 23
    .line 24
    invoke-static {v2, v0, v1}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/mwe;->I()V

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-lez p1, :cond_1

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    invoke-virtual {p0, p1}, Ll/mwe;->i(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mwe;->H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/mwe;->z:Landroid/view/View;

    .line 6
    .line 7
    return-object p1
.end method

.method public final synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/mwe;->B:Z

    .line 2
    .line 3
    xor-int/lit8 v0, p1, 0x1

    .line 4
    .line 5
    iput-boolean v0, p0, Ll/mwe;->B:Z

    .line 6
    .line 7
    iget-object v0, p0, Ll/mwe;->l:Lv/VImage;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    sget p1, Ll/bbc0;->k1:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget p1, Ll/bbc0;->l1:I

    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/mwe;->j:Lv/VEditText;

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/mwe;->B:Z

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Landroid/text/method/PasswordTransformationMethod;->getInstance()Landroid/text/method/PasswordTransformationMethod;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-static {}, Landroid/text/method/HideReturnsTransformationMethod;->getInstance()Landroid/text/method/HideReturnsTransformationMethod;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    :goto_1
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mwe;->J()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic n0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 9
    .line 10
    iget-object p0, p0, Ll/mwe;->j:Lv/VEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 9
    .line 10
    iget-object p0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic q0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mwe;->w:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mwe;->X()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 4
    .line 5
    const/16 v1, 0x7530

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->lmdStart(I)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lv/VLinear;->b:Lv/VLinear$a;

    .line 11
    .line 12
    invoke-virtual {v0}, Lv/VLinear$a;->c()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/mwe;->p:Lv/VText;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/mwe;->i:Lv/VLinear;

    .line 22
    .line 23
    const/16 v1, 0x8

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 29
    .line 30
    check-cast v0, Ll/sve;

    .line 31
    .line 32
    iget-object v1, p0, Ll/mwe;->z:Landroid/view/View;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/dwe;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/dwe;-><init>(Ll/mwe;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/mwe;->T()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ll/mwe;->R()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/mwe;->U()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ll/mwe;->S()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/mwe;->v0()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/mwe;->v:Lv/VText;

    .line 74
    .line 75
    new-instance v1, Ll/ewe;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/ewe;-><init>(Ll/mwe;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/mwe;->u:Lv/VImage;

    .line 84
    .line 85
    new-instance v1, Ll/fwe;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/fwe;-><init>(Ll/mwe;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/mwe;->w:Lv/VText;

    .line 94
    .line 95
    iget-object v1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 96
    .line 97
    check-cast v1, Ll/sve;

    .line 98
    .line 99
    invoke-virtual {v1}, Ll/sve;->z2()Landroid/view/View$OnClickListener;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/mwe;->x:Lv/VText;

    .line 107
    .line 108
    iget-object v1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 109
    .line 110
    check-cast v1, Ll/sve;

    .line 111
    .line 112
    invoke-virtual {v1}, Ll/sve;->x2()Landroid/view/View$OnClickListener;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 120
    .line 121
    check-cast v0, Ll/sve;

    .line 122
    .line 123
    invoke-virtual {v0}, Ll/sve;->R1()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_0

    .line 128
    .line 129
    iget-object v0, p0, Ll/mwe;->x:Lv/VText;

    .line 130
    .line 131
    sget-object v1, Ll/awi0;->c:Ll/jxd0;

    .line 132
    .line 133
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    check-cast v1, Ljava/lang/Boolean;

    .line 138
    .line 139
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/mwe;->d:Lv/VText;

    .line 147
    .line 148
    sget v0, Lcom/p1/mobile/putong/account/R$string;->b2:I

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_0
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 155
    .line 156
    check-cast v0, Ll/sve;

    .line 157
    .line 158
    invoke-virtual {v0}, Ll/sve;->P1()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_2

    .line 163
    .line 164
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 165
    .line 166
    check-cast v0, Ll/sve;

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/sve;->Q1()Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-eqz v0, :cond_1

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_1
    return-void

    .line 176
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/mwe;->d:Lv/VText;

    .line 177
    .line 178
    sget v0, Lcom/p1/mobile/putong/account/R$string;->V0:I

    .line 179
    .line 180
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public s0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/mwe;->C:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mwe;->I()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/mwe;->O()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/16 v1, 0x14

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/l51;->N(Ljava/lang/String;I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 26
    .line 27
    check-cast p0, Ll/sve;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/sve;->y2()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public t0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/mwe;->p:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/mwe;->v0()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/mwe;->I()V

    .line 11
    .line 12
    .line 13
    iget-boolean p1, p0, Ll/mwe;->y:Z

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/mwe;->v:Lv/VText;

    .line 24
    .line 25
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/mwe;->w:Lv/VText;

    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/mwe;->v:Lv/VText;

    .line 34
    .line 35
    sget v1, Lcom/p1/mobile/putong/account/R$string;->f3:I

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/mwe;->d:Lv/VText;

    .line 41
    .line 42
    sget v1, Lcom/p1/mobile/putong/account/R$string;->f2:I

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 48
    .line 49
    check-cast p1, Ll/sve;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/mwe;->M()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {p1, v1}, Ll/sve;->I1(Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_0

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v0, Ll/gwe;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/gwe;-><init>(Ll/mwe;)V

    .line 68
    .line 69
    .line 70
    const-wide/16 v1, 0x64

    .line 71
    .line 72
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    iget-object p1, p0, Ll/mwe;->g:Lv/VEditText;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 82
    .line 83
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 84
    .line 85
    iget-object p0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 86
    .line 87
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    iget-boolean p1, p0, Ll/mwe;->C:Z

    .line 92
    .line 93
    if-eqz p1, :cond_2

    .line 94
    .line 95
    iget-object p1, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 96
    .line 97
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/mwe;->n:Lv/VEditText;

    .line 101
    .line 102
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 103
    .line 104
    .line 105
    :cond_2
    iget-object p1, p0, Ll/mwe;->v:Lv/VText;

    .line 106
    .line 107
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/mwe;->E0()V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Ll/mwe;->d:Lv/VText;

    .line 114
    .line 115
    sget v1, Lcom/p1/mobile/putong/account/R$string;->d2:I

    .line 116
    .line 117
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 121
    .line 122
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-nez p1, :cond_3

    .line 127
    .line 128
    iget-object p1, p0, Ll/mwe;->g:Lv/VEditText;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 134
    .line 135
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 136
    .line 137
    iget-object p0, p0, Ll/mwe;->g:Lv/VEditText;

    .line 138
    .line 139
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 140
    .line 141
    .line 142
    :cond_3
    return-void
.end method

.method public u0()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "reason"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    const-string v1, "bind-email"

    .line 18
    .line 19
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const-string p0, "p_account_add_email"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    const-string v1, "change-email"

    .line 33
    .line 34
    invoke-static {v1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    const-string p0, "p_account_replace_email"

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_1
    invoke-virtual {p0}, Ll/mwe;->W()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    const-string p0, "p_intl_sign_in_email_password_view"

    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_2
    const-string p0, "p_intl_sign_in_email_verification_address_view"

    .line 57
    .line 58
    return-object p0
.end method

.method public final v0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mwe;->I:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mwe;->u0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Ll/mwe;->y:Z

    .line 11
    .line 12
    iget-object v1, p0, Ll/mwe;->f:Lv/VLinear;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x1

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/mwe;->w:Lv/VText;

    .line 22
    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/mwe;->r:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/mwe;->i:Lv/VLinear;

    .line 32
    .line 33
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/mwe;->e:Lv/VText;

    .line 37
    .line 38
    sget v1, Lcom/p1/mobile/putong/account/R$string;->e2:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 41
    .line 42
    .line 43
    iget-boolean v0, p0, Ll/mwe;->G:Z

    .line 44
    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Ll/mwe;->I:Ll/l4g0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-boolean v0, p0, Ll/mwe;->H:Z

    .line 53
    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iput-boolean v3, p0, Ll/mwe;->H:Z

    .line 57
    .line 58
    iget-object v0, p0, Ll/mwe;->J:Ll/l4g0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object p0, p0, Ll/mwe;->J:Ll/l4g0;

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/mwe;->E0()V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/mwe;->i:Lv/VLinear;

    .line 76
    .line 77
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/mwe;->r:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/mwe;->e:Lv/VText;

    .line 86
    .line 87
    sget v1, Lcom/p1/mobile/putong/account/R$string;->c2:I

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 90
    .line 91
    .line 92
    iget-boolean v0, p0, Ll/mwe;->H:Z

    .line 93
    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    iget-object v0, p0, Ll/mwe;->J:Ll/l4g0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 99
    .line 100
    .line 101
    :cond_3
    iget-boolean v0, p0, Ll/mwe;->G:Z

    .line 102
    .line 103
    if-nez v0, :cond_4

    .line 104
    .line 105
    iput-boolean v3, p0, Ll/mwe;->G:Z

    .line 106
    .line 107
    iget-object v0, p0, Ll/mwe;->I:Ll/l4g0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 110
    .line 111
    .line 112
    :cond_4
    iget-object p0, p0, Ll/mwe;->I:Ll/l4g0;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public w0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mwe;->M()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sput-object p0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->f:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public final x0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/EmailLoginOptAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 9
    .line 10
    check-cast v0, Ll/sve;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/sve;->H1()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public y0(Lcom/p1/mobile/putong/account/data/CaptchaData;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/mwe;->m:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Ll/mwe;->A:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/mwe;->n:Lv/VEditText;

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iput-boolean v1, p0, Ll/mwe;->C:Z

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/mwe;->I()V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    const/4 v2, 0x0

    .line 23
    :try_start_0
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CaptchaData;->images:Lcom/p1/mobile/putong/account/data/CaptchaImage;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CaptchaImage;->chars:Lcom/p1/mobile/putong/account/data/CaptchaChars;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CaptchaChars;->content:Ljava/lang/String;

    .line 28
    .line 29
    const-string v3, ","

    .line 30
    .line 31
    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    aget-object p1, p1, v1

    .line 36
    .line 37
    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    array-length v1, p1

    .line 42
    invoke-static {p1, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v1, p0, Ll/mwe;->o:Lv/VImage;

    .line 47
    .line 48
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catch_0
    move-exception p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/mwe;->o:Lv/VImage;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 59
    .line 60
    .line 61
    :goto_0
    new-instance p1, Ll/uve;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Ll/uve;-><init>(Ll/mwe;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    iput-boolean v2, p0, Ll/mwe;->y:Z

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/mwe;->t0(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public z0(Ljava/lang/Throwable;Ljava/lang/String;)Z
    .locals 5

    .line 1
    instance-of p2, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    move-object p2, p1

    .line 7
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 8
    .line 9
    iget-object v1, p0, Ll/mwe;->p:Lv/VText;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    const-string v1, "wrong_type"

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    filled-new-array {v1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v3, "e_intl_email_password_signin_wrong_tips"

    .line 30
    .line 31
    const-string v4, "p_intl_sign_in_email_password_view"

    .line 32
    .line 33
    invoke-static {v3, v4, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget p2, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 37
    .line 38
    sparse-switch p2, :sswitch_data_0

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 42
    .line 43
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :sswitch_0
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 48
    .line 49
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1}, Ll/tf;->b(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return v2

    .line 56
    :sswitch_1
    iget-object p1, p0, Ll/mwe;->p:Lv/VText;

    .line 57
    .line 58
    sget p2, Lcom/p1/mobile/putong/account/R$string;->a0:I

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/mwe;->o:Lv/VImage;

    .line 64
    .line 65
    const/4 p2, 0x0

    .line 66
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/jbf0;->b:Ll/ibf0;

    .line 70
    .line 71
    check-cast p0, Ll/sve;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/sve;->v2()V

    .line 74
    .line 75
    .line 76
    return v2

    .line 77
    :sswitch_2
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 78
    .line 79
    sget p1, Lcom/p1/mobile/putong/account/R$string;->X:I

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    return v2

    .line 85
    :sswitch_3
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 86
    .line 87
    sget p1, Lcom/p1/mobile/putong/account/R$string;->a0:I

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 90
    .line 91
    .line 92
    return v2

    .line 93
    :sswitch_4
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 94
    .line 95
    sget p1, Lcom/p1/mobile/putong/account/R$string;->Y:I

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 98
    .line 99
    .line 100
    return v2

    .line 101
    :sswitch_5
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 102
    .line 103
    sget p1, Lcom/p1/mobile/putong/account/R$string;->i2:I

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 106
    .line 107
    .line 108
    return v2

    .line 109
    :sswitch_6
    iget-object p0, p0, Ll/mwe;->p:Lv/VText;

    .line 110
    .line 111
    sget p1, Lcom/p1/mobile/putong/account/R$string;->j2:I

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 114
    .line 115
    .line 116
    return v2

    .line 117
    :cond_0
    :goto_0
    return v0

    .line 118
    nop

    .line 119
    :sswitch_data_0
    .sparse-switch
        0x9c43 -> :sswitch_6
        0x9c4a -> :sswitch_6
        0x9c4c -> :sswitch_5
        0x9c4d -> :sswitch_4
        0x9c4e -> :sswitch_3
        0x9c4f -> :sswitch_2
        0x61af2 -> :sswitch_1
        0x61b16 -> :sswitch_6
        0x62638 -> :sswitch_0
    .end sparse-switch
.end method
