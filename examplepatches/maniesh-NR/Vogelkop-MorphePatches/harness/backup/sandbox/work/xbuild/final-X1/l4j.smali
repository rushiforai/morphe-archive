.class public final Ll4j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# static fields
.field public static final c:Ljava/util/HashSet;


# instance fields
.field public final a:Lyv4;

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Ll4j;->c:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lyv4;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lyv4;-><init>(B)V

    iput-object v0, p0, Ll4j;->a:Lyv4;

    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .registers 2

    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .registers 6

    sget-object v0, Ll4j;->c:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_d

    return-void

    :cond_d
    iget p1, p0, Ll4j;->b:I

    if-nez p1, :cond_23

    iget-object p1, p0, Ll4j;->a:Lyv4;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-wide v2, p1, Lyv4;->b:J

    sub-long/2addr v0, v2

    invoke-virtual {p1}, Lyv4;->l()Lsql;

    move-result-object p1

    iput-wide v0, p1, Lsql;->a:J

    :cond_23
    iget p1, p0, Ll4j;->b:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Ll4j;->b:I

    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .registers 14

    sget-object v0, Ll4j;->c:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9f

    iget v0, p0, Ll4j;->b:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iput v0, p0, Ll4j;->b:I

    if-nez v0, :cond_9f

    iget-object p0, p0, Ll4j;->a:Lyv4;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-wide v4, p0, Lyv4;->b:J

    sub-long/2addr v2, v4

    invoke-virtual {p0}, Lyv4;->l()Lsql;

    move-result-object v0

    iget-wide v4, v0, Lsql;->a:J

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-nez v8, :cond_2e

    move-wide v2, v6

    goto :goto_43

    :cond_2e
    sub-long/2addr v2, v4

    iput-wide v6, v0, Lsql;->a:J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    iget-wide v10, p0, Lyv4;->b:J

    sub-long/2addr v8, v4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lyv4;->b:J

    const-wide/32 v4, 0xf4240

    div-long/2addr v2, v4

    :goto_43
    const-wide/16 v4, 0x3e8

    div-long v4, v2, v4

    const-wide/32 v8, 0x7fffffff

    cmp-long p0, v4, v8

    if-gtz p0, :cond_52

    cmp-long p0, v2, v6

    if-gez p0, :cond_53

    :cond_52
    move-wide v2, v6

    :cond_53
    cmp-long p0, v2, v6

    if-lez p0, :cond_9f

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-eqz p1, :cond_9f

    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx56;->A(Lzpa;)Luc0;

    move-result-object p1

    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-eqz v5, :cond_88

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_88

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_95

    :cond_88
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v4, v1, v5}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, v4, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_95
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    :cond_9f
    return-void
.end method
