.class public final synthetic Lqkf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/firebase/OperaFirebaseMessagingService;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/firebase/OperaFirebaseMessagingService;B)V
    .registers 3

    iput-byte p2, p0, Lqkf;->a:B

    iput-object p1, p0, Lqkf;->b:Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lqkf;->a:B

    iget-object p0, p0, Lqkf;->b:Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    packed-switch v0, :pswitch_data_66

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object p0

    iget-object v0, p0, Lslk;->b:Ltmk;

    iget-object v0, v0, Ltmk;->a:Lmcj;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v3, "last_push"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lslk;->b(Ljava/lang/Runnable;)V

    return-void

    :pswitch_37
    sget v0, Lcom/opera/android/firebase/OperaFirebaseMessagingService;->b:I

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    iget-object p0, p0, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_53
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_64

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc59;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lc59;->f(Z)V

    goto :goto_53

    :cond_64
    return-void

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
