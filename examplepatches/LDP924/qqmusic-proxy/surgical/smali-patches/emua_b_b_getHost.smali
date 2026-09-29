.method public getHost()Ljava/lang/String;
    .registers 5

    sget-object v0, Lcom/tencent/qqmusic/sword/SwordSwitches;->switches3:[B
    if-eqz v0, :cond_1e
    const/16 v1, 0x401
    aget-byte v0, v0, v1
    shr-int/lit8 v0, v0, 0x6
    and-int/lit8 v0, v0, 0x1
    if-lez v0, :cond_1e
    const/4 v0, 0x0
    const/16 v1, 0x778f
    invoke-static {v0, v4, v1}, Lcom/tencent/qqmusic/sword/SwordProxy;->proxyOneArg(Ljava/lang/Object;Ljava/lang/Object;I)Lcom/tencent/qqmusic/sword/SwordProxyResult;
    move-result-object v0
    iget-boolean v1, v0, Lcom/tencent/qqmusic/sword/SwordProxyResult;->isSupported:Z
    if-eqz v1, :cond_1e
    iget-object v0, v0, Lcom/tencent/qqmusic/sword/SwordProxyResult;->result:Ljava/lang/Object;
    check-cast v0, Ljava/lang/String;
    return-object v0

    :cond_1e
    invoke-static {}, Lcom/tencent/qqmusiccommon/appconfig/CgiUtil;->c()I
    move-result v0
    if-nez v0, :cond_28

    # ↓ 反射调 ServerHost.t_y_qq_com()（纯反射链：主 dex method_ids 满格 65536 不能新增任何引用，
    #   forName/getMethod/invoke 全是主 dex 已有 method id，零新增），失败 catch 回落官方域
    :try_start_0
    const-string/jumbo v0, "app.patches.qqmusic.ldp924.ServerHost"
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v0
    const-string v1, "t_y_qq_com"
    const/4 v2, 0x0
    new-array v3, v2, [Ljava/lang/Class;
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
    new-array v1, v2, [Ljava/lang/Object;
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    return-object v0

    :catch_0
    const-string/jumbo v0, "t.y.qq.com"
    return-object v0

    :cond_28
    const-string/jumbo v0, "ut.y.qq.com "
    return-object v0
.end method
