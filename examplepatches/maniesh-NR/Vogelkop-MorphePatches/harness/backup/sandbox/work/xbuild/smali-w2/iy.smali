.class public final Liy;
.super Lnrl;
.source "SourceFile"


# instance fields
.field public e:Z

.field public final synthetic f:Li5o;


# direct methods
.method public constructor <init>(Li5o;)V
    .registers 2

    iput-object p1, p0, Liy;->f:Li5o;

    const/16 p1, 0x1a

    invoke-direct {p0, p1}, Lnrl;-><init>(B)V

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .registers 7

    invoke-super {p0, p1}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_77

    iget-boolean v0, p0, Liy;->e:Z

    if-nez v0, :cond_77

    const/4 v0, 0x1

    iput-boolean v0, p0, Liy;->e:Z

    iget-object p0, p0, Liy;->f:Li5o;

    iget-object v1, p0, Li5o;->d:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-static {v1}, Lv1;->u(Landroid/content/Context;)Lv1;

    new-instance v2, Lab;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object v3

    new-instance v4, Lmz;

    invoke-direct {v4, v1, v2}, Lmz;-><init>(Landroid/content/Context;Lab;)V

    new-instance v2, Llz;

    invoke-direct {v2, v1, v3, v4}, Llz;-><init>(Landroid/content/Context;Le00;Lmz;)V

    sget-object v1, Lcak;->d:Lavj;

    const/4 v1, 0x3

    invoke-static {v1, v2}, Lavj;->g(ILjava/lang/Runnable;)V

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 v1, 0x400

    invoke-virtual {p0, v1}, Lwnh;->a(I)Z

    move-result p0

    if-nez p0, :cond_59

    sget-object p0, Lava;->a:Lcva;

    new-instance v0, Lc4;

    const/16 v1, 0xd

    invoke-direct {v0, v4, v1}, Lc4;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v1, 0xbb8

    invoke-virtual {p0, v0, v1, v2}, Lcva;->b(Ljava/lang/Runnable;J)V

    return-object p1

    :cond_59
    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-static {v4, p0}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_77

    iput-boolean v0, v4, Lmz;->f:Z

    iget-object p0, v4, Lmz;->c:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_77

    invoke-virtual {v4}, Lmz;->a()Lnz;

    move-result-object p0

    invoke-virtual {v4, p0}, Lmz;->b(Lnz;)V

    :cond_77
    return-object p1
.end method
