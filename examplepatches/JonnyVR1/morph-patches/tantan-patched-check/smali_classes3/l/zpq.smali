.class public Ll/zpq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/app/PutongAct;

.field public c:Lcom/p1/mobile/putong/app/web/WebViewX;

.field public final d:Ll/gqq;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/p1/mobile/putong/app/web/WebViewX;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/zpq;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Ll/zpq;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    iput-object p3, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 9
    .line 10
    new-instance p2, Ll/ypq;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/ypq;-><init>(Ll/zpq;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/app/web/WebViewX;->setCurrentUrlCallback(Lcom/p1/mobile/putong/app/web/WebViewX$a;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/gqq;

    .line 19
    .line 20
    invoke-direct {p2, p1, p3}, Ll/gqq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/zpq;->d:Ll/gqq;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Ll/zpq;Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zpq;->i(Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic b(Ll/zpq;Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zpq;->j(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final c([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zpq;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    iget-object v1, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zpq;->a:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_2

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-nez p0, :cond_1

    .line 19
    .line 20
    const-string p0, ""

    .line 21
    .line 22
    :cond_1
    new-instance v2, Ll/aqq;

    .line 23
    .line 24
    invoke-direct {v2, v0, v1, p0}, Ll/aqq;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    array-length p0, p1

    .line 28
    const/4 v0, 0x1

    .line 29
    add-int/2addr p0, v0

    .line 30
    new-array p0, p0, [Ljava/lang/Object;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    aput-object v2, p0, v1

    .line 34
    .line 35
    array-length v2, p1

    .line 36
    invoke-static {p1, v1, p0, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public canIUse(Ljava/lang/String;)Z
    .locals 6
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/cqq;->c()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Class;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    array-length v2, v0

    .line 31
    :goto_0
    if-ge v1, v2, :cond_0

    .line 32
    .line 33
    aget-object v3, v0, v1

    .line 34
    .line 35
    const-class v4, Ll/lkq;

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    if-eqz v5, :cond_1

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ll/lkq;

    .line 48
    .line 49
    invoke-interface {v3}, Ll/lkq;->key()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-eqz v3, :cond_1

    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return v1
.end method

.method public d()Ll/gqq;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zpq;->d:Ll/gqq;

    .line 2
    .line 3
    return-object p0
.end method

.method public dispatch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/zpq;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/zpq;->e:Ljava/lang/String;

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p2, "isActInvalid"

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, v1}, Ll/zpq;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-object v2

    .line 17
    :cond_0
    invoke-static {v1}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v1, "Dispatch JsBridge not in token whitelist, url: "

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/zpq;->e:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p0, ", key: "

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, ", methodParams: "

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ll/ntp0;->f(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-object v2

    .line 59
    :cond_1
    invoke-static {p1, p2}, Ll/dqq;->c(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2, p1, v7}, Ll/cqq;->g(Ljava/lang/String;[Ljava/lang/Object;)Ll/ve20;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    if-nez v4, :cond_2

    .line 72
    .line 73
    const-string p2, "methodHolder"

    .line 74
    .line 75
    iget-object v0, p0, Ll/zpq;->e:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p0, p1, p2, v0}, Ll/zpq;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-object v2

    .line 81
    :cond_2
    :try_start_0
    invoke-virtual {p0, v4}, Ll/zpq;->e(Ll/ve20;)Ll/lf2;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    iget-boolean p2, v4, Ll/ve20;->c:Z

    .line 86
    .line 87
    if-eqz p2, :cond_3

    .line 88
    .line 89
    new-instance v3, Ll/xpq;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 90
    .line 91
    move-object v6, v5

    .line 92
    move-object v8, v7

    .line 93
    move-object v7, p1

    .line 94
    move-object v5, v4

    .line 95
    move-object v4, p0

    .line 96
    :try_start_1
    invoke-direct/range {v3 .. v8}, Ll/xpq;-><init>(Ll/zpq;Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 97
    .line 98
    .line 99
    move-object p0, v3

    .line 100
    move-object v3, v4

    .line 101
    move-object v4, v5

    .line 102
    move-object v6, v7

    .line 103
    move-object v7, v8

    .line 104
    :try_start_2
    invoke-static {p0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 105
    .line 106
    .line 107
    return-object v2

    .line 108
    :catch_0
    move-exception v0

    .line 109
    :goto_0
    move-object p0, v0

    .line 110
    goto :goto_1

    .line 111
    :catch_1
    move-exception v0

    .line 112
    move-object v3, v4

    .line 113
    move-object v4, v5

    .line 114
    move-object v6, v7

    .line 115
    move-object v7, v8

    .line 116
    goto :goto_0

    .line 117
    :catch_2
    move-exception v0

    .line 118
    move-object v3, p0

    .line 119
    move-object v6, p1

    .line 120
    goto :goto_0

    .line 121
    :cond_3
    move-object v3, p0

    .line 122
    move-object v6, p1

    .line 123
    const/4 v8, 0x0

    .line 124
    invoke-virtual/range {v3 .. v8}, Ll/zpq;->g(Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 128
    return-object p0

    .line 129
    :goto_1
    invoke-virtual {v3, p0, v6, v7, v4}, Ll/zpq;->f(Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;Ll/ve20;)V

    .line 130
    .line 131
    .line 132
    return-object v2
.end method

.method public final e(Ll/ve20;)Ll/lf2;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 6
    .line 7
    iget-object v2, p1, Ll/ve20;->b:Ljava/lang/Class;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/cqq;->d(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/Class;)Ll/lf2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v1, p1, Ll/ve20;->b:Ljava/lang/Class;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    instance-of v2, v1, Ll/lf2;

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    check-cast v1, Ll/lf2;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/lf2;->b()V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object p0, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 35
    .line 36
    iget-object p1, p1, Ll/ve20;->b:Ljava/lang/Class;

    .line 37
    .line 38
    invoke-virtual {v0, p0, p1, v1}, Ll/cqq;->a(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/Class;Ll/lf2;)V

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_0
    return-object v0
.end method

.method public final f(Ljava/lang/Exception;Ljava/lang/String;[Ljava/lang/Object;Ll/ve20;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "key = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p2, ",params = "

    .line 12
    .line 13
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p2, ",url = "

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/zpq;->e:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, ",clazz = "

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    if-eqz p4, :cond_0

    .line 35
    .line 36
    iget-object p0, p4, Ll/ve20;->b:Ljava/lang/Class;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p0, ",msg = "

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p2, Ljava/lang/Exception;

    .line 66
    .line 67
    invoke-direct {p2, p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final g(Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p4}, Ll/zpq;->c([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    if-nez p4, :cond_1

    .line 8
    .line 9
    if-nez p5, :cond_0

    .line 10
    .line 11
    const-string p1, "paramsWithContext null"

    .line 12
    .line 13
    iget-object p2, p0, Ll/zpq;->e:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p3, p1, p2}, Ll/zpq;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-object v0

    .line 19
    :cond_1
    iget-object p1, p1, Ll/ve20;->a:Ljava/lang/reflect/Method;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_2

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_2
    if-nez p5, :cond_3

    .line 37
    .line 38
    const-string p1, "invokeJsBridgeMethod end null"

    .line 39
    .line 40
    iget-object p2, p0, Ll/zpq;->e:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, p3, p1, p2}, Ll/zpq;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    return-object v0
.end method

.method public final h()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zpq;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final synthetic i(Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 6

    .line 1
    const/4 v5, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    :try_start_0
    invoke-virtual/range {v0 .. v5}, Ll/zpq;->g(Ll/ve20;Ll/lf2;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :catch_0
    return-void
.end method

.method public final synthetic j(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/zpq;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/app/web/WebViewX;->setCurrentUrlCallback(Lcom/p1/mobile/putong/app/web/WebViewX$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/cqq;->e()Ll/cqq;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v2, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ll/cqq;->b(Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iput-object v1, p0, Ll/zpq;->b:Lcom/p1/mobile/putong/app/PutongAct;

    .line 25
    .line 26
    iput-object v1, p0, Ll/zpq;->c:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 27
    .line 28
    return-void
.end method

.method public final l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p0, "getSystemInfo"

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "getAuthorizationHeader"

    .line 10
    .line 11
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-string p0, "getAbHeader"

    .line 18
    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/Exception;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    const-class v1, Ll/cqq;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, " methodName =  "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, " "

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string p1, " url = "

    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const/16 p1, 0x64

    .line 75
    .line 76
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public triggerAction(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zpq;->dispatch(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
