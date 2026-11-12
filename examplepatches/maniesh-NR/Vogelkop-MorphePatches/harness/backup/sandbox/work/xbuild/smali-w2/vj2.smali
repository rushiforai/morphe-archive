.class public final Lvj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldjn;


# instance fields
.field public final a:Lumi;

.field public final b:Ljjn;

.field public final c:Ljjn;

.field public final d:Lt1;

.field public final e:Ljava/util/ArrayDeque;

.field public f:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ljjn;Ljjn;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lvj2;->e:Ljava/util/ArrayDeque;

    iput-object p2, p0, Lvj2;->a:Lumi;

    iput-object p3, p0, Lvj2;->b:Ljjn;

    iput-object p4, p0, Lvj2;->c:Ljjn;

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->u:Lt1;

    iput-object p1, p0, Lvj2;->d:Lt1;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V
    .registers 6

    iget-object v0, p0, Lvj2;->c:Ljjn;

    invoke-virtual {v0}, Ljjn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldjn;

    new-instance v1, Ltj2;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, p2, v2}, Ltj2;-><init>(Lvj2;Lcom/opera/api/Callback;Lcom/opera/api/Callback;B)V

    invoke-interface {v0, v1, p2}, Ldjn;->b(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final b(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V
    .registers 6

    iget-object v0, p0, Lvj2;->c:Ljjn;

    invoke-virtual {v0}, Ljjn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldjn;

    new-instance v1, Ltj2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, p2, v2}, Ltj2;-><init>(Lvj2;Lcom/opera/api/Callback;Lcom/opera/api/Callback;B)V

    invoke-interface {v0, v1, p2}, Ldjn;->b(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final c(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .registers 10

    iget-object v0, p0, Lvj2;->e:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_11

    new-instance p0, Landroid/util/Pair;

    invoke-direct {p0, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    return-void

    :cond_11
    iget-wide v1, p0, Lvj2;->f:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_27

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    cmp-long v1, v1, v5

    if-lez v1, :cond_25

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_25
    iput-wide v3, p0, Lvj2;->f:J

    :cond_27
    iget-object v1, p0, Lvj2;->b:Ljjn;

    iget-object v1, v1, Ljjn;->b:Lojn;

    iget-object v1, v1, Lojn;->a:Lfp1;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    cmp-long v2, v3, v5

    if-lez v2, :cond_39

    const v2, 0x7f140c7b

    goto :goto_3c

    :cond_39
    const v2, 0x7f14131c

    :goto_3c
    new-instance v3, Landroid/util/Pair;

    invoke-direct {v3, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    new-instance p1, Lkj2;

    new-instance p2, Leme;

    invoke-direct {p2, p0}, Leme;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, p0, v1, v2, p2}, Lkj2;-><init>(Lvj2;Landroid/app/Activity;ILeme;)V

    invoke-virtual {p1}, Lsj2;->e()V

    return-void
.end method
