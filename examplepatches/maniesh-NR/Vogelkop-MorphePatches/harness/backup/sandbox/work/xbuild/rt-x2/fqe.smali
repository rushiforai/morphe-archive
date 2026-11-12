.class public final Lfqe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public c:Luqe;

.field public d:Lp1c;

.field public final e:Ltm5;

.field public final f:Lode;

.field public g:Ljava/lang/ref/WeakReference;

.field public final h:Lob;

.field public final i:Ldqe;

.field public j:Lndc;

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ltm5;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lfqe;->f:Lode;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lfqe;->g:Ljava/lang/ref/WeakReference;

    new-instance v0, Lob;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lob;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lfqe;->h:Lob;

    new-instance v0, Ldqe;

    invoke-direct {v0, p0}, Ldqe;-><init>(Lfqe;)V

    iput-object v0, p0, Lfqe;->i:Ldqe;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lfqe;->a:Landroid/content/Context;

    iput-object p2, p0, Lfqe;->b:Lumi;

    iput-object p3, p0, Lfqe;->e:Ltm5;

    return-void
.end method


# virtual methods
.method public final a(Lq8j;)V
    .registers 2

    invoke-virtual {p0}, Lfqe;->b()Lp1c;

    move-result-object p0

    invoke-virtual {p0, p1}, Lt7j;->b(Lq8j;)V

    return-void
.end method

.method public final b()Lp1c;
    .registers 11

    iget-object v0, p0, Lfqe;->d:Lp1c;

    if-nez v0, :cond_32

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lfqe;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lp1c;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v5, v3, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v6

    sget-object v1, Lbqe;->k:Lcqe;

    invoke-static {v0}, Luup;->r(Landroid/content/Context;)Lbqe;

    move-result-object v7

    sget-object v1, Lhte;->k:Lite;

    invoke-static {v0}, Lna2;->w(Landroid/content/Context;)Lhte;

    move-result-object v8

    iget-object v9, p0, Lfqe;->e:Ltm5;

    iget-object v3, p0, Lfqe;->a:Landroid/content/Context;

    iget-object v4, p0, Lfqe;->b:Lumi;

    invoke-direct/range {v2 .. v9}, Lp1c;-><init>(Landroid/content/Context;Lumi;Lx5f;Lcom/opera/android/settings/SettingsManager;Lbqe;Lhte;Ltm5;)V

    iput-object v2, p0, Lfqe;->d:Lp1c;

    return-object v2

    :cond_32
    return-object v0
.end method

.method public final c()Luqe;
    .registers 14

    iget-object v0, p0, Lfqe;->c:Luqe;

    if-nez v0, :cond_97

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lfqe;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Luqe;

    invoke-virtual {p0}, Lfqe;->b()Lp1c;

    move-result-object v5

    new-instance v6, Lvx;

    const/16 v2, 0x19

    invoke-direct {v6, p0, v2}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v7

    new-instance v9, Ly0a;

    const/16 v2, 0x1a

    invoke-direct {v9, p0, v2}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->y:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lize;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->A()Loue;

    move-result-object v10

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v11, v2, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v12, v0, Ld6j;->d:Lx5f;

    iget-object v2, p0, Lfqe;->a:Landroid/content/Context;

    iget-object v3, p0, Lfqe;->b:Lumi;

    iget-object v4, p0, Lfqe;->e:Ltm5;

    iget-object v8, p0, Lfqe;->i:Ldqe;

    invoke-direct/range {v1 .. v12}, Luqe;-><init>(Landroid/content/Context;Lumi;Ltm5;Lp1c;Lvx;Ljtg;Lesk;Ly0a;Loue;Lx5f;Lx5f;)V

    iput-object v1, p0, Lfqe;->c:Luqe;

    iget-boolean v0, p0, Lfqe;->k:Z

    iget-object v1, v1, Luqe;->i:Lg93;

    iget-boolean v2, v1, Lg93;->s:Z

    if-eq v0, v2, :cond_68

    iput-boolean v0, v1, Lg93;->s:Z

    iget-object v0, v1, Lg93;->n:Lfue;

    invoke-virtual {v0}, Lfue;->d()V

    iget-object v0, v0, Lfue;->a:Lcue;

    sget-object v2, Lcue;->c:Lcue;

    if-ne v0, v2, :cond_68

    invoke-virtual {v1}, Lt7j;->c()V

    :cond_68
    iget-object v0, p0, Lfqe;->c:Luqe;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lfqe;->c:Luqe;

    iget-object v1, p0, Lfqe;->g:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leqe;

    if-eqz v1, :cond_86

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ltqe;

    invoke-direct {v2, v0}, Ltqe;-><init>(Luqe;)V

    iget-object v0, v1, Leqe;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_86
    iget-object v0, p0, Lfqe;->j:Lndc;

    if-eqz v0, :cond_97

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    iget-object v1, p0, Lfqe;->c:Luqe;

    iget-object v1, v1, Luqe;->y:Lob;

    if-eqz v1, :cond_97

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    :cond_97
    iget-object p0, p0, Lfqe;->c:Luqe;

    return-object p0
.end method
