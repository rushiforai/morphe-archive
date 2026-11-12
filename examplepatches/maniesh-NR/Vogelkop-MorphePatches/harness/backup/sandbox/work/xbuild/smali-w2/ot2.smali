.class public final Lot2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljt2;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lgjm;

.field public final c:Ldu3;

.field public final d:Lcom/opera/android/Lazy;

.field public final e:Lcom/opera/android/Lazy;

.field public final f:Lcom/opera/android/Lazy;

.field public final g:Lcom/opera/android/Lazy;

.field public final h:Lwv1;

.field public final i:Lcom/opera/android/Lazy;

.field public final j:Ldu3;

.field public final k:Lwv1;

.field public final l:Landroidx/fragment/app/w;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;Ldu3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lwv1;Lcom/opera/android/Lazy;Ldu3;Lwv1;Landroidx/fragment/app/w;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lot2;->b:Lgjm;

    iput-object p3, p0, Lot2;->c:Ldu3;

    iput-object p4, p0, Lot2;->d:Lcom/opera/android/Lazy;

    iput-object p5, p0, Lot2;->e:Lcom/opera/android/Lazy;

    iput-object p6, p0, Lot2;->f:Lcom/opera/android/Lazy;

    iput-object p7, p0, Lot2;->g:Lcom/opera/android/Lazy;

    iput-object p8, p0, Lot2;->h:Lwv1;

    iput-object p9, p0, Lot2;->i:Lcom/opera/android/Lazy;

    iput-object p10, p0, Lot2;->j:Ldu3;

    iput-object p11, p0, Lot2;->k:Lwv1;

    iput-object p12, p0, Lot2;->l:Landroidx/fragment/app/w;

    return-void
.end method


# virtual methods
.method public final varargs a([I)V
    .registers 6

    new-instance v0, Ltw;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Ltw;-><init>(Loba;)V

    iget-object p0, p0, Lot2;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final varargs b([I)V
    .registers 5

    iget-object v0, p0, Lot2;->f:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwh2;

    new-instance v1, Lkt2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lkt2;-><init>(Lot2;[IB)V

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, p0, v1}, Llj2;->b(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c(Lcom/opera/android/autofill/Address;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    new-instance v0, Lds2;

    iget-object v1, p0, Lot2;->e:Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/autofill/AutofillManager;

    new-instance v2, Lgw;

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {v2, p0}, Lgw;-><init>(Lhjf;)V

    invoke-direct {v0, v1, v2, p1}, Lds2;-><init>(Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V

    new-instance p1, Ltr2;

    invoke-direct {p1, p2}, Ltr2;-><init>(Lkotlin/jvm/functions/Function1;)V

    iput-object p1, v0, Liq2;->F:Les2;

    const/16 p1, 0x1003

    invoke-static {v0, p1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final d()V
    .registers 4

    new-instance v0, Lq02;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lq02;-><init>(Ljava/lang/Object;B)V

    sget-boolean v1, Lwi2;->l:Z

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    if-nez v1, :cond_26

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    sget-boolean v2, Lwi2;->l:Z

    if-nez v2, :cond_26

    sput-object v1, Lwi2;->j:Lcom/opera/android/settings/SettingsManager;

    sget-object v1, Lu55;->Ro:Lulp;

    sput-object v1, Lwi2;->k:Lulp;

    const/4 v1, 0x1

    sput-boolean v1, Lwi2;->l:Z

    :cond_26
    sget-object v1, Lwi2;->i:Lwi2;

    invoke-virtual {v1, p0, v0}, Llj2;->b(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final varargs e([I)V
    .registers 5

    new-instance v0, Lkt2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lkt2;-><init>(Lot2;[IB)V

    sget-boolean p1, Lwi2;->l:Z

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    if-nez p1, :cond_24

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    sget-boolean v2, Lwi2;->l:Z

    if-nez v2, :cond_24

    sput-object p1, Lwi2;->j:Lcom/opera/android/settings/SettingsManager;

    sget-object p1, Lu55;->Ro:Lulp;

    sput-object p1, Lwi2;->k:Lulp;

    sput-boolean v1, Lwi2;->l:Z

    :cond_24
    sget-object p1, Lwi2;->i:Lwi2;

    invoke-virtual {p1, p0, v0}, Llj2;->b(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final f(Ljava/lang/Runnable;)V
    .registers 5

    iget-object v0, p0, Lot2;->i:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyu2;

    invoke-virtual {v0}, Lyu2;->b()Z

    move-result v1

    if-nez v1, :cond_12

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_12
    iget-object p0, p0, Lot2;->c:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->d:Lnej;

    new-instance v1, Lpf;

    const/4 v2, 0x0

    invoke-direct {v1, v0, p1, v2}, Lpf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v1, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
