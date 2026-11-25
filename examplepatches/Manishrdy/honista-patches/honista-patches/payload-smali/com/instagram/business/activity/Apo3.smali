.class public Lcom/instagram/business/activity/Apo3;
.super Linfo/my/app/common/base/PasswordAwareBaseActivity;

.method public final K()V
    .locals 2

    const/4 v0, 0x1

    invoke-static {p0, v0}, LX/qغ乆لءлΚСλйЗ丧ю两ωθ乧乄ξυ並书乜ح;->m1(Landroid/content/Context;Z)V

    const/4 v0, -0x1

    invoke-static {p0, v0}, LX/qغ乆لءлΚСλйЗ丧ю两ωθ乧乄ξυ並书乜ح;->j2(Landroid/content/Context;I)V

    invoke-static {}, LX/SamsungChoreographerFix;->apply()V

    invoke-direct {p0}, Lcom/instagram/business/activity/Apo3;->M()V

    const-string v0, "HonistaInit"

    const-string v1, "init gate ready"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final q()V
    .locals 6

    const/4 v0, 0x1

    :try_start_0
    invoke-static {p0}, LX/fκбДСыЯЮМχΞκ両ξΒذ丏丞д乕乓إ乨α;->b(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/instagram/business/activity/Apo3;->L()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :goto_0

    goto :goto_0

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Landroid/app/Activity;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const v2, 0xc3501

    invoke-static {v2}, LX/Rd;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ClassLoader;

    const v3, 0x61a8f

    invoke-static {v3}, LX/Rd;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v3, v0, [Ljava/lang/Object;

    const-string v5, ""

    aput-object v5, v3, v2

    invoke-virtual {v1, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/Call;

    iput-object v1, p0, Lcom/instagram/business/activity/Apo3;->a:Lokhttp3/Call;

    new-instance v2, Lcom/instagram/business/activity/Apo3$a;

    invoke-direct {v2, p0}, Lcom/instagram/business/activity/Apo3$a;-><init>(Lcom/instagram/business/activity/Apo3;)V

    invoke-interface {v1, v2}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v5

    const-string v1, "HonistaInit"

    const-string v2, "startup request unavailable, skipping to main"

    invoke-static {v1, v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/instagram/business/activity/Apo3;->K()V

    :cond_1
    :goto_0
    return-void
.end method

.method private s()V
    .locals 0

    invoke-virtual {p0}, Lcom/instagram/business/activity/Apo3;->K()V

    return-void
.end method
