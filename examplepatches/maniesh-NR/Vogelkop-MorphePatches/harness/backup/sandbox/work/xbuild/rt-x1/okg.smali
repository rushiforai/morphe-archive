.class public final Lokg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lkjg;

.field public final c:Llkg;

.field public final d:Ljava/util/HashMap;

.field public final e:Ljava/util/HashMap;

.field public final f:Lag;

.field public final g:Lnkg;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lkjg;Ljr9;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lokg;->d:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lokg;->e:Ljava/util/HashMap;

    new-instance v0, Lag;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lag;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lokg;->f:Lag;

    iput-object p1, p0, Lokg;->a:Landroid/content/Context;

    iput-object p2, p0, Lokg;->b:Lkjg;

    invoke-interface {p3, p0}, Ljr9;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Llkg;

    iput-object p2, p0, Lokg;->c:Llkg;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p2

    iget-object p2, p2, Lsf7;->a:Lrf7;

    invoke-virtual {p2, v0}, Lrf7;->b(Lqf7;)V

    new-instance p2, Lnkg;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->e1:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lm6l;

    iget-object p1, p1, Lm6l;->a:Lode;

    invoke-direct {p2, p0, p1}, Lnkg;-><init>(Lokg;Lode;)V

    iput-object p2, p0, Lokg;->g:Lnkg;

    return-void
.end method


# virtual methods
.method public final a(I[Lmkg;)V
    .registers 4

    array-length v0, p2

    if-nez v0, :cond_4

    return-void

    :cond_4
    iget-object v0, p0, Lokg;->c:Llkg;

    invoke-interface {v0, p1, p2}, Llkg;->g(I[Lmkg;)V

    iget-object p0, p0, Lokg;->b:Lkjg;

    invoke-virtual {p0}, Lkjg;->b()V

    return-void
.end method

.method public final b()V
    .registers 3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lokg;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    iget-object v1, p0, Lokg;->f:Lag;

    invoke-virtual {v0, v1}, Lrf7;->u(Lqf7;)V

    iget-object v0, p0, Lokg;->g:Lnkg;

    iget-object v1, v0, Lnkg;->a:Lode;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    iget-object v1, v0, Lnkg;->b:Lk6l;

    if-eqz v1, :cond_23

    invoke-virtual {v1, v0}, Lk6l;->x(Lj6l;)V

    :cond_23
    iget-object p0, p0, Lokg;->c:Llkg;

    invoke-interface {p0}, Llkg;->destroy()V

    return-void
.end method

.method public final c(Lqjd;)Legd;
    .registers 2

    iget-object p0, p0, Lokg;->e:Ljava/util/HashMap;

    iget-object p1, p1, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Legd;

    return-object p0
.end method

.method public final d([Lmkg;IJ)V
    .registers 6

    iget-object v0, p0, Lokg;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lokg;->e:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lokg;->c:Llkg;

    invoke-interface {v0, p1, p2, p3, p4}, Llkg;->d([Lmkg;IJ)V

    iget-object p0, p0, Lokg;->b:Lkjg;

    invoke-virtual {p0}, Lkjg;->b()V

    return-void
.end method
