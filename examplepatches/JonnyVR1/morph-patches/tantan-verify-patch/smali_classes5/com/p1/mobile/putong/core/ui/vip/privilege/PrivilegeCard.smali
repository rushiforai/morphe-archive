.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;
.super Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;
.source "SourceFile"


# instance fields
.field public A:Z

.field public d:Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:Lcom/tantan/library/svga/SVGAnimationView;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VImage;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VImage;

.field public m:Lv/VLinear;

.field public n:Lv/VImage;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VDraweeView;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Lcom/tantan/library/svga/SVGAnimationView;

.field public v:Lcom/tantan/library/svga/SVGAnimationView;

.field public w:Ll/lb2;

.field public x:Lcom/p1/mobile/putong/app/PutongFrag;

.field public y:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeBaseCard;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    return-void
.end method

.method private L0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 5
    .line 6
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$i;->a:[I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    aget v0, v0, v1

    .line 18
    .line 19
    packed-switch v0, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->R0()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->Q0()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->S0()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :pswitch_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->U0()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :pswitch_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->P0()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :pswitch_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->V0()V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w0()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    nop

    .line 51
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private N0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    new-instance v3, Ll/c190;

    .line 14
    .line 15
    invoke-direct {v3}, Ll/c190;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/d190;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/d190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->H0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->G0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    return-void
.end method

.method public static synthetic n0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->D0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic o0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->I0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->J0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic q0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->E0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->B0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private u0()V
    .locals 7

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x500

    .line 6
    .line 7
    if-gt v0, v1, :cond_4

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 10
    .line 11
    invoke-static {}, Ll/bnl0;->w0()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/high16 v2, 0x41800000    # 16.0f

    .line 16
    .line 17
    const/16 v3, 0x3c0

    .line 18
    .line 19
    if-ge v1, v3, :cond_0

    .line 20
    .line 21
    move v1, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/high16 v1, 0x41900000    # 18.0f

    .line 24
    .line 25
    :goto_0
    const/4 v4, 0x2

    .line 26
    invoke-virtual {v0, v4, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 30
    .line 31
    invoke-static {}, Ll/bnl0;->w0()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    const/high16 v5, 0x41400000    # 12.0f

    .line 36
    .line 37
    if-ge v1, v3, :cond_1

    .line 38
    .line 39
    move v1, v5

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    const/high16 v1, 0x41500000    # 13.0f

    .line 42
    .line 43
    :goto_1
    invoke-virtual {v0, v4, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 47
    .line 48
    invoke-static {}, Ll/bnl0;->w0()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const/high16 v6, 0x41300000    # 11.0f

    .line 53
    .line 54
    if-ge v1, v3, :cond_2

    .line 55
    .line 56
    move v5, v6

    .line 57
    :cond_2
    invoke-virtual {v0, v4, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 61
    .line 62
    invoke-static {}, Ll/bnl0;->w0()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-ge v1, v3, :cond_3

    .line 67
    .line 68
    const/high16 v6, 0x41200000    # 10.0f

    .line 69
    .line 70
    :cond_3
    invoke-virtual {v0, v4, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 80
    .line 81
    const/high16 v1, 0x41880000    # 17.0f

    .line 82
    .line 83
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    const/high16 v4, 0x40800000    # 4.0f

    .line 88
    .line 89
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    const/4 v5, 0x0

    .line 98
    invoke-virtual {v0, v3, v4, v1, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->k:Landroid/widget/LinearLayout;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 108
    .line 109
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    invoke-virtual {v0, v1, v2, v5, v5}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->r:Lv/VDraweeView;

    .line 121
    .line 122
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/high16 v1, 0x41b00000    # 22.0f

    .line 127
    .line 128
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->r:Lv/VDraweeView;

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 145
    .line 146
    :cond_4
    return-void
.end method

.method private y0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->N0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$i;->a:[I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    aget v0, v0, v1

    .line 13
    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->Z0()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->Y0()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->a1()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->d1()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->X0()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :pswitch_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->e1()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    nop

    .line 43
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final synthetic B0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/xzc0;->R()[Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_myvip_auto"

    .line 10
    .line 11
    const-string v1, "p_privileges_view"

    .line 12
    .line 13
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "p_privilege,default"

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-static {p1, v0}, Ll/abb0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/xzc0;->z()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/xzc0;->l()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    const-string v0, "myvip_reauto_button_unauto_order"

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const-string v0, "myvip_reauto_button"

    .line 57
    .line 58
    :goto_0
    invoke-virtual {p1, p0, v0}, Ll/xzc0;->S(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/xzc0;->M()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 71
    .line 72
    const/4 v2, 0x0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    instance-of v0, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 80
    .line 81
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 82
    .line 83
    invoke-virtual {v1, p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->X4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    instance-of v0, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 106
    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 110
    .line 111
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 112
    .line 113
    invoke-virtual {v1, p0, v2, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->X4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 122
    .line 123
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->I1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic E0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 6
    .line 7
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->O0(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic I0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/upl0;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Ll/upl0;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->O0(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic J0(Lcom/p1/mobile/putong/core/data/UserPrivilege;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final K0()Lcom/tantan/library/svga/AnimListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$g;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final O0(Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xzc0;->y()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/xzc0;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ll/xzc0;->l()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const-string v3, "p_privileges_view"

    .line 26
    .line 27
    const-string v4, "e_myvip_auto"

    .line 28
    .line 29
    const-string v5, "unknown_"

    .line 30
    .line 31
    const-string v6, "svip"

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    const/4 v8, 0x1

    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 38
    .line 39
    invoke-static {p1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 43
    .line 44
    const-string v0, "\u53bb\u5f00\u901a"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 54
    .line 55
    if-ne v0, v1, :cond_0

    .line 56
    .line 57
    move v7, v8

    .line 58
    :cond_0
    invoke-static {v7}, Ll/xzc0;->Q(Z)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 68
    .line 69
    if-ne v0, v1, :cond_1

    .line 70
    .line 71
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    :goto_0
    invoke-static {v0}, Ll/dk90;->d(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1}, Ll/xzc0;->R()[Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {v4, v3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_3

    .line 99
    .line 100
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 101
    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    invoke-static {v2, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Ll/xzc0;->u()Ll/bkj0;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast v0, Ljava/lang/Integer;

    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 124
    .line 125
    if-nez v0, :cond_3

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget v2, Lcom/p1/mobile/putong/core/R$string;->I2:I

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 138
    .line 139
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    sget v2, Lcom/p1/mobile/putong/core/R$string;->J2:I

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object v2, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 162
    .line 163
    iget-object v3, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 164
    .line 165
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 166
    .line 167
    filled-new-array {v2, v3, p1}, [Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    goto :goto_3

    .line 179
    :cond_4
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_5

    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 186
    .line 187
    invoke-static {v0, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Ll/xzc0;->R()[Ll/pf60;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {v4, v3, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 199
    .line 200
    .line 201
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 202
    .line 203
    if-eqz v1, :cond_7

    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 206
    .line 207
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 208
    .line 209
    if-ne p1, v1, :cond_6

    .line 210
    .line 211
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    goto :goto_1

    .line 216
    :cond_6
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    :goto_1
    invoke-static {p1}, Ll/dk90;->d(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    goto :goto_2

    .line 228
    :cond_7
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 232
    .line 233
    invoke-static {}, Ll/xzc0;->n()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    .line 239
    .line 240
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 241
    .line 242
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 251
    .line 252
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 253
    .line 254
    if-ne v1, v2, :cond_8

    .line 255
    .line 256
    sget v1, Ll/c9c0;->C0:I

    .line 257
    .line 258
    goto :goto_4

    .line 259
    :cond_8
    sget v1, Ll/c9c0;->z0:I

    .line 260
    .line 261
    :goto_4
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 269
    .line 270
    new-instance v0, Ll/h190;

    .line 271
    .line 272
    invoke-direct {v0, p0}, Ll/h190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 273
    .line 274
    .line 275
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w0()V

    .line 279
    .line 280
    .line 281
    return-void
.end method

.method public final P0()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->N0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k190;->a()Ll/k190;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Ll/k190;->e:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->e:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->hg:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->i:Landroid/widget/RelativeLayout;

    .line 26
    .line 27
    sget v2, Ll/dbc0;->J7:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 33
    .line 34
    sget v2, Ll/dbc0;->K7:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    const-string v0, "#D659AE"

    .line 40
    .line 41
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->T0(I)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->p:Lv/VText;

    .line 49
    .line 50
    const-string v3, "#88D659AE"

    .line 51
    .line 52
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 60
    .line 61
    sget v3, Ll/dbc0;->L7:I

    .line 62
    .line 63
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 67
    .line 68
    invoke-static {v2, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 72
    .line 73
    const-string v3, "\u5979\u4e13\u4eab\u4f1a\u5458"

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 79
    .line 80
    const-string v3, "#BF499A"

    .line 81
    .line 82
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 92
    .line 93
    const-string v3, "femaleVip"

    .line 94
    .line 95
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v2, v3}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 104
    .line 105
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 113
    .line 114
    invoke-static {v2}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const/4 v1, 0x1

    .line 134
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const-string v1, "https://auto.tancdn.com/v1/raw/13b958ef-7348-4b20-b4ef-e1b293bd661114.pdf"

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v0()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$b;

    .line 153
    .line 154
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$b;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 162
    .line 163
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final Q0()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->N0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k190;->a()Ll/k190;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Ll/k190;->b:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->e:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->ig:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->i:Landroid/widget/RelativeLayout;

    .line 26
    .line 27
    sget v2, Ll/dbc0;->Di:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 33
    .line 34
    sget v2, Ll/dbc0;->Ul:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    const-string v0, "#EDD7A3"

    .line 40
    .line 41
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->T0(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->p:Lv/VText;

    .line 49
    .line 50
    const-string v2, "#88EDD7A3"

    .line 51
    .line 52
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->j:Lv/VImage;

    .line 60
    .line 61
    sget v2, Ll/dbc0;->em:I

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 72
    .line 73
    const-string v2, "\u9ed1\u91d1\u4f1a\u5458"

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 79
    .line 80
    const-string v2, "#ffdea2"

    .line 81
    .line 82
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Ll/joa;->G3()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 94
    .line 95
    if-eqz v0, :cond_0

    .line 96
    .line 97
    const-string v0, "\u5c0a\u4eab\u63a2\u63a2\u5168\u5e73\u53f0\u6743\u76ca"

    .line 98
    .line 99
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_0
    const-string v0, ""

    .line 104
    .line 105
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 111
    .line 112
    const-string v3, "oDiamond"

    .line 113
    .line 114
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v0, v3}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 123
    .line 124
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 132
    .line 133
    invoke-static {v0}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    const/4 v2, 0x1

    .line 153
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    const-string v3, "https://auto.tancdn.com/v1/raw/57ddffe4-496d-4b33-8a24-730f5b74442712.pdf"

    .line 158
    .line 159
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v0()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->K0()Lcom/tantan/library/svga/AnimListener;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 180
    .line 181
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    const/4 v3, -0x1

    .line 197
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    new-instance v4, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$f;

    .line 202
    .line 203
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$f;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    const-string v4, "https://auto.tancdn.com/v1/raw/1f20ff80-2be8-4b6b-97e3-1b386ef7ebfe13.pdf"

    .line 211
    .line 212
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 217
    .line 218
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    const-string v2, "https://auto.tancdn.com/v1/raw/ce9f0f77-ab7b-4dd7-89ae-5a70f41e19cf13.pdf"

    .line 238
    .line 239
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 244
    .line 245
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    const-string v1, "https://auto.tancdn.com/v1/raw/19fb0c0a-5ce2-4b1e-9fc7-a8f2a89b27c513.pdf"

    .line 265
    .line 266
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 271
    .line 272
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public final R0()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->N0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k190;->a()Ll/k190;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Ll/k190;->a:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->e:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->ak:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->i:Landroid/widget/RelativeLayout;

    .line 26
    .line 27
    sget v2, Ll/dbc0;->Zj:I

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 33
    .line 34
    sget v2, Ll/dbc0;->Vl:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    const-string v0, "#21252F"

    .line 40
    .line 41
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->T0(I)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->p:Lv/VText;

    .line 49
    .line 50
    const-string v3, "#88EDD7A3"

    .line 51
    .line 52
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 60
    .line 61
    invoke-static {v2, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 65
    .line 66
    const-string v3, "\u767d\u91d1\u4f1a\u5458"

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 72
    .line 73
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Ll/joa;->I3()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 85
    .line 86
    const-string v3, ""

    .line 87
    .line 88
    if-eqz v0, :cond_0

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 100
    .line 101
    const-string v2, "platinum"

    .line 102
    .line 103
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v0, v2}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 112
    .line 113
    const-string v3, "#7D8592"

    .line 114
    .line 115
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 120
    .line 121
    .line 122
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 123
    .line 124
    invoke-static {v0}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const/4 v2, 0x1

    .line 144
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const-string v3, "https://auto.tancdn.com/v1/raw/adc3cfbd-9efd-46ef-81d6-3397e9fefd0514.pdf"

    .line 149
    .line 150
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v0()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->K0()Lcom/tantan/library/svga/AnimListener;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 171
    .line 172
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    const/4 v3, -0x1

    .line 188
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    new-instance v4, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$c;

    .line 193
    .line 194
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$c;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    const-string v4, "https://auto.tancdn.com/v1/raw/c71d8162-99b7-41bc-bd6b-f90f494d102a14.pdf"

    .line 202
    .line 203
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 208
    .line 209
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    const-string v2, "https://auto.tancdn.com/v1/raw/bfed9882-bda4-4ebc-883c-95f814c1300714.pdf"

    .line 229
    .line 230
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 235
    .line 236
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    const-string v1, "https://auto.tancdn.com/v1/raw/ca3c47cd-6545-4b87-a380-a49f4774923b14.pdf"

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 262
    .line 263
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 264
    .line 265
    .line 266
    return-void
.end method

.method public final S0()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->N0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k190;->a()Ll/k190;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Ll/k190;->c:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->e:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->jg:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->Tl:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->i:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    sget v1, Ll/dbc0;->Eq:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 34
    .line 35
    sget v1, Ll/dbc0;->Wl:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Ll/c9c0;->C0:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->T0(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 54
    .line 55
    sget v1, Ll/dbc0;->Sl:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->j:Lv/VImage;

    .line 61
    .line 62
    sget v1, Ll/dbc0;->fm:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->p:Lv/VText;

    .line 68
    .line 69
    const/high16 v1, 0x3f000000    # 0.5f

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sget v2, Lcom/p1/mobile/putong/core/R$string;->W1:I

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    if-eqz v0, :cond_0

    .line 93
    .line 94
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 97
    .line 98
    const-string v2, "svip"

    .line 99
    .line 100
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v0, v2}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v0}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->O0(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 117
    .line 118
    const-string v2, ""

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 124
    .line 125
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    const/4 v2, 0x1

    .line 141
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v3, "https://auto.tancdn.com/v1/raw/dfcb3ce7-f5dc-4598-8654-4ef1487d71ed12.pdf"

    .line 146
    .line 147
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v0()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$e;

    .line 160
    .line 161
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$e;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 169
    .line 170
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    const-string v2, "https://auto.tancdn.com/v1/raw/e249dbe0-61dc-47f0-8ec2-6e81c9038d8112.pdf"

    .line 190
    .line 191
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 196
    .line 197
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    const/4 v1, -0x1

    .line 213
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    const-string v1, "https://auto.tancdn.com/v1/raw/8df9ebbd-e5a8-4750-9330-d8e055fda3e712.pdf"

    .line 218
    .line 219
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 224
    .line 225
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method public final T0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final U0()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->N0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k190;->a()Ll/k190;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Ll/k190;->d:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->e:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->kg:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->cm:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->i:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    sget v1, Ll/dbc0;->Mr:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 34
    .line 35
    sget v1, Ll/dbc0;->dm:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Ll/c9c0;->z0:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->T0(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 54
    .line 55
    sget v1, Ll/dbc0;->bm:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->j:Lv/VImage;

    .line 61
    .line 62
    sget v1, Ll/dbc0;->gm:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->p:Lv/VText;

    .line 68
    .line 69
    const/high16 v1, 0x3f000000    # 0.5f

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sget v2, Lcom/p1/mobile/putong/core/R$string;->X1:I

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-static {v1}, Ll/upl0;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->z:Z

    .line 105
    .line 106
    const/4 v1, 0x0

    .line 107
    if-eqz v0, :cond_0

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v0}, Ll/upl0;->c(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->O0(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 124
    .line 125
    const-string v2, ""

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const/4 v2, 0x1

    .line 148
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    const-string v3, "https://auto.tancdn.com/v1/raw/35b423b7-225b-49e3-a18a-df3a23371a5f13.pdf"

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v0()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$d;

    .line 167
    .line 168
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$d;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 176
    .line 177
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    const-string v1, "https://auto.tancdn.com/v1/raw/6f9fb4ca-3f6f-40db-8478-25666169c6c212.pdf"

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 203
    .line 204
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public final V0()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->N0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/k190;->a()Ll/k190;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-boolean v0, v0, Ll/k190;->f:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->e:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v1, Ll/dbc0;->lg:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->i:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    sget v1, Ll/dbc0;->Tr:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    sget v1, Ll/dbc0;->Ur:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 31
    .line 32
    .line 33
    const-string v0, "#E6639534"

    .line 34
    .line 35
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->T0(I)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->p:Lv/VText;

    .line 43
    .line 44
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 58
    .line 59
    sget v2, Ll/dbc0;->Vr:I

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 70
    .line 71
    const-string v2, "#497C19"

    .line 72
    .line 73
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 81
    .line 82
    const-string v2, "\u9752\u6625\u4e13\u4eab\u4f1a\u5458"

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 90
    .line 91
    const-string v2, "youthVip"

    .line 92
    .line 93
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v2}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0}, Ll/upl0;->d(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const/4 v1, 0x1

    .line 123
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v1, "https://auto.tancdn.com/v1/raw/287a4bf4-70c7-45a7-90f7-add77d8e3d3114.pdf"

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v0()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$a;

    .line 142
    .line 143
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 151
    .line 152
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public final X0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 8
    .line 9
    const-string v3, "femaleVip"

    .line 10
    .line 11
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/i190;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/i190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public Y0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 8
    .line 9
    const-string v3, "oDiamond"

    .line 10
    .line 11
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/g190;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/g190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public Z0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 8
    .line 9
    const-string v3, "platinum"

    .line 10
    .line 11
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/b190;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/b190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public a1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 8
    .line 9
    const-string v3, "svip"

    .line 10
    .line 11
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/f190;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/f190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public d1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/dkb;->o9()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/oyo;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/oyo;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/e190;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/e190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final e1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 8
    .line 9
    const-string v3, "youthVip"

    .line 10
    .line 11
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v2, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/j190;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/j190;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public h0(Ll/lb2;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->w:Ll/lb2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->x:Lcom/p1/mobile/putong/app/PutongFrag;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    return-void
.end method

.method public i0()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    if-ne v0, v2, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->v:Lcom/tantan/library/svga/SVGAnimationView;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u:Lcom/tantan/library/svga/SVGAnimationView;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 53
    .line 54
    .line 55
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 66
    .line 67
    .line 68
    :cond_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->A:Z

    .line 69
    .line 70
    return-void
.end method

.method public j0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->L0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->y0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->u0()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 17
    .line 18
    const/high16 v1, 0x41900000    # 18.0f

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->p:Lv/VText;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->s:Lv/VText;

    .line 28
    .line 29
    const v1, 0x3f666666    # 0.9f

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 36
    .line 37
    sget v1, Ll/qa00;->a:I

    .line 38
    .line 39
    neg-int v1, v1

    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->l:Lv/VImage;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->n:Lv/VImage;

    .line 50
    .line 51
    const/high16 v2, 0x41e00000    # 28.0f

    .line 52
    .line 53
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 61
    .line 62
    const/high16 v2, 0x40c00000    # 6.0f

    .line 63
    .line 64
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    invoke-static {v0, v3}, Ll/zll0;->a(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->f:Landroid/widget/FrameLayout;

    .line 72
    .line 73
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-static {v0, v2}, Ll/zll0;->a(Landroid/view/View;I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->t:Lv/VText;

    .line 81
    .line 82
    const/4 v2, 0x3

    .line 83
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 91
    .line 92
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->o:Lv/VText;

    .line 100
    .line 101
    const/high16 v2, 0x40400000    # 3.0f

    .line 102
    .line 103
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-static {v0, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->f:Landroid/widget/FrameLayout;

    .line 111
    .line 112
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/l190;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final v0()Lcom/tantan/library/svga/data/request/RequestCallback;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$h;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard$h;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final w0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->q:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/PrivilegeCard;->r:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
