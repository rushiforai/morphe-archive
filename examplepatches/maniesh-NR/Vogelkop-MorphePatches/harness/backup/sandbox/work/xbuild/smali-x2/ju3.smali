.class public final Lju3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public a:Loml;

.field public b:J

.field public c:Z

.field public d:J

.field public final synthetic e:Lku3;


# direct methods
.method public constructor <init>(Lku3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lju3;->e:Lku3;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-object v0, p0, Lju3;->e:Lku3;

    iget-object v1, v0, Lku3;->b:Liu3;

    const/4 v2, 0x1

    iput-boolean v2, v1, Liu3;->c:Z

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    iget-wide v3, p0, Lju3;->b:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lju3;->d:J

    iget-object v1, p0, Lju3;->a:Loml;

    const/4 v2, 0x0

    if-eqz v1, :cond_18

    invoke-virtual {v1, v2}, Loml;->cancel(Z)Z

    :cond_18
    iget-boolean v1, p0, Lju3;->c:Z

    if-eqz v1, :cond_2f

    iput-boolean v2, p0, Lju3;->c:Z

    sget-object v1, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iget-object v1, v1, Lcom/opera/android/browser/SessionStore;->e:Lnrl;

    iget-object v1, v1, Lnrl;->b:Ljava/lang/Object;

    check-cast v1, Lvl9;

    iget-object v1, v1, Lvl9;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-eqz v1, :cond_2f

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_2f
    iget-object p0, v0, Lku3;->d:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
