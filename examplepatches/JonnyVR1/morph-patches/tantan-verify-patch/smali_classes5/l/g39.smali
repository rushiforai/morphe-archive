.class public Ll/g39;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 2
    .line 3
    const v1, 0x9c6a

    .line 4
    .line 5
    .line 6
    if-eq v0, v1, :cond_3

    .line 7
    .line 8
    const v1, 0x9c6c

    .line 9
    .line 10
    .line 11
    if-eq v0, v1, :cond_3

    .line 12
    .line 13
    const v1, 0x9c6d

    .line 14
    .line 15
    .line 16
    if-ne v0, v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const v1, 0x3d0bbd

    .line 20
    .line 21
    .line 22
    if-ne v0, v1, :cond_2

    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I5()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    const-string p0, "\u7531\u4e8e\u5bf9\u65b9\u9690\u79c1\u8bbe\u7f6e\uff0c\u6682\u65f6\u65e0\u6cd5\u544a\u767d"

    .line 37
    .line 38
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->D2:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_3
    :goto_0
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 53
    .line 54
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v1, 0x9d6d

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->p5:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const v1, 0x9d74

    .line 15
    .line 16
    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    const-string p0, "\u5bf9\u65b9\u88ab\u4f60\u62c9\u9ed1\uff0c\u4e0d\u80fd\u7ee7\u7eed\u4e92\u52a8"

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const v1, 0x9d75

    .line 26
    .line 27
    .line 28
    if-ne v0, v1, :cond_2

    .line 29
    .line 30
    const-string p0, "\u5bf9\u65b9\u8bbe\u7f6e\u4e86\u9690\u79c1\u6743\u9650\uff0c\u4e0d\u80fd\u7ee7\u7eed\u4e92\u52a8"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static c(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    invoke-static {p0}, Ll/g39;->a(Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 16
    .line 17
    invoke-static {p0}, Ll/g39;->b(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9dcf

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public static e(Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 2
    .line 3
    const v0, 0x9d91

    .line 4
    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
