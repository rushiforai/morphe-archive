.class public Lnrl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lo9n;
.implements Lnl5;
.implements Lcr;
.implements Lbag;


# static fields
.field public static final c:Lk2d;

.field public static final d:Lk2d;


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lk2d;

    const/16 v1, 0x12

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lnrl;->c:Lk2d;

    new-instance v0, Lk2d;

    const/16 v1, 0x13

    const/16 v3, 0x24

    invoke-direct {v0, v1, v3, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lnrl;->d:Lk2d;

    return-void
.end method

.method public constructor <init>(B)V
    .registers 5

    sparse-switch p1, :sswitch_data_48

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    return-void

    :sswitch_e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lvl9;

    invoke-direct {p1}, Lvl9;-><init>()V

    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    return-void

    :sswitch_19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    new-instance v1, Lha3;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lha3;-><init>(B)V

    invoke-direct {p1, v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    return-void

    :sswitch_2e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lnrl;->a:Z

    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    return-void

    :sswitch_3c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_48
    .sparse-switch
        0xb -> :sswitch_3c
        0x12 -> :sswitch_2e
        0x19 -> :sswitch_19
        0x1a -> :sswitch_e
    .end sparse-switch
.end method

.method public constructor <init>(Lcom/opera/android/mainmenu/ToggleAnimationView;I)V
    .registers 4

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    .line 77
    invoke-virtual {p1, p2}, Ln2d;->j(I)V

    .line 78
    new-instance p2, Lmrl;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lmrl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->u(Loll;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 74
    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 72
    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lnrl;->a:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Z)V
    .registers 3

    .line 73
    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    iput-boolean p2, p0, Lnrl;->a:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Loq4;Lode;Z)V
    .registers 4

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Lnrl;->b:Ljava/lang/Object;

    .line 81
    iput-boolean p3, p0, Lnrl;->a:Z

    return-void
.end method

.method public static M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V
    .registers 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_c
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    return-void
.end method

.method public static r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I
    .registers 3

    sget-object v0, Ltaf;->O:Ltaf;

    if-ne p0, v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget p1, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr p1, v0

    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr p1, p0

    return p1
.end method

.method public static u(Ljavax/security/auth/x500/X500Principal;)Lpq4;
    .registers 5

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Lj8o;

    invoke-virtual {p0}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Lj8o;-><init>(Ljava/lang/String;)V

    sget-object p0, Lsx2;->l:Lq0;

    invoke-virtual {v1, p0}, Lj8o;->j(Lq0;)[Lbih;

    move-result-object p0

    array-length v2, p0

    const/4 v3, 0x0

    if-lez v2, :cond_28

    aget-object p0, p0, v3

    iget-object v2, p0, Lbih;->a:Lg1;

    iget-object v2, v2, Lg1;->a:[Lx;

    array-length v2, v2

    if-lez v2, :cond_28

    invoke-virtual {p0}, Lbih;->i()Llf2;

    move-result-object p0

    iget-object p0, p0, Llf2;->b:Lx;

    invoke-static {p0}, Lfsp;->J(Lx;)Ljava/lang/String;

    move-result-object p0
    :try_end_27
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_27} :catch_46

    goto :goto_29

    :cond_28
    move-object p0, v0

    :goto_29
    :try_start_29
    sget-object v2, Lsx2;->o:Lq0;

    invoke-virtual {v1, v2}, Lj8o;->j(Lq0;)[Lbih;

    move-result-object v1

    array-length v2, v1

    if-lez v2, :cond_47

    aget-object v1, v1, v3

    iget-object v2, v1, Lbih;->a:Lg1;

    iget-object v2, v2, Lg1;->a:[Lx;

    array-length v2, v2

    if-lez v2, :cond_47

    invoke-virtual {v1}, Lbih;->i()Llf2;

    move-result-object v1

    iget-object v1, v1, Llf2;->b:Lx;

    invoke-static {v1}, Lfsp;->J(Lx;)Ljava/lang/String;

    move-result-object v0
    :try_end_45
    .catch Ljava/lang/IllegalArgumentException; {:try_start_29 .. :try_end_45} :catch_47

    goto :goto_47

    :catch_46
    move-object p0, v0

    :catch_47
    :cond_47
    :goto_47
    new-instance v1, Lpq4;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p0, v1, Lpq4;->a:Ljava/lang/String;

    iput-object v0, v1, Lpq4;->b:Ljava/lang/String;

    return-object v1
.end method


# virtual methods
.method public final A()V
    .registers 3

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lxm5;

    if-eqz v0, :cond_21

    const/4 v1, 0x1

    iput-boolean v1, p0, Lnrl;->a:Z

    iget-object v0, v0, Lxm5;->a:Ljava/lang/Object;

    check-cast v0, Llxa;

    iget-object v1, v0, Llxa;->i:Li16;

    iget-object v0, v0, Llxa;->m:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v1, v0}, Li16;->B(Z)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnrl;->a:Z

    :cond_21
    return-void
.end method

.method public B(B)V
    .registers 4

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lkgb;

    int-to-long v0, p1

    invoke-interface {p0, v0, v1}, Lkgb;->writeLong(J)V

    return-void
.end method

.method public final C(C)V
    .registers 2

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lkgb;

    invoke-interface {p0, p1}, Lkgb;->f(C)V

    return-void
.end method

.method public D(I)V
    .registers 4

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lkgb;

    int-to-long v0, p1

    invoke-interface {p0, v0, v1}, Lkgb;->writeLong(J)V

    return-void
.end method

.method public E(J)V
    .registers 3

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lkgb;

    invoke-interface {p0, p1, p2}, Lkgb;->writeLong(J)V

    return-void
.end method

.method public final F(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lkgb;

    invoke-interface {p0, p1}, Lkgb;->j(Ljava/lang/String;)V

    return-void
.end method

.method public G(S)V
    .registers 4

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lkgb;

    int-to-long v0, p1

    invoke-interface {p0, v0, v1}, Lkgb;->writeLong(J)V

    return-void
.end method

.method public H(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lkgb;

    invoke-interface {p0, p1}, Lkgb;->i(Ljava/lang/String;)V

    return-void
.end method

.method public final I(Ljava/math/BigInteger;)Ljava/math/BigInteger;
    .registers 9

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lgih;

    instance-of v1, v0, Lhih;

    if-eqz v1, :cond_72

    check-cast v0, Lhih;

    iget-object v1, v0, Lhih;->f:Ljava/math/BigInteger;

    if-nez v1, :cond_20

    const-string v2, "org.bouncycastle.rsa.no_lenstra_check"

    invoke-static {v2}, Lq5h;->c(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_20

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lgih;

    iget-object v1, v0, Lgih;->c:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Lgih;->k(Ljava/math/BigInteger;)V

    goto :goto_72

    :cond_20
    iget-object p0, v0, Lhih;->g:Ljava/math/BigInteger;

    invoke-virtual {v0, p0}, Lgih;->k(Ljava/math/BigInteger;)V

    iget-object v2, v0, Lhih;->h:Ljava/math/BigInteger;

    invoke-virtual {v0, v2}, Lgih;->k(Ljava/math/BigInteger;)V

    iget-object v3, v0, Lhih;->i:Ljava/math/BigInteger;

    invoke-virtual {v0, v3}, Lgih;->k(Ljava/math/BigInteger;)V

    iget-object v4, v0, Lhih;->j:Ljava/math/BigInteger;

    invoke-virtual {v0, v4}, Lgih;->k(Ljava/math/BigInteger;)V

    iget-object v5, v0, Lhih;->k:Ljava/math/BigInteger;

    invoke-virtual {v0, v5}, Lgih;->k(Ljava/math/BigInteger;)V

    invoke-virtual {p1, p0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6, v3, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {p1, v2}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {v6, v4, v2}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    if-eqz v1, :cond_71

    iget-object v0, v0, Lgih;->b:Ljava/math/BigInteger;

    invoke-virtual {p0, v1, v0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_71

    const-string p0, "RSA engine faulty decryption/signing detected"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    :cond_71
    return-object p0

    :cond_72
    :goto_72
    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lgih;

    iget-object v1, v0, Lgih;->c:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Lgih;->k(Ljava/math/BigInteger;)V

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lgih;

    iget-object p0, p0, Lgih;->b:Ljava/math/BigInteger;

    invoke-virtual {p1, v1, p0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method public final J(Ljava/lang/Object;Lbbb;)V
    .registers 5

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean p0, p0, Lnrl;->a:Z

    if-eqz p0, :cond_14

    invoke-interface {p2}, Lbbb;->onDestroy()V

    :cond_14
    return-void

    :cond_15
    const-string p0, "Another instance is already associated with the key: "

    invoke-static {p1, p0}, Lrfp;->o(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt14;->c(Ljava/lang/Object;)V

    return-void
.end method

.method public final K()V
    .registers 2

    iget-boolean v0, p0, Lnrl;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrl;->a:Z

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lvl9;

    invoke-virtual {p0}, Lvl9;->run()V

    return-void
.end method

.method public final declared-synchronized L(Lkyh;Z)V
    .registers 5

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lnrl;->a:Z

    const/4 v1, 0x1

    if-nez v0, :cond_11

    if-nez p2, :cond_11

    iput-boolean v1, p0, Lnrl;->a:Z

    invoke-interface {p1}, Lkyh;->d()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lnrl;->a:Z

    goto :goto_1c

    :cond_11
    iget-object p2, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p2, Landroid/os/Handler;

    invoke-virtual {p2, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_20

    :goto_1c
    monitor-exit p0

    return-void

    :goto_1e
    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_20

    throw p1

    :catchall_20
    move-exception p1

    goto :goto_1e
.end method

.method public N()V
    .registers 1

    return-void
.end method

.method public O()V
    .registers 1

    return-void
.end method

.method public final P(Z)V
    .registers 23

    move-object/from16 v0, p0

    iget-object v1, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v1, Lvbf;

    iget-object v2, v1, Lvbf;->v:Lkze;

    iget-object v3, v1, Lvbf;->r:Lqfb;

    iget-object v4, v1, Lvbf;->q:Lv73;

    iget-object v5, v1, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v6, v1, Lvbf;->t:Ltbf;

    iget-boolean v7, v1, Lvbf;->p:Z

    const/4 v8, 0x1

    if-eqz v7, :cond_1e

    iget-object v7, v6, Ltbf;->b:Lypm;

    iget-boolean v7, v7, Lypm;->k:Z

    if-eqz v7, :cond_1e

    iput-boolean v8, v0, Lnrl;->a:Z

    return-void

    :cond_1e
    iget-boolean v7, v0, Lnrl;->a:Z

    const/4 v9, 0x0

    if-eqz v7, :cond_27

    iput-boolean v9, v0, Lnrl;->a:Z

    move v0, v9

    goto :goto_29

    :cond_27
    move/from16 v0, p1

    :goto_29
    invoke-virtual {v1}, Lvbf;->p()Z

    move-result v7

    if-nez v7, :cond_32

    invoke-virtual {v1}, Lvbf;->l()V

    :cond_32
    iget-object v7, v6, Ltbf;->b:Lypm;

    iget-object v7, v7, Lypm;->c:Ljava/lang/String;

    const-wide/16 v10, 0x440

    invoke-virtual {v6, v10, v11}, Ltbf;->b(J)Z

    move-result v10

    const/4 v11, 0x0

    if-nez v10, :cond_42

    iput-object v7, v5, Lcom/opera/android/widget/UrlFieldEditText;->a0:Ljava/lang/String;

    goto :goto_44

    :cond_42
    iput-object v11, v5, Lcom/opera/android/widget/UrlFieldEditText;->a0:Ljava/lang/String;

    :goto_44
    iget-object v7, v4, Lv73;->a:Ljava/util/EnumMap;

    sget-object v10, Ltaf;->a:Ltaf;

    invoke-virtual {v7, v10}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Luaf;

    iget-object v10, v4, Lv73;->d:Llg;

    invoke-virtual {v10}, Llg;->b()Leri;

    move-result-object v10

    iget-object v12, v4, Lv73;->b:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    instance-of v14, v10, Lf1a;

    if-eqz v14, :cond_61

    const/high16 v14, 0x42000000    # 32.0f

    goto :goto_63

    :cond_61
    const/high16 v14, 0x41e00000    # 28.0f

    :goto_63
    invoke-static {v14, v13}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v13

    invoke-static {v10, v12, v13}, Leti;->c(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v10

    iput-object v10, v7, Luaf;->e:Landroid/graphics/drawable/Drawable;

    iget-object v12, v7, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v12, v8, v10}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    iget-object v12, v7, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v12}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result v12

    invoke-virtual {v10, v12, v9}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object v7, v7, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    iget-object v7, v1, Lvbf;->J:Ligi;

    iget-object v10, v6, Ltbf;->f:Ljava/util/List;

    iget-object v12, v7, Ligi;->g:Ljava/lang/Object;

    check-cast v12, Ljava/util/List;

    invoke-static {v12, v10}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_93

    iput-object v10, v7, Ligi;->g:Ljava/lang/Object;

    invoke-virtual {v7}, Ligi;->A0()V

    :cond_93
    new-instance v7, Lro9;

    const/16 v10, 0x17

    invoke-direct {v7, v10}, Lro9;-><init>(B)V

    iget-object v10, v7, Lro9;->d:Ljava/lang/Object;

    check-cast v10, Ljava/util/LinkedHashSet;

    invoke-static {}, Lvaf;->values()[Lvaf;

    move-result-object v12

    array-length v13, v12

    move v14, v9

    :goto_a4
    if-ge v14, v13, :cond_19b

    aget-object v15, v12, v14

    move/from16 v16, v8

    invoke-virtual {v3, v15}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v8

    iget-object v11, v1, Lvbf;->u:Lwaf;

    invoke-interface {v11, v15}, Lwaf;->i(Lvaf;)Ltaf;

    move-result-object v11

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v17, Lv73;->m:Lnrl;

    invoke-virtual {v15}, Ljava/lang/Enum;->ordinal()I

    move-result v18

    sget-object v9, Ltaf;->O:Ltaf;

    packed-switch v18, :pswitch_data_2f8

    :goto_c2
    move/from16 p1, v0

    move-object/from16 v0, v17

    move-object/from16 v17, v5

    goto :goto_d8

    :pswitch_c9
    invoke-virtual {v4, v6, v7}, Lv73;->h(Ltbf;Lro9;)Lnrl;

    move-result-object v17

    goto :goto_c2

    :pswitch_ce
    invoke-virtual {v4, v6}, Lv73;->g(Ltbf;)Lnrl;

    move-result-object v17

    goto :goto_c2

    :pswitch_d3
    invoke-virtual {v4, v6, v7}, Lv73;->m(Ltbf;Lro9;)Lnrl;

    move-result-object v17

    goto :goto_c2

    :goto_d8
    iget-object v5, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v5, Ltaf;

    iget-boolean v0, v0, Lnrl;->a:Z

    invoke-virtual {v4, v6, v5, v0}, Lv73;->f(Ltbf;Ltaf;I)Lbp;

    move-result-object v0

    goto :goto_129

    :pswitch_e3
    move/from16 p1, v0

    move-object/from16 v17, v5

    sget-object v0, Ltaf;->M:Ltaf;

    invoke-interface {v10, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_f9

    iget-object v5, v6, Ltbf;->f:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f9

    :goto_f7
    const/4 v5, 0x0

    goto :goto_fb

    :cond_f9
    move-object v0, v9

    goto :goto_f7

    :goto_fb
    invoke-virtual {v4, v6, v0, v5}, Lv73;->f(Ltbf;Ltaf;I)Lbp;

    move-result-object v0

    goto :goto_129

    :pswitch_100
    move/from16 p1, v0

    move-object/from16 v17, v5

    const/4 v5, 0x0

    invoke-virtual {v4, v6, v7}, Lv73;->i(Ltbf;Lro9;)Ltaf;

    move-result-object v0

    invoke-virtual {v4, v6, v0, v5}, Lv73;->f(Ltbf;Ltaf;I)Lbp;

    move-result-object v0

    goto :goto_129

    :pswitch_10e
    move/from16 p1, v0

    move-object/from16 v17, v5

    const/4 v5, 0x0

    invoke-virtual {v4, v6}, Lv73;->j(Ltbf;)Ltaf;

    move-result-object v0

    invoke-virtual {v4, v6, v0, v5}, Lv73;->f(Ltbf;Ltaf;I)Lbp;

    move-result-object v0

    goto :goto_129

    :pswitch_11c
    move/from16 p1, v0

    move-object/from16 v17, v5

    const/4 v5, 0x0

    invoke-virtual {v4, v6}, Lv73;->n(Ltbf;)Ltaf;

    move-result-object v0

    invoke-virtual {v4, v6, v0, v5}, Lv73;->f(Ltbf;Ltaf;I)Lbp;

    move-result-object v0

    :goto_129
    iget-object v5, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v5, Luaf;

    move-object/from16 v18, v4

    if-eqz p1, :cond_152

    iget-object v4, v5, Luaf;->a:Ltaf;

    move-object/from16 v19, v12

    sget-object v12, Ltaf;->e:Ltaf;

    move/from16 v20, v13

    sget-object v13, Ltaf;->d:Ltaf;

    if-ne v11, v13, :cond_13f

    if-eq v4, v12, :cond_156

    :cond_13f
    if-ne v11, v12, :cond_143

    if-eq v4, v13, :cond_156

    :cond_143
    sget-object v12, Ltaf;->j:Ltaf;

    sget-object v13, Ltaf;->k:Ltaf;

    if-ne v11, v13, :cond_14b

    if-eq v4, v12, :cond_156

    :cond_14b
    if-ne v11, v12, :cond_14f

    if-eq v4, v13, :cond_156

    :cond_14f
    move/from16 v4, v16

    goto :goto_157

    :cond_152
    move-object/from16 v19, v12

    move/from16 v20, v13

    :cond_156
    const/4 v4, 0x0

    :goto_157
    invoke-virtual {v8, v0, v4}, Lcom/opera/android/bar/OmniButtonView;->f(Lbp;Z)V

    iget-object v0, v8, Lcom/opera/android/bar/OmniButtonView;->e:Lbp;

    if-nez v0, :cond_164

    iget-object v0, v8, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-nez v0, :cond_164

    iget-object v0, v8, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    :cond_164
    if-eqz v0, :cond_16d

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget v0, v0, Luaf;->o:I

    goto :goto_16e

    :cond_16d
    const/4 v0, 0x0

    :goto_16e
    if-nez v0, :cond_172

    iget v0, v8, Lcom/opera/android/bar/OmniButtonView;->b:I

    :cond_172
    invoke-static {v0, v8}, Lp37;->t0(ILandroid/view/View;)V

    iget-object v0, v5, Luaf;->a:Ltaf;

    if-eq v0, v9, :cond_17f

    iget v4, v7, Lro9;->b:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v7, Lro9;->b:I

    :cond_17f
    invoke-interface {v10, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, v7, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    iget-object v4, v5, Luaf;->a:Ltaf;

    invoke-interface {v0, v15, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v14, v14, 0x1

    move/from16 v0, p1

    move/from16 v8, v16

    move-object/from16 v5, v17

    move-object/from16 v4, v18

    move-object/from16 v12, v19

    move/from16 v13, v20

    goto/16 :goto_a4

    :cond_19b
    move/from16 p1, v0

    move-object/from16 v17, v5

    move/from16 v16, v8

    iget v0, v1, Lvbf;->B:I

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->isLaidOut()Z

    move-result v4

    if-nez v4, :cond_1b0

    iget-object v4, v1, Lvbf;->n:Lcom/opera/android/bar/OmniBoxRoot;

    invoke-virtual {v4}, Lcom/opera/android/bar/OmniBoxRoot;->d()V

    const/4 v4, 0x0

    goto :goto_1b2

    :cond_1b0
    move/from16 v4, p1

    :goto_1b2
    sget-object v5, Lvaf;->c:Lvaf;

    invoke-virtual {v7, v5}, Lro9;->i(Lvaf;)Ltaf;

    move-result-object v8

    invoke-virtual {v3, v5}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v5

    invoke-static {v8, v5}, Lnrl;->r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I

    move-result v5

    sget-object v8, Lvaf;->d:Lvaf;

    invoke-virtual {v7, v8}, Lro9;->i(Lvaf;)Ltaf;

    move-result-object v9

    invoke-virtual {v3, v8}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v8

    invoke-static {v9, v8}, Lnrl;->r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I

    move-result v8

    iget v9, v1, Lvbf;->C:I

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    add-int/2addr v8, v5

    sget-object v5, Lvaf;->b:Lvaf;

    invoke-virtual {v7, v5}, Lro9;->i(Lvaf;)Ltaf;

    move-result-object v9

    invoke-virtual {v3, v5}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v5

    invoke-static {v9, v5}, Lnrl;->r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I

    move-result v5

    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    sget-object v8, Lvaf;->e:Lvaf;

    invoke-virtual {v7, v8}, Lro9;->i(Lvaf;)Ltaf;

    move-result-object v9

    invoke-virtual {v3, v8}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v8

    invoke-static {v9, v8}, Lnrl;->r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I

    move-result v8

    add-int/2addr v8, v5

    sget-object v5, Lvaf;->f:Lvaf;

    invoke-virtual {v7, v5}, Lro9;->i(Lvaf;)Ltaf;

    move-result-object v9

    invoke-virtual {v3, v5}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v5

    invoke-static {v9, v5}, Lnrl;->r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I

    move-result v5

    sget-object v9, Lvaf;->g:Lvaf;

    invoke-virtual {v7, v9}, Lro9;->i(Lvaf;)Ltaf;

    move-result-object v11

    invoke-virtual {v3, v9}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v9

    invoke-static {v11, v9}, Lnrl;->r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I

    move-result v9

    sget-object v11, Lvaf;->h:Lvaf;

    invoke-virtual {v7, v11}, Lro9;->i(Lvaf;)Ltaf;

    move-result-object v12

    invoke-virtual {v3, v11}, Lqfb;->b(Lvaf;)Lcom/opera/android/bar/OmniButtonView;

    move-result-object v3

    invoke-static {v12, v3}, Lnrl;->r(Ltaf;Lcom/opera/android/bar/OmniButtonView;)I

    move-result v3

    add-int/2addr v3, v9

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-object v5, v1, Lvbf;->w:Ljl6;

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v8

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v3, v5, Ljl6;->b:I

    iget-object v9, v5, Ljl6;->d:Ljava/lang/Object;

    check-cast v9, Lcom/opera/android/widget/UrlFieldEditText;

    if-ne v3, v8, :cond_23d

    iget v3, v5, Ljl6;->c:I

    if-ne v3, v0, :cond_23d

    if-nez v4, :cond_2d3

    :cond_23d
    iget-object v3, v5, Ljl6;->e:Ljava/lang/Object;

    check-cast v3, Landroid/animation/AnimatorSet;

    if-eqz v3, :cond_24e

    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->cancel()V

    const/4 v3, 0x0

    iput-object v3, v5, Ljl6;->e:Ljava/lang/Object;

    iput-object v3, v5, Ljl6;->f:Ljava/lang/Object;

    iput-object v3, v5, Ljl6;->g:Ljava/lang/Object;

    goto :goto_24f

    :cond_24e
    const/4 v3, 0x0

    :goto_24f
    iput v8, v5, Ljl6;->b:I

    iput v0, v5, Ljl6;->c:I

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Li2c;

    invoke-virtual {v11}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v11

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Li2c;

    invoke-virtual {v12}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v12

    if-ne v11, v8, :cond_26b

    if-eq v12, v0, :cond_2d3

    :cond_26b
    if-nez v4, :cond_27d

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Li2c;

    invoke-virtual {v3, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v3, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    invoke-virtual {v9, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2d3

    :cond_27d
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v13, 0x96

    invoke-virtual {v4, v13, v14}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    sget-object v9, Llf1;->l:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v4, v9}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    if-eq v11, v8, :cond_2aa

    filled-new-array {v11, v8}, [I

    move-result-object v3

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v3

    iput-object v3, v5, Ljl6;->f:Ljava/lang/Object;

    new-instance v8, Lvpm;

    const/4 v9, 0x0

    invoke-direct {v8, v5, v9}, Lvpm;-><init>(Ljl6;B)V

    invoke-virtual {v3, v8}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v3, v5, Ljl6;->f:Ljava/lang/Object;

    check-cast v3, Landroid/animation/ValueAnimator;

    invoke-virtual {v4, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v11

    goto :goto_2ab

    :cond_2aa
    move-object v11, v3

    :goto_2ab
    if-eq v12, v0, :cond_2ce

    filled-new-array {v12, v0}, [I

    move-result-object v0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, v5, Ljl6;->g:Ljava/lang/Object;

    new-instance v3, Lvpm;

    move/from16 v8, v16

    invoke-direct {v3, v5, v8}, Lvpm;-><init>(Ljl6;B)V

    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, v5, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Landroid/animation/ValueAnimator;

    if-eqz v11, :cond_2cb

    invoke-virtual {v11, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    goto :goto_2ce

    :cond_2cb
    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    :cond_2ce
    :goto_2ce
    iput-object v4, v5, Ljl6;->e:Ljava/lang/Object;

    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    :cond_2d3
    :goto_2d3
    iput-object v7, v1, Lvbf;->u:Lwaf;

    const-wide/16 v0, 0x4000

    invoke-virtual {v6, v0, v1}, Ltbf;->b(J)Z

    move-result v0

    if-nez v0, :cond_2e0

    sget-object v0, Lpeg;->a:Lpeg;

    goto :goto_2ed

    :cond_2e0
    sget-object v0, Ltaf;->N:Ltaf;

    invoke-interface {v10, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2eb

    sget-object v0, Lpeg;->b:Lpeg;

    goto :goto_2ed

    :cond_2eb
    sget-object v0, Lpeg;->c:Lpeg;

    :goto_2ed
    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v0, :cond_2f6

    invoke-virtual {v2, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_2f6
    return-void

    nop

    :pswitch_data_2f8
    .packed-switch 0x0
        :pswitch_11c
        :pswitch_10e
        :pswitch_100
        :pswitch_e3
        :pswitch_d3
        :pswitch_ce
        :pswitch_c9
    .end packed-switch
.end method

.method public final Q(Lkq4;)V
    .registers 9

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Loq4;

    iget-object v1, p1, Lkq4;->b:Landroid/net/http/SslCertificate;

    iget-object v2, p1, Lkq4;->a:Ljava/security/cert/X509Certificate;

    invoke-virtual {v1}, Landroid/net/http/SslCertificate;->getIssuedTo()Landroid/net/http/SslCertificate$DName;

    move-result-object v3

    iget-boolean p0, p0, Lnrl;->a:Z

    if-eqz p0, :cond_26

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v4

    invoke-static {v4}, Lnrl;->u(Ljavax/security/auth/x500/X500Principal;)Lpq4;

    move-result-object v4

    iget-object v5, v0, Loq4;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v6, v4, Lpq4;->a:Ljava/lang/String;

    invoke-static {v5, v6}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v5, v0, Loq4;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v4, v4, Lpq4;->b:Ljava/lang/String;

    invoke-static {v5, v4}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    :cond_26
    iget-object v4, v0, Loq4;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3}, Landroid/net/http/SslCertificate$DName;->getCName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v4, v0, Loq4;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3}, Landroid/net/http/SslCertificate$DName;->getOName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v4, v0, Loq4;->n:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3}, Landroid/net/http/SslCertificate$DName;->getUName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v3

    iget-object v4, v0, Loq4;->o:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 v5, 0x3a

    invoke-static {v3, v5}, La26;->G([BC)Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/net/http/SslCertificate;->getIssuedBy()Landroid/net/http/SslCertificate$DName;

    move-result-object v3

    if-eqz p0, :cond_70

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object p0

    invoke-static {p0}, Lnrl;->u(Ljavax/security/auth/x500/X500Principal;)Lpq4;

    move-result-object p0

    iget-object v4, v0, Loq4;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, p0, Lpq4;->a:Ljava/lang/String;

    invoke-static {v4, v5}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v4, v0, Loq4;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p0, p0, Lpq4;->b:Ljava/lang/String;

    invoke-static {v4, p0}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    :cond_70
    iget-object p0, v0, Loq4;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3}, Landroid/net/http/SslCertificate$DName;->getCName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object p0, v0, Loq4;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3}, Landroid/net/http/SslCertificate$DName;->getOName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object p0, v0, Loq4;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3}, Landroid/net/http/SslCertificate$DName;->getUName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    const/4 p0, 0x2

    invoke-static {p0}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v3

    iget-object v4, v0, Loq4;->s:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/net/http/SslCertificate;->getValidNotBeforeDate()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v4, v0, Loq4;->r:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Landroid/net/http/SslCertificate;->getValidNotAfterDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v1, v0, Loq4;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lkq4;->c:[B

    const/16 v4, 0x20

    invoke-static {v3, v4}, La26;->G([BC)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v1, v0, Loq4;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p1, Lkq4;->d:[B

    invoke-static {p1, v4}, La26;->G([BC)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :try_start_c7
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;

    move-result-object v1
    :try_end_cb
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_c7 .. :try_end_cb} :catch_cc

    goto :goto_cd

    :catch_cc
    const/4 v1, 0x0

    :goto_cd
    const/4 v2, 0x0

    if-eqz v1, :cond_11a

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_11a

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_da
    :goto_da
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_11a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_da

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-ne v4, p0, :cond_da

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Ljava/lang/Integer;

    if-eqz v4, :cond_da

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/String;

    if-eqz v5, :cond_da

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v5, p0, :cond_10e

    const/4 v6, 0x7

    if-ne v5, v6, :cond_da

    :cond_10e
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_da

    :cond_11a
    iget-object p0, v0, Loq4;->q:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const-string v1, "\n"

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lnrl;->M(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    iget-object p1, v0, Loq4;->b:Landroid/widget/TextView;

    if-nez p0, :cond_131

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_136

    :cond_131
    const/16 p0, 0x8

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    :goto_136
    return-void
.end method

.method public final a(I)V
    .registers 4

    iget-boolean v0, p0, Lnrl;->a:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-static {v0}, Lz4o;->H(Z)V

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseBooleanArray;

    invoke-virtual {p0, p1, v1}, Landroid/util/SparseBooleanArray;->append(IZ)V

    return-void
.end method

.method public final b(I)V
    .registers 3

    iget-boolean v0, p0, Lnrl;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrl;->a:Z

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lnl5;

    invoke-interface {p0, p1}, Lnl5;->b(I)V

    return-void
.end method

.method public final c(Lw69;)V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p1, Lw69;->a:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_13

    invoke-virtual {p1, v0}, Lw69;->b(I)I

    move-result v1

    invoke-virtual {p0, v1}, Lnrl;->a(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_13
    return-void
.end method

.method public d(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 3

    iget-boolean v0, p0, Lnrl;->a:Z

    if-eqz v0, :cond_9

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x0

    return-object p0

    :cond_9
    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lvl9;

    invoke-virtual {p0, p1}, Lvl9;->a(Ljava/lang/Runnable;)V

    return-object p1
.end method

.method public final e(ILandroid/view/View;)V
    .registers 6

    invoke-virtual {p2}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-nez v0, :cond_c

    const/16 p0, 0x8

    invoke-virtual {p2, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_c
    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lc48;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p2, p0}, Lc48;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final f(ILandroid/view/View;)V
    .registers 6

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lc48;

    const/4 v1, 0x5

    invoke-direct {v0, v1, p2, p0}, Lc48;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final h(Lxba;)V
    .registers 9

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lxm5;

    if-eqz v0, :cond_60

    const/4 v1, 0x1

    iput-boolean v1, p0, Lnrl;->a:Z

    iget-object v0, v0, Lxm5;->a:Ljava/lang/Object;

    check-cast v0, Llxa;

    iget-object v0, v0, Llxa;->t:Ldya;

    iget-object v2, p1, Lxba;->b:Landroid/os/Parcelable;

    const/4 v3, 0x0

    if-eqz v2, :cond_5e

    instance-of v4, v2, Lfya;

    if-eqz v4, :cond_35

    iget-object p1, p1, Lxba;->a:Lwba;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_2f

    if-eq p1, v1, :cond_29

    const/4 v0, 0x2

    if-eq p1, v0, :cond_5e

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_29
    check-cast v2, Lfya;

    invoke-virtual {v0, v2}, Ldya;->c(Lfya;)V

    goto :goto_5e

    :cond_2f
    check-cast v2, Lfya;

    invoke-virtual {v0, v2}, Ldya;->b(Lfya;)V

    goto :goto_5e

    :cond_35
    instance-of p1, v2, Lcya;

    if-eqz p1, :cond_5e

    check-cast v2, Lcya;

    iget-object p1, v0, Ldya;->d:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v3

    :cond_42
    if-ge v1, v0, :cond_56

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    move-object v5, v4

    check-cast v5, Lfya;

    iget-object v6, v2, Lcya;->a:Lfya;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_42

    goto :goto_57

    :cond_56
    const/4 v4, 0x0

    :goto_57
    check-cast v4, Lfya;

    if-eqz v4, :cond_5e

    invoke-virtual {v4, v2}, Lfya;->a(Lcya;)V

    :cond_5e
    :goto_5e
    iput-boolean v3, p0, Lnrl;->a:Z

    :cond_60
    return-void
.end method

.method public final i(Z)V
    .registers 2

    return-void
.end method

.method public final j()Lw69;
    .registers 3

    iget-boolean v0, p0, Lnrl;->a:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-static {v0}, Lz4o;->H(Z)V

    iput-boolean v1, p0, Lnrl;->a:Z

    new-instance v0, Lw69;

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0, p0}, Lw69;-><init>(Landroid/util/SparseBooleanArray;)V

    return-object v0
.end method

.method public final k()V
    .registers 2

    iget-boolean v0, p0, Lnrl;->a:Z

    if-nez v0, :cond_2b

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrl;->a:Z

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbbb;

    invoke-interface {v0}, Lbbb;->onDestroy()V

    goto :goto_1b

    :cond_2b
    return-void
.end method

.method public final l(Landroid/net/Uri;II)Landroid/graphics/Bitmap;
    .registers 10

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    new-instance v5, Lg2f;

    invoke-direct {v5, p1}, Lg2f;-><init>(Landroid/net/Uri;)V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v0, Lf2f;

    move-object v1, p0

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lf2f;-><init>(Lnrl;Ljava/lang/String;IILg2f;)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    iget-object p0, v5, Lg2f;->k:Landroid/os/ConditionVariable;

    iget-wide p1, v5, Lg2f;->m:J

    invoke-virtual {p0, p1, p2}, Landroid/os/ConditionVariable;->block(J)Z

    iget-boolean p0, v1, Lnrl;->a:Z

    if-nez p0, :cond_29

    iget-object p0, v5, Lg2f;->l:Landroid/graphics/Bitmap;

    if-eqz p0, :cond_29

    const/4 p0, 0x0

    goto :goto_2a

    :cond_29
    const/4 p0, 0x1

    :goto_2a
    iput-boolean p0, v1, Lnrl;->a:Z

    iget-object p0, v5, Lg2f;->l:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public final m(Landroid/view/View;Lg3o;Lsv2;)Lg3o;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    iget v4, v3, Lsv2;->a:I

    iget v5, v3, Lsv2;->b:I

    iget-object v6, v2, Lg3o;->a:Ld3o;

    const/16 v7, 0x207

    invoke-virtual {v6, v7}, Ld3o;->i(I)Lr9b;

    move-result-object v7

    const/16 v8, 0x20

    invoke-virtual {v6, v8}, Ld3o;->i(I)Lr9b;

    move-result-object v6

    iget-object v8, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-boolean v9, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->p:Z

    iget v10, v7, Lr9b;->b:I

    iget v11, v7, Lr9b;->c:I

    iget v12, v7, Lr9b;->a:I

    iput v10, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->x:I

    invoke-virtual {v1}, Landroid/view/View;->getLayoutDirection()I

    move-result v10

    const/4 v14, 0x1

    if-ne v10, v14, :cond_31

    move v10, v14

    goto :goto_32

    :cond_31
    const/4 v10, 0x0

    :goto_32
    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v15

    invoke-virtual {v1}, Landroid/view/View;->getPaddingLeft()I

    move-result v16

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v17

    if-eqz v9, :cond_49

    invoke-virtual {v2}, Lg3o;->a()I

    move-result v15

    iput v15, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->w:I

    iget v3, v3, Lsv2;->c:I

    add-int/2addr v15, v3

    :cond_49
    iget-boolean v3, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->q:Z

    if-eqz v3, :cond_54

    if-eqz v10, :cond_51

    move v3, v5

    goto :goto_52

    :cond_51
    move v3, v4

    :goto_52
    add-int v16, v3, v12

    :cond_54
    move/from16 v3, v16

    iget-boolean v13, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->r:Z

    if-eqz v13, :cond_5f

    if-nez v10, :cond_5d

    move v4, v5

    :cond_5d
    add-int v17, v4, v11

    :cond_5f
    move/from16 v4, v17

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-boolean v10, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->t:Z

    if-eqz v10, :cond_73

    iget v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    if-eq v10, v12, :cond_73

    iput v12, v5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    move v13, v14

    goto :goto_74

    :cond_73
    const/4 v13, 0x0

    :goto_74
    iget-boolean v10, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:Z

    if-eqz v10, :cond_7f

    iget v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-eq v10, v11, :cond_7f

    iput v11, v5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    move v13, v14

    :cond_7f
    iget-boolean v10, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->v:Z

    if-eqz v10, :cond_8c

    iget v10, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v7, v7, Lr9b;->b:I

    if-eq v10, v7, :cond_8c

    iput v7, v5, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_8d

    :cond_8c
    move v14, v13

    :goto_8d
    if-eqz v14, :cond_92

    invoke-virtual {v1, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_92
    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    invoke-virtual {v1, v3, v5, v4, v15}, Landroid/view/View;->setPadding(IIII)V

    iget-boolean v0, v0, Lnrl;->a:Z

    if-eqz v0, :cond_a1

    iget v1, v6, Lr9b;->d:I

    iput v1, v8, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->n:I

    :cond_a1
    if-nez v9, :cond_a6

    if-nez v0, :cond_a6

    return-object v2

    :cond_a6
    invoke-virtual {v8}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->T()V

    return-object v2
.end method

.method public final q(Z)V
    .registers 4

    iget-boolean v0, p0, Lnrl;->a:Z

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lnrl;->a:Z

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lbu8;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const-class v0, Landroid/webkit/WebView;

    if-eqz p1, :cond_1c

    new-instance p1, Lyt7;

    const/16 v1, 0x11

    invoke-direct {p1, v1}, Lyt7;-><init>(B)V

    invoke-static {p0, v0, p1}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    return-void

    :cond_1c
    new-instance p1, Lyt7;

    const/16 v1, 0x12

    invoke-direct {p1, v1}, Lyt7;-><init>(B)V

    invoke-static {p0, v0, p1}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    return-void
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Ldx3;

    const/4 v1, 0x0

    iget-boolean p0, p0, Lnrl;->a:Z

    invoke-static {v0, v1, p0}, Lolh;->a(Ldx3;ZZ)V

    return-void
.end method

.method public final t()V
    .registers 3

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Ldx3;

    const/4 v1, 0x1

    iget-boolean p0, p0, Lnrl;->a:Z

    invoke-static {v0, v1, p0}, Lolh;->a(Ldx3;ZZ)V

    return-void
.end method

.method public final v()I
    .registers 2

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lgih;

    iget-object v0, v0, Lgih;->b:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    iget-boolean p0, p0, Lnrl;->a:Z

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    if-eqz p0, :cond_13

    return v0

    :cond_13
    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public final w()Landroid/graphics/BitmapShader;
    .registers 5

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Lbcd;

    if-eqz p0, :cond_32

    iget-object v0, p0, Lbcd;->f:Landroid/graphics/BitmapShader;

    if-nez v0, :cond_31

    iget v0, p0, Lbcd;->d:I

    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v0, v1}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_27

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, p0, Lbcd;->c:Landroid/graphics/Path;

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_27
    new-instance v1, Landroid/graphics/BitmapShader;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lbcd;->f:Landroid/graphics/BitmapShader;

    return-object v1

    :cond_31
    return-object v0

    :cond_32
    const/4 p0, 0x0

    return-object p0
.end method

.method public x()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnrl;->a:Z

    return-void
.end method

.method public y()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnrl;->a:Z

    return-void
.end method

.method public z()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnrl;->a:Z

    return-void
.end method
