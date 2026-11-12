.class public final Lku3;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lc7d;
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final a:Lhu3;

.field public final b:Liu3;

.field public final c:Lju3;

.field public final d:Landroid/os/Handler;

.field public final synthetic e:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lku3;->e:Lcom/opera/android/BrowserActivity;

    new-instance p1, Lhu3;

    invoke-direct {p1, p0}, Lhu3;-><init>(Lku3;)V

    iput-object p1, p0, Lku3;->a:Lhu3;

    new-instance p1, Liu3;

    invoke-direct {p1, p0}, Liu3;-><init>(Lku3;)V

    iput-object p1, p0, Lku3;->b:Liu3;

    new-instance p1, Lju3;

    invoke-direct {p1, p0}, Lju3;-><init>(Lku3;)V

    iput-object p1, p0, Lku3;->c:Lju3;

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Lku3;->d:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 3

    iget-object p1, p0, Lku3;->e:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez v0, :cond_13

    const/4 v0, 0x0

    :cond_13
    invoke-static {p1, v0}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    invoke-static {p1, p0}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    return-void
.end method

.method public final c(I)V
    .registers 3

    iget-object p0, p0, Lku3;->e:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->Q0:Lvu3;

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_d

    const/4 p1, 0x0

    goto :goto_e

    :cond_d
    const/4 p1, 0x1

    :goto_e
    iget-object p0, p0, Lvu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0, p1}, Lkfo;->d0(Landroid/app/Activity;I)V

    return-void
.end method

.method public final handleMessage(Landroid/os/Message;)Z
    .registers 6

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eq p1, v1, :cond_33

    if-ne p1, v0, :cond_67

    iget-object p0, p0, Lku3;->b:Liu3;

    iget-boolean p1, p0, Liu3;->a:Z

    if-eqz p1, :cond_67

    iget-boolean p1, p0, Liu3;->b:Z

    if-eqz p1, :cond_67

    iget-boolean p1, p0, Liu3;->c:Z

    if-eqz p1, :cond_67

    iget-boolean p1, p0, Liu3;->d:Z

    if-nez p1, :cond_67

    iput-boolean v1, p0, Liu3;->d:Z

    iget-object p0, p0, Liu3;->e:Lku3;

    iget-object p1, p0, Lku3;->e:Lcom/opera/android/BrowserActivity;

    iget-object v0, p1, Lcom/opera/android/BrowserActivity;->g1:Lou3;

    iget-object p0, p0, Lku3;->c:Lju3;

    iget-wide v1, p0, Lju3;->d:J

    iput-wide v1, v0, Lou3;->h:J

    invoke-virtual {p1, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->x0()Lwy;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    goto :goto_67

    :cond_33
    iget-object p0, p0, Lku3;->a:Lhu3;

    iget-object p1, p0, Lhu3;->d:Ljava/lang/Object;

    check-cast p1, Lku3;

    iget-object v2, p1, Lku3;->e:Lcom/opera/android/BrowserActivity;

    iget-boolean v3, p0, Lhu3;->a:Z

    if-eqz v3, :cond_67

    iget-boolean v3, p0, Lhu3;->b:Z

    if-eqz v3, :cond_67

    iget-boolean v3, p0, Lhu3;->c:Z

    if-nez v3, :cond_67

    iput-boolean v1, p0, Lhu3;->c:Z

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    iget-object v3, v3, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    invoke-static {p0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object p0

    invoke-static {v2, p0}, Lfsp;->u(Landroid/app/Activity;Lxi5;)V

    iget-object p0, p1, Lku3;->b:Liu3;

    iput-boolean v1, p0, Liu3;->a:Z

    iget-object p0, p1, Lku3;->d:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_67
    :goto_67
    const/4 p0, 0x0

    return p0
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    invoke-static {p0}, Le7d;->c(Lc7d;)V

    iget-object p0, p0, Lku3;->c:Lju3;

    iget-object p1, p0, Lju3;->a:Loml;

    const/4 v0, 0x0

    if-eqz p1, :cond_14

    invoke-virtual {p1, v0}, Loml;->cancel(Z)Z

    :cond_14
    iget-boolean p1, p0, Lju3;->c:Z

    if-eqz p1, :cond_2b

    iput-boolean v0, p0, Lju3;->c:Z

    sget-object p1, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iget-object p1, p1, Lcom/opera/android/browser/SessionStore;->e:Lnrl;

    iget-object p1, p1, Lnrl;->b:Ljava/lang/Object;

    check-cast p1, Lvl9;

    iget-object p1, p1, Lvl9;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    if-eqz p1, :cond_2b

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_2b
    return-void
.end method

.method public final onSuccess()V
    .registers 8

    iget-object v0, p0, Lku3;->a:Lhu3;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lhu3;->a:Z

    iget-object v0, p0, Lku3;->c:Lju3;

    iget-object v2, v0, Lju3;->e:Lku3;

    iget-object v2, v2, Lku3;->e:Lcom/opera/android/BrowserActivity;

    iget-object v2, v2, Lcom/opera/android/BrowserActivity;->x:Lumi;

    sget-object v3, Lpn7;->b:Lon7;

    const/4 v3, 0x3

    sget-object v4, Lun7;->e:Lun7;

    invoke-static {v3, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    new-instance v5, Loc2;

    const/16 v6, 0x12

    invoke-direct {v5, v0, v6}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v3, v4, v5}, Lfac;->B(Lumi;JLkotlin/jvm/functions/Function0;)Loml;

    move-result-object v2

    iput-object v2, v0, Lju3;->a:Loml;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iput-wide v2, v0, Lju3;->b:J

    iput-boolean v1, v0, Lju3;->c:Z

    sget-object v2, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iget-object v2, v2, Lcom/opera/android/browser/SessionStore;->e:Lnrl;

    invoke-virtual {v2, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    iget-object p0, p0, Lku3;->d:Landroid/os/Handler;

    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method
