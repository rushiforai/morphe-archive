.class public final Lob;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcvg;Ljava/lang/Runnable;)V
    .registers 3

    const/16 p1, 0xe

    iput-byte p1, p0, Lob;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lob;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lob;->a:B

    iput-object p1, p0, Lob;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 6

    iget-byte p1, p0, Lob;->a:B

    iget-object p0, p0, Lob;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_3a

    return-void

    :sswitch_8
    check-cast p0, Lx79;

    iget-object p1, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p1, Lob;

    if-eqz p1, :cond_29

    new-instance p1, Lr62;

    iget-object v0, p0, Lx79;->b:Ljava/lang/Object;

    check-cast v0, Lekc;

    new-instance v1, Lrmg;

    const/16 v2, 0x18

    invoke-direct {v1, p0, v2}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Ltu;

    const/4 v3, 0x5

    invoke-direct {v2, v1, v3}, Ltu;-><init>(Ljava/lang/Object;B)V

    const/4 v1, 0x2

    invoke-direct {p1, v0, v2, v1}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    iput-object p1, p0, Lx79;->d:Ljava/lang/Object;

    :cond_29
    return-void

    :sswitch_2a
    check-cast p0, Llj2;

    iget p1, p0, Llj2;->g:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Llj2;->g:I

    iget p1, p0, Llj2;->f:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Llj2;->f:I

    return-void

    nop

    :sswitch_data_3a
    .sparse-switch
        0x4 -> :sswitch_2a
        0xf -> :sswitch_8
    .end sparse-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 7

    iget-byte v0, p0, Lob;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lob;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_bc

    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :sswitch_e
    check-cast v4, Lx79;

    iget-object v0, v4, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Lr62;

    if-eqz v0, :cond_1b

    iput-object v3, v4, Lx79;->d:Ljava/lang/Object;

    invoke-virtual {v0}, Lq59;->cancel()V

    :cond_1b
    iget-object v0, v4, Lx79;->e:Ljava/lang/Object;

    check-cast v0, Lob;

    if-eqz v0, :cond_2c

    iput-object v3, v4, Lx79;->e:Ljava/lang/Object;

    iget-object v1, v4, Lx79;->a:Ljava/lang/Object;

    check-cast v1, Loje;

    iget-object v1, v1, Loje;->d:Lqdc;

    invoke-virtual {v1, v0}, Lqdc;->b(Lmdc;)V

    :cond_2c
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void

    :sswitch_34
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v4, Lfge;

    iput-boolean v2, v4, Lfge;->Q:Z

    return-void

    :sswitch_40
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v4, Lu85;

    iput-object v3, v4, Lu85;->j:Ljava/lang/Object;

    iput-object v3, v4, Lu85;->k:Ljava/lang/Object;

    return-void

    :sswitch_4e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v4, Lz;

    iget-boolean p0, v4, Lz;->a:Z

    if-nez p0, :cond_6c

    iget p0, v4, Lz;->b:I

    add-int/lit8 p0, p0, -0x1

    iput p0, v4, Lz;->b:I

    if-gtz p0, :cond_6c

    iput-boolean v1, v4, Lz;->a:Z

    iget-object p0, v4, Lz;->c:Ljava/lang/Object;

    check-cast p0, Lm62;

    invoke-virtual {p0}, Lm62;->run()V

    :cond_6c
    return-void

    :sswitch_6d
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v4, Llj2;

    iget p0, v4, Llj2;->g:I

    if-lez p0, :cond_7e

    add-int/lit8 p0, p0, -0x1

    iput p0, v4, Llj2;->g:I

    :cond_7e
    if-gtz p0, :cond_8d

    iget p0, v4, Llj2;->e:I

    if-eq p0, v1, :cond_87

    const/4 p1, 0x4

    if-ne p0, p1, :cond_8b

    :cond_87
    const/4 p0, 0x3

    invoke-virtual {v4, p0}, Llj2;->d(I)V

    :cond_8b
    iput v2, v4, Llj2;->f:I

    :cond_8d
    return-void

    :sswitch_8e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v4, Lcg2;

    iget-object p0, v4, Lcg2;->j:Lgg2;

    if-eqz p0, :cond_a2

    sget p1, Lhi7;->u:I

    sget-object p1, Lei7;->a:Lei7;

    invoke-virtual {p0, p1}, Lhi7;->a(Lei7;)V

    :cond_a2
    return-void

    :sswitch_a3
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    check-cast v4, Lqb;

    iget-object p0, v4, Lqb;->f:Ls62;

    if-ne p1, p0, :cond_bb

    iput-object v3, v4, Lqb;->f:Ls62;

    iput-object v3, v4, Lqb;->g:Lesk;

    iget-object p0, v4, Lqb;->h:Lrn9;

    if-eqz p0, :cond_bb

    invoke-virtual {p0}, Lrn9;->t()V

    :cond_bb
    return-void

    :sswitch_data_bc
    .sparse-switch
        0x0 -> :sswitch_a3
        0x3 -> :sswitch_8e
        0x4 -> :sswitch_6d
        0x7 -> :sswitch_4e
        0x8 -> :sswitch_40
        0x9 -> :sswitch_34
        0xf -> :sswitch_e
    .end sparse-switch
.end method

.method public final onPause(Lndc;)V
    .registers 9

    iget-byte p1, p0, Lob;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lob;->b:Ljava/lang/Object;

    sparse-switch p1, :sswitch_data_de

    return-void

    :sswitch_9
    check-cast p0, Lqyj;

    iget p1, p0, Lqyj;->h:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lqyj;->h:I

    if-nez p1, :cond_16

    invoke-virtual {p0}, Lqyj;->m()V

    :cond_16
    return-void

    :sswitch_17
    check-cast p0, Lmdf;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lmdf;->f:J

    iget-wide v5, p0, Lmdf;->g:J

    sub-long v5, v1, v5

    add-long/2addr v5, v3

    iput-wide v5, p0, Lmdf;->f:J

    iput-wide v1, p0, Lmdf;->g:J

    iput-boolean v0, p0, Lmdf;->h:Z

    iget-object p1, p0, Lmdf;->e:Ljava/util/ArrayList;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkl0;

    sget-object v0, Lgl0;->e:Lgl0;

    invoke-virtual {p0, p1, v0}, Lmdf;->b(Lkl0;Lgl0;)V

    return-void

    :sswitch_38
    check-cast p0, Luqe;

    iget-object p0, p0, Luqe;->h:Luy8;

    iget-object p1, p0, Luy8;->o:Lqy8;

    iget v1, p1, Lqy8;->g:I

    if-lez v1, :cond_46

    add-int/lit8 v1, v1, -0x1

    iput v1, p1, Lqy8;->g:I

    :cond_46
    iget-object p1, p0, Luy8;->p:Lqy8;

    iget v1, p1, Lqy8;->g:I

    if-lez v1, :cond_50

    add-int/lit8 v1, v1, -0x1

    iput v1, p1, Lqy8;->g:I

    :cond_50
    iget-object p1, p0, Luy8;->w:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_56
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_72

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Luy8;->H:Lk5o;

    invoke-virtual {v3, v2, v0}, Lk5o;->r(Ljava/lang/String;Z)V

    iget-object v3, p0, Luy8;->x:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v3, p0, Luy8;->y:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_56

    :cond_72
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    return-void

    :sswitch_76
    check-cast p0, Lfqe;

    iget-object p1, p0, Lfqe;->e:Ltm5;

    iget-boolean v1, p1, Ltm5;->b:Z

    if-eqz v1, :cond_9b

    iput-boolean v0, p1, Ltm5;->b:Z

    new-instance v1, Ljava/util/HashSet;

    iget-object p1, p1, Ltm5;->e:Ljava/util/Set;

    invoke-direct {v1, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_8b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfwh;

    invoke-virtual {v1, v0}, Lfwh;->b(Z)V

    goto :goto_8b

    :cond_9b
    iget-object p0, p0, Lfqe;->a:Landroid/content/Context;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p1, p0, Lcom/opera/android/OperaApplication;->w:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->c()Z

    move-result p1

    if-eqz p1, :cond_cf

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->w:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lau8;

    iget-object p0, p0, Lau8;->c:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_bf
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_cf

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lf92;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_bf

    :cond_cf
    return-void

    :sswitch_d0
    check-cast p0, Lnv9;

    iput-boolean v0, p0, Lnv9;->g:Z

    invoke-virtual {p0}, Lnv9;->u()Z

    move-result p1

    if-eqz p1, :cond_dd

    invoke-virtual {p0}, Lnv9;->w()V

    :cond_dd
    return-void

    :sswitch_data_de
    .sparse-switch
        0x6 -> :sswitch_d0
        0xa -> :sswitch_76
        0xb -> :sswitch_38
        0xd -> :sswitch_17
        0x10 -> :sswitch_9
    .end sparse-switch
.end method

.method public final onResume(Lndc;)V
    .registers 9

    iget-byte v0, p0, Lob;->a:B

    const-string v1, "ofa-"

    const-string v2, "ofa-private-mode"

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object v6, p0, Lob;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_16c

    :pswitch_e
    return-void

    :pswitch_f
    check-cast v6, Lqyj;

    iget p0, v6, Lqyj;->h:I

    add-int/2addr p0, v5

    iput p0, v6, Lqyj;->h:I

    return-void

    :pswitch_17
    check-cast v6, Lmdf;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide p0

    iput-wide p0, v6, Lmdf;->g:J

    iput-boolean v5, v6, Lmdf;->h:Z

    return-void

    :pswitch_22
    check-cast v6, Lu1f;

    iget-object p0, v6, Lu1f;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object p0

    iget-object p0, p0, Lgom;->a:Llom;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_37

    if-eq p0, v3, :cond_37

    move v4, v5

    :cond_37
    invoke-virtual {v6}, Lu1f;->a()Z

    move-result p0

    if-eq v4, p0, :cond_57

    iget-object p0, v6, Lu1f;->g:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "has_notification"

    invoke-interface {p0, p1, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v6}, Lp1f;->b()V

    :cond_57
    return-void

    :pswitch_58
    check-cast v6, Luqe;

    iget-object p0, v6, Luqe;->h:Luy8;

    iget-boolean p1, p0, Luy8;->k:Z

    iput-boolean v5, p0, Luy8;->k:Z

    iget-object v0, p0, Luy8;->o:Lqy8;

    iget v1, v0, Lqy8;->g:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lqy8;->g:I

    if-nez v1, :cond_6d

    invoke-virtual {v0, v4}, Lqy8;->c(Z)V

    :cond_6d
    iget-object p0, p0, Luy8;->p:Lqy8;

    iget v0, p0, Lqy8;->g:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lqy8;->g:I

    if-nez v0, :cond_7a

    invoke-virtual {p0, v4}, Lqy8;->c(Z)V

    :cond_7a
    if-eqz p1, :cond_86

    invoke-virtual {p0}, Lqy8;->a()J

    move-result-wide v0

    invoke-static {v0, v1}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result p1

    if-nez p1, :cond_89

    :cond_86
    invoke-virtual {p0, v5}, Lqy8;->c(Z)V

    :cond_89
    return-void

    :pswitch_8a
    check-cast v6, Lfqe;

    iget-object p0, v6, Lfqe;->e:Ltm5;

    iget-boolean p1, p0, Ltm5;->b:Z

    if-nez p1, :cond_af

    iput-boolean v5, p0, Ltm5;->b:Z

    new-instance p1, Ljava/util/HashSet;

    iget-object p0, p0, Ltm5;->e:Ljava/util/Set;

    invoke-direct {p1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_af

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfwh;

    invoke-virtual {p1, v5}, Lfwh;->b(Z)V

    goto :goto_9f

    :cond_af
    return-void

    :pswitch_b0
    check-cast v6, Lnv9;

    iput-boolean v5, v6, Lnv9;->g:Z

    invoke-virtual {v6}, Lnv9;->y()Z

    move-result p0

    if-eqz p0, :cond_bd

    invoke-virtual {v6}, Lnv9;->B()V

    :cond_bd
    return-void

    :pswitch_be
    check-cast v6, Lx5f;

    new-instance p1, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {p1}, Lcom/opera/android/autofill/AutofillManager;-><init>()V

    invoke-static {}, LJ/N;->M3pTNY7t()Z

    move-result v0

    if-eqz v0, :cond_d4

    new-instance v0, Lop2;

    invoke-direct {v0, p0, v4}, Lop2;-><init>(Lob;B)V

    invoke-virtual {p1, v0}, Lcom/opera/android/autofill/AutofillManager;->e(Lcom/opera/api/Callback;)V

    goto :goto_d7

    :cond_d4
    invoke-virtual {v6, v4, v4}, Lx5f;->A(ZZ)V

    :goto_d7
    invoke-static {}, LJ/N;->MMr_2O4r()Z

    move-result v0

    if-eqz v0, :cond_ee

    new-instance v0, Lop2;

    invoke-direct {v0, p0, v5}, Lop2;-><init>(Lob;B)V

    invoke-virtual {p1, v0}, Lcom/opera/android/autofill/AutofillManager;->c(Lcom/opera/api/Callback;)V

    new-instance v0, Lop2;

    invoke-direct {v0, p0, v3}, Lop2;-><init>(Lob;B)V

    invoke-virtual {p1, v0}, Lcom/opera/android/autofill/AutofillManager;->d(Lcom/opera/api/Callback;)V

    goto :goto_f4

    :cond_ee
    invoke-virtual {v6, v4, v4}, Lx5f;->z(ZZ)V

    invoke-virtual {v6, v4, v4}, Lx5f;->B(ZZ)V

    :goto_f4
    return-void

    :pswitch_f5
    check-cast v6, Llj2;

    iget p0, v6, Llj2;->f:I

    if-lez p0, :cond_ff

    add-int/lit8 p0, p0, -0x1

    iput p0, v6, Llj2;->f:I

    :cond_ff
    if-gtz p0, :cond_12f

    iget p0, v6, Llj2;->e:I

    const/4 v0, 0x4

    if-eq p0, v0, :cond_12f

    iget-boolean v1, v6, Llj2;->h:Z

    if-eqz v1, :cond_119

    iput-boolean v4, v6, Llj2;->h:Z

    instance-of p0, p1, Ljj2;

    if-eqz p0, :cond_12f

    invoke-virtual {v6, v0}, Llj2;->d(I)V

    check-cast p1, Ljj2;

    invoke-interface {p1}, Ljj2;->b0()V

    goto :goto_12f

    :cond_119
    const/4 v0, 0x3

    if-ne p0, v0, :cond_12f

    instance-of p0, p1, Landroidx/fragment/app/Fragment;

    if-eqz p0, :cond_12f

    check-cast p1, Landroidx/fragment/app/Fragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v6, v3}, Llj2;->d(I)V

    iget-object p1, v6, Llj2;->a:Lzy9;

    const/4 v0, 0x0

    invoke-virtual {v6, p0, p1, v0}, Llj2;->c(Landroid/content/Context;Lzy9;Ljava/lang/Runnable;)V

    :cond_12f
    :goto_12f
    return-void

    :pswitch_130
    check-cast v6, Lhq3;

    iget-object p0, v6, Ls62;->y:Leyi;

    iget-object p1, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p1, Lkze;

    iget-object v0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-boolean p0, p0, Leyi;->b:Z

    if-nez p0, :cond_14a

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    iget-object p0, p0, Lg7j;->d:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_14a
    invoke-static {p1, v2}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_14e
    check-cast v6, Lxy3;

    iget-object p0, v6, Ls62;->y:Leyi;

    iget-object p1, p0, Leyi;->d:Ljava/lang/Object;

    check-cast p1, Lkze;

    iget-object v0, p0, Leyi;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    iget-boolean p0, p0, Leyi;->b:Z

    if-nez p0, :cond_168

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    iget-object p0, p0, Lg7j;->d:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_168
    invoke-static {p1, v2}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :pswitch_data_16c
    .packed-switch 0x1
        :pswitch_14e
        :pswitch_130
        :pswitch_e
        :pswitch_f5
        :pswitch_be
        :pswitch_b0
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_8a
        :pswitch_58
        :pswitch_22
        :pswitch_17
        :pswitch_e
        :pswitch_e
        :pswitch_f
    .end packed-switch
.end method

.method public final onStart(Lndc;)V
    .registers 4

    iget-byte v0, p0, Lob;->a:B

    iget-object v1, p0, Lob;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_20

    return-void

    :sswitch_8
    check-cast v1, Lslk;

    iget-object p0, v1, Lslk;->a:Lm59;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lm59;->c:Z

    invoke-virtual {p0}, Lm59;->i()V

    return-void

    :sswitch_13
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    return-void

    :sswitch_data_20
    .sparse-switch
        0xe -> :sswitch_13
        0x11 -> :sswitch_8
    .end sparse-switch
.end method

.method public final onStop(Lndc;)V
    .registers 3

    iget-byte p1, p0, Lob;->a:B

    packed-switch p1, :pswitch_data_1c

    return-void

    :pswitch_6
    iget-object p0, p0, Lob;->b:Ljava/lang/Object;

    check-cast p0, Lslk;

    iget-object p0, p0, Lslk;->a:Lm59;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lm59;->c:Z

    iget-object v0, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v0, Loml;

    if-eqz v0, :cond_1b

    invoke-virtual {v0, p1}, Loml;->cancel(Z)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lm59;->e:Ljava/lang/Object;

    :cond_1b
    return-void

    :pswitch_data_1c
    .packed-switch 0x11
        :pswitch_6
    .end packed-switch
.end method
