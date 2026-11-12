.class public final Ldyf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lay;

.field public final c:Lud7;

.field public final d:Lbyf;

.field public final e:Ljava/util/WeakHashMap;

.field public f:Lcue;

.field public final g:Lh7f;

.field public h:Lc6j;

.field public i:Ljava/lang/ref/WeakReference;

.field public j:Ljava/lang/ref/WeakReference;

.field public final k:Lju2;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lay;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ldyf;->b:Lay;

    new-instance v0, Lud7;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lud7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ldyf;->c:Lud7;

    new-instance v0, Lbyf;

    invoke-direct {v0, p0}, Lbyf;-><init>(Ldyf;)V

    iput-object v0, p0, Ldyf;->d:Lbyf;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Ldyf;->e:Ljava/util/WeakHashMap;

    sget-object v0, Lcue;->b:Lcue;

    iput-object v0, p0, Ldyf;->f:Lcue;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ldyf;->g:Lh7f;

    iput-object p1, p0, Ldyf;->a:Landroid/content/Context;

    new-instance p1, Lju2;

    invoke-direct {p1, p0}, Lju2;-><init>(Ldyf;)V

    iput-object p1, p0, Ldyf;->k:Lju2;

    return-void
.end method


# virtual methods
.method public final a()Lc6j;
    .registers 2

    iget-object v0, p0, Ldyf;->h:Lc6j;

    if-nez v0, :cond_1c

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Ldyf;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v0

    invoke-virtual {v0}, Lfqe;->c()Luqe;

    move-result-object v0

    invoke-virtual {v0}, Luqe;->h()Lc6j;

    move-result-object v0

    iput-object v0, p0, Ldyf;->h:Lc6j;

    :cond_1c
    return-object v0
.end method

.method public final b()Lzxf;
    .registers 3

    iget-object v0, p0, Ldyf;->i:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzxf;

    if-eqz v0, :cond_d

    return-object v0

    :cond_d
    new-instance v0, Lcyf;

    invoke-direct {v0, p0}, Lcyf;-><init>(Ldyf;)V

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Ldyf;->i:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method public final c()V
    .registers 2

    iget-object p0, p0, Ldyf;->g:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzxf;

    invoke-virtual {v0}, Lzxf;->g()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final d()V
    .registers 6

    iget-object v0, p0, Ldyf;->g:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzxf;

    invoke-virtual {v1}, Lzxf;->f()Z

    move-result v1

    if-eqz v1, :cond_6

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Ldyf;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v0

    invoke-virtual {v0}, Lfue;->d()V

    iget-object v0, v0, Lfue;->a:Lcue;

    goto :goto_2e

    :cond_2c
    sget-object v0, Lcue;->b:Lcue;

    :goto_2e
    iget-object v1, p0, Ldyf;->f:Lcue;

    if-eq v1, v0, :cond_58

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Ldyf;->d:Lbyf;

    if-ne v1, v2, :cond_47

    iget-object v1, p0, Ldyf;->h:Lc6j;

    if-eqz v1, :cond_47

    iget-object v1, v1, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iput-object v3, p0, Ldyf;->h:Lc6j;

    :cond_47
    iput-object v0, p0, Ldyf;->f:Lcue;

    sget-object v1, Lcue;->c:Lcue;

    if-ne v0, v1, :cond_51

    invoke-virtual {p0}, Ldyf;->a()Lc6j;

    move-result-object v3

    :cond_51
    if-eqz v3, :cond_58

    iget-object p0, v3, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {p0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_58
    return-void
.end method
