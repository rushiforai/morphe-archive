.class public final Ljb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/components/signin/AccountManagerFacade;
.implements Lbag;


# instance fields
.field public a:I

.field public b:Z

.field public c:I

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/io/Serializable;

.field public final g:Ljava/io/Serializable;

.field public final h:Ljava/io/Serializable;

.field public i:Ljava/lang/Object;

.field public j:Ljava/lang/Object;


# direct methods
.method public constructor <init>(La4f;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ljb;->e:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Ljb;->f:Ljava/io/Serializable;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Ljb;->g:Ljava/io/Serializable;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Ljb;->h:Ljava/io/Serializable;

    new-instance v0, Ls14;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Ls14;-><init>(B)V

    iput-object v0, p0, Ljb;->i:Ljava/lang/Object;

    iput-object p1, p0, Ljb;->d:Ljava/lang/Object;

    sget-object p1, Ltjj;->c:Lp74;

    invoke-virtual {p1}, Lp74;->b()Z

    move-result p1

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_3f

    new-instance p1, Lhb;

    invoke-direct {p1, p0, v2}, Lhb;-><init>(Ljb;B)V

    sget-object v3, Lfe2;->f:Le2j;

    invoke-virtual {p1, v3}, Lfe2;->b(Loxc;)V

    goto :goto_49

    :cond_3f
    new-instance p1, Lhb;

    invoke-direct {p1, p0, v0}, Lhb;-><init>(Ljb;B)V

    sget-object v3, Lfe2;->f:Le2j;

    invoke-virtual {p1, v3}, Lfe2;->b(Loxc;)V

    :goto_49
    new-instance p1, Ln9a;

    new-instance v4, Lwa;

    invoke-direct {v4, p0, v2}, Lwa;-><init>(Ljava/lang/Object;B)V

    const/16 v5, 0xe

    invoke-direct {p1, v5}, Ln9a;-><init>(B)V

    new-instance v5, Ltb;

    invoke-direct {v5, p1, v4, v0}, Ltb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v6, Lt8;->a:Landroid/content/Context;

    new-instance v7, Landroid/content/IntentFilter;

    const-string v8, "android.intent.action.APPLICATION_RESTRICTIONS_CHANGED"

    invoke-direct {v7, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {v6, v5, v7}, Lt8;->Q(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-instance v5, Ls14;

    invoke-direct {v5, v1}, Ls14;-><init>(B)V

    new-instance v1, Lib;

    invoke-direct {v1, p1, v5, v2}, Lib;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Lfe2;->b(Loxc;)V

    invoke-virtual {v5, v4}, Ls14;->L(Lorg/chromium/base/Callback;)V

    iget-object p0, p0, Ljb;->i:Ljava/lang/Object;

    check-cast p0, Ls14;

    new-instance p1, Lfb;

    invoke-direct {p1, v0}, Lfb;-><init>(B)V

    invoke-virtual {p0, p1}, Ls14;->L(Lorg/chromium/base/Callback;)V

    return-void
.end method

.method public constructor <init>(Lnrl;Lcom/opera/android/browser/chromium/ChromiumContent;I[Llag;[Lcag;Ljava/lang/String;Ljava/lang/String;ZLcom/opera/android/permissions/PermissionBridge$PermissionCallback;)V
    .registers 10

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    iput-object p1, p0, Ljb;->d:Ljava/lang/Object;

    .line 133
    iput-object p2, p0, Ljb;->e:Ljava/lang/Object;

    .line 134
    iput p3, p0, Ljb;->a:I

    .line 135
    iput-object p4, p0, Ljb;->f:Ljava/io/Serializable;

    .line 136
    iput-object p5, p0, Ljb;->g:Ljava/io/Serializable;

    .line 137
    iput-object p6, p0, Ljb;->h:Ljava/io/Serializable;

    .line 138
    iput-object p7, p0, Ljb;->i:Ljava/lang/Object;

    .line 139
    iput-boolean p8, p0, Ljb;->b:Z

    .line 140
    iput-object p9, p0, Ljb;->j:Ljava/lang/Object;

    return-void
.end method

.method public static b(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    const v0, 0x7f1401b7

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, -0x1

    sparse-switch v1, :sswitch_data_7c

    goto :goto_44

    :sswitch_13
    const-string v1, "android.permission.RECORD_AUDIO"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    const/4 v2, 0x4

    goto :goto_44

    :sswitch_1d
    const-string v1, "android.permission.CAMERA"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    const/4 v2, 0x3

    goto :goto_44

    :sswitch_27
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    const/4 v2, 0x2

    goto :goto_44

    :sswitch_31
    const-string v1, "android.permission.ACCESS_LOCAL_NETWORK"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    const/4 v2, 0x1

    goto :goto_44

    :sswitch_3b
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    const/4 v2, 0x0

    :cond_44
    :goto_44
    packed-switch v2, :pswitch_data_92

    invoke-static {p1}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :pswitch_4c
    const p1, 0x7f140cd9

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_58
    const p1, 0x7f140cd6

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_64
    const p1, 0x7f140cd7

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_70
    const p1, 0x7f140cd8

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_7c
    .sparse-switch
        -0x70918bc1 -> :sswitch_3b
        -0x5e1c3741 -> :sswitch_31
        -0x3c1ac56 -> :sswitch_27
        0x1b9efa65 -> :sswitch_1d
        0x6d24f988 -> :sswitch_13
    .end sparse-switch

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_70
        :pswitch_64
        :pswitch_70
        :pswitch_58
        :pswitch_4c
    .end packed-switch
.end method


# virtual methods
.method public final a()V
    .registers 14

    iget-object v0, p0, Ljb;->j:Ljava/lang/Object;

    check-cast v0, Lib;

    const/4 v1, 0x1

    if-eqz v0, :cond_14

    iget-object v2, v0, Lfe2;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, v0, Lfe2;->a:Lee2;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Ljb;->j:Ljava/lang/Object;

    :cond_14
    new-instance v0, Lib;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Ljb;->h:Ljava/io/Serializable;

    check-cast v3, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    iget-object v4, p0, Ljb;->f:Ljava/io/Serializable;

    check-cast v4, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_35
    :goto_35
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/accounts/Account;

    iget-object v5, v5, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_4b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_bc

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lz7g;

    if-nez v6, :cond_bc

    iget-object v6, v8, Lz7g;->a:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x0

    if-ne v8, v1, :cond_6b

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_4b

    :cond_6b
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_ba

    invoke-static {v1, v6}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_ba

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v11

    sub-int/2addr v11, v1

    invoke-virtual {v6, v1, v11}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_94
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_ad

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v5, v11, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v8

    const/4 v12, -0x1

    if-eq v8, v12, :cond_ba

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v8, v11

    goto :goto_94

    :cond_ad
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v8

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-gt v6, v8, :cond_ba

    move v6, v1

    goto :goto_4b

    :cond_ba
    move v6, v9

    goto :goto_4b

    :cond_bc
    if-eqz v6, :cond_35

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_35

    :cond_c3
    invoke-direct {v0, p0, v2}, Lib;-><init>(Ljb;Ljava/util/ArrayList;)V

    iput-object v0, p0, Ljb;->j:Ljava/lang/Object;

    sget-object p0, Lfe2;->f:Le2j;

    invoke-virtual {v0, p0}, Lfe2;->b(Loxc;)V

    return-void
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Ljb;->g:Ljava/io/Serializable;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    invoke-static {p0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0
.end method

.method public final d(IZZ)V
    .registers 15

    iget-object v0, p0, Ljb;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v1, p0, Ljb;->g:Ljava/io/Serializable;

    check-cast v1, [Lcag;

    iget-object v2, p0, Ljb;->d:Ljava/lang/Object;

    check-cast v2, Lnrl;

    iget-object v3, p0, Ljb;->f:Ljava/io/Serializable;

    check-cast v3, [Llag;

    iget v4, p0, Ljb;->c:I

    if-eq p1, v4, :cond_15

    return-void

    :cond_15
    if-eqz p2, :cond_1b

    sget-object p1, Lkag;->b:Lkag;

    :goto_19
    move-object v9, p1

    goto :goto_1e

    :cond_1b
    sget-object p1, Lkag;->c:Lkag;

    goto :goto_19

    :goto_1e
    aget-object v8, v3, v4

    iget-object p1, p0, Ljb;->h:Ljava/io/Serializable;

    check-cast p1, Ljava/lang/String;

    iget-object v4, p0, Ljb;->i:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    sget-object v5, Llag;->b:Llag;

    if-eq v8, v5, :cond_32

    sget-object v5, Llag;->h:Llag;

    if-eq v8, v5, :cond_32

    move-object v7, v4

    goto :goto_33

    :cond_32
    move-object v7, p1

    :goto_33
    iget-object p1, v2, Lnrl;->b:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Ls9g;

    iget-boolean v6, v2, Lnrl;->a:Z

    move v10, p3

    invoke-virtual/range {v5 .. v10}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    iget p1, p0, Ljb;->c:I

    array-length p3, v3

    const/4 v4, 0x1

    sub-int/2addr p3, v4

    if-ge p1, p3, :cond_73

    aget-object p3, v3, p1

    sget-object v5, Llag;->f:Llag;

    if-ne p3, v5, :cond_73

    add-int/lit8 p3, p1, 0x1

    aget-object v5, v3, p3

    sget-object v6, Llag;->e:Llag;

    if-ne v5, v6, :cond_73

    aget-object v5, v1, p3

    iget-object v5, v5, Lcag;->a:Lkag;

    sget-object v6, Lkag;->d:Lkag;

    if-ne v5, v6, :cond_73

    aget-object v5, v1, p1

    new-instance v6, Lcag;

    iget-object v5, v5, Lcag;->b:Ldag;

    invoke-direct {v6, v9, v5}, Lcag;-><init>(Lkag;Ldag;)V

    aput-object v6, v1, p3

    add-int/2addr p1, v4

    aget-object v8, v3, p1

    iget-object p1, v2, Lnrl;->b:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Ls9g;

    iget-boolean v6, v2, Lnrl;->a:Z

    invoke-virtual/range {v5 .. v10}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :cond_73
    if-eqz p2, :cond_91

    iget p1, p0, Ljb;->c:I

    aget-object p1, v3, p1

    invoke-static {p1}, Lf03;->z(Llag;)I

    move-result p1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_91

    iget p1, p0, Ljb;->c:I

    aget-object p1, v3, p1

    invoke-static {p1}, Lf03;->j(Llag;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, v0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    invoke-static {p2, p1, p0, v4}, Lf03;->T(Lorg/chromium/ui/base/WindowAndroid;[Ljava/lang/String;Lbag;Z)V

    return-void

    :cond_91
    iget p1, p0, Ljb;->c:I

    iget-object p2, v0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    iget-object p2, p2, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Context;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget p3, p0, Ljb;->c:I

    aget-object p3, v3, p3

    invoke-static {p2, p3, v9}, Lf03;->m(Landroid/content/Context;Llag;Lkag;)Lcag;

    move-result-object p2

    aput-object p2, v1, p1

    iget p1, p0, Ljb;->c:I

    add-int/2addr p1, v4

    iput p1, p0, Ljb;->c:I

    invoke-virtual {p0}, Ljb;->f()V

    return-void
.end method

.method public final e()V
    .registers 2

    iget v0, p0, Ljb;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Ljb;->c:I

    return-void
.end method

.method public final f()V
    .registers 9

    iget-object v0, p0, Ljb;->g:Ljava/io/Serializable;

    check-cast v0, [Lcag;

    iget-object v1, p0, Ljb;->f:Ljava/io/Serializable;

    check-cast v1, [Llag;

    iget-object v2, p0, Ljb;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/browser/chromium/ChromiumContent;

    :goto_c
    iget v3, p0, Ljb;->c:I

    array-length v4, v1

    if-ge v3, v4, :cond_78

    aget-object v4, v0, v3

    iget-object v4, v4, Lcag;->a:Lkag;

    sget-object v5, Lkag;->d:Lkag;

    if-ne v4, v5, :cond_46

    aget-object v0, v1, v3

    sget-object v1, Llag;->b:Llag;

    if-ne v0, v1, :cond_3b

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v0, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    xor-int/lit8 v1, v0, 0x1

    iget v3, p0, Ljb;->c:I

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v4, v1}, Ljb;->d(IZZ)V

    new-instance v1, Ls2f;

    iget-object p0, p0, Ljb;->h:Ljava/io/Serializable;

    check-cast p0, Ljava/lang/String;

    invoke-direct {v1, p0, v0}, Ls2f;-><init>(Ljava/lang/String;Z)V

    iget-object p0, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v1}, Lcom/opera/android/browser/dialog/DialogDelegate;->j(Ls2f;)V

    return-void

    :cond_3b
    new-instance v1, Lz9g;

    invoke-direct {v1, p0, v0, v3}, Lz9g;-><init>(Ljb;Llag;I)V

    iget-object p0, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v1}, Lcom/opera/android/browser/dialog/DialogDelegate;->a(Lnz0;)V

    return-void

    :cond_46
    sget-object v5, Lkag;->b:Lkag;

    const/4 v6, 0x1

    if-ne v4, v5, :cond_72

    aget-object v3, v1, v3

    invoke-static {v3}, Lf03;->z(Llag;)I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_72

    iget v3, p0, Ljb;->c:I

    aget-object v4, v0, v3

    new-instance v5, Lcag;

    iget-object v4, v4, Lcag;->b:Ldag;

    sget-object v7, Lkag;->c:Lkag;

    invoke-direct {v5, v7, v4}, Lcag;-><init>(Lkag;Ldag;)V

    aput-object v5, v0, v3

    aget-object v0, v1, v3

    invoke-static {v0}, Lf03;->j(Llag;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v2, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    invoke-static {v1, v0, p0, v6}, Lf03;->T(Lorg/chromium/ui/base/WindowAndroid;[Ljava/lang/String;Lbag;Z)V

    return-void

    :cond_72
    iget v3, p0, Ljb;->c:I

    add-int/2addr v3, v6

    iput v3, p0, Ljb;->c:I

    goto :goto_c

    :cond_78
    iget-object v1, p0, Ljb;->j:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;

    if-eqz v1, :cond_81

    invoke-virtual {v1, v0}, Lcom/opera/android/permissions/PermissionBridge$PermissionCallback;->run(Ljava/lang/Object;)V

    :cond_81
    iget-object v0, p0, Ljb;->d:Ljava/lang/Object;

    check-cast v0, Lnrl;

    iget p0, p0, Ljb;->a:I

    iget-object v0, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Ls9g;

    iget-object v0, v0, Ls9g;->g:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g(Landroid/app/Activity;Ljava/util/List;)Lv9g;
    .registers 4

    new-instance p0, Lt9g;

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p1, p2}, Ljb;->b(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const v0, 0x7f140cd5

    invoke-direct {p0, p1, v0, p2}, Lt9g;-><init>(Landroid/app/Activity;ILjava/lang/String;)V

    return-object p0
.end method

.method public final h()V
    .registers 5

    iget-object v0, p0, Ljb;->h:Ljava/io/Serializable;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v1, p0, Ljb;->g:Ljava/io/Serializable;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_78

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_78

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/util/List;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_73

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_6e

    iget-object v0, p0, Ljb;->i:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-boolean v1, v0, Ls14;->b:Z

    const/4 v3, 0x1

    if-ne v1, v3, :cond_58

    new-instance v0, Ls14;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Ls14;-><init>(B)V

    invoke-virtual {v0, v2}, Ls14;->x(Ljava/lang/Object;)V

    iput-object v0, p0, Ljb;->i:Ljava/lang/Object;

    goto :goto_5b

    :cond_58
    invoke-virtual {v0, v2}, Ls14;->x(Ljava/lang/Object;)V

    :goto_5b
    iget-object p0, p0, Ljb;->e:Ljava/lang/Object;

    check-cast p0, Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_78

    invoke-static {p0}, Lam2;->j(Lg7f;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_6e
    invoke-static {v0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_73
    invoke-static {v0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :cond_78
    return-void
.end method

.method public final n(Ldx3;Ljava/util/ArrayList;)Lv9g;
    .registers 4

    new-instance p0, Lt9g;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p1, p2}, Ljb;->b(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lt9g;-><init>(Ldx3;Ljava/lang/String;)V

    return-object p0
.end method

.method public final s()V
    .registers 6

    iget-object v0, p0, Ljb;->g:Ljava/io/Serializable;

    check-cast v0, [Lcag;

    iget v1, p0, Ljb;->c:I

    aget-object v2, v0, v1

    new-instance v3, Lcag;

    iget-object v2, v2, Lcag;->b:Ldag;

    sget-object v4, Lkag;->c:Lkag;

    invoke-direct {v3, v4, v2}, Lcag;-><init>(Lkag;Ldag;)V

    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Ljb;->c:I

    invoke-virtual {p0}, Ljb;->f()V

    return-void
.end method

.method public final t()V
    .registers 6

    iget-object v0, p0, Ljb;->g:Ljava/io/Serializable;

    check-cast v0, [Lcag;

    iget v1, p0, Ljb;->c:I

    iget-object v2, p0, Ljb;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v2, v2, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    iget-object v2, v2, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Ljb;->f:Ljava/io/Serializable;

    check-cast v3, [Llag;

    iget v4, p0, Ljb;->c:I

    aget-object v3, v3, v4

    sget-object v4, Lkag;->b:Lkag;

    invoke-static {v2, v3, v4}, Lf03;->m(Landroid/content/Context;Llag;Lkag;)Lcag;

    move-result-object v2

    aput-object v2, v0, v1

    iget v0, p0, Ljb;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Ljb;->c:I

    invoke-virtual {p0}, Ljb;->f()V

    return-void
.end method
