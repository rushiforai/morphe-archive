.class public Ll/y5l0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z = false

.field public static b:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->builder()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, ""

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-object v4, p1

    .line 10
    move-object v5, p2

    .line 11
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->useCountryAccountBackTemplate(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->build()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string v0, ""

    .line 45
    .line 46
    :goto_0
    sput-object v0, Ll/y5l0;->b:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->builder()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1, p1, p0, v0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->useCountryTemplate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->build()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static c()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/y5l0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string v0, ""

    .line 45
    .line 46
    :goto_0
    sput-object v0, Ll/y5l0;->b:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->builder()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->setIdName(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->setIdNumber(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p2, p3, v0, p4}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->useServerTemplate(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->build()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public static e(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p0}, Ll/y5l0;->f(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/CharSequence;

    .line 24
    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 34
    .line 35
    iget-object v0, v0, Ll/dkb;->J3:Ll/wyd0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string v0, ""

    .line 45
    .line 46
    :goto_0
    sput-object v0, Ll/y5l0;->b:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->builder()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1, p1, p0, v0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->useCoreTemplate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$VerificationTokenRequestParamBuilder;->build()Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public static g()V
    .locals 1
    .annotation build Lorg/jetbrains/annotations/TestOnly;
    .end annotation

    .line 1
    sget-boolean v0, Ll/y5l0;->a:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    sput-boolean v0, Ll/y5l0;->a:Z

    .line 6
    .line 7
    return-void
.end method
