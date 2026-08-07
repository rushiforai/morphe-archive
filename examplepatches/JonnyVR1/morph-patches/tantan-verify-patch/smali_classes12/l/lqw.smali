.class public Ll/lqw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zxl;


# static fields
.field private static a:J


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

.method public static synthetic d(Ll/fzv;)V
    .locals 2

    .line 1
    const-string v0, "offline log --> "

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/fzv;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/gqw;->v(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/fzv;->a:Ll/nqw;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/nqw;->d()Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {p0}, Ll/lqw;->e(Ll/fzv;)[Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v0, p0}, Lcom/mm/mmfile/MMFileHelper;->write(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception p0

    .line 41
    invoke-static {p0}, Ll/gqw;->u(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private static e(Ll/fzv;)[Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fzv;->secondLBusiness:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "null"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v0, v1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object v0, p0, Ll/fzv;->secondLBusiness:Ljava/lang/String;

    .line 14
    .line 15
    :goto_0
    iget-object v2, p0, Ll/fzv;->thirdLBusiness:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    move-object v2, v1

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    iget-object v2, p0, Ll/fzv;->thirdLBusiness:Ljava/lang/String;

    .line 26
    .line 27
    :goto_1
    iget-object v3, p0, Ll/fzv;->b:Ll/nqw;

    .line 28
    .line 29
    if-eqz v3, :cond_2

    .line 30
    .line 31
    invoke-virtual {v3}, Ll/nqw;->d()Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    :cond_2
    iget-object p0, p0, Ll/fzv;->business:Ljava/lang/String;

    .line 40
    .line 41
    filled-new-array {p0, v0, v2, v1}, [Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-wide v2, Ll/lqw;->a:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    const-wide/32 v4, 0x493e0

    .line 10
    .line 11
    .line 12
    cmp-long p0, v2, v4

    .line 13
    .line 14
    if-gez p0, :cond_0

    .line 15
    .line 16
    const-string p0, "appExist, but within five minutes"

    .line 17
    .line 18
    invoke-static {p0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sput-wide v0, Ll/lqw;->a:J

    .line 23
    .line 24
    invoke-static {}, Lcom/mm/mmfile/MMFileHelper;->forceUploadMMFile()V

    .line 25
    .line 26
    .line 27
    const-string p0, "forceUploadFile ..."

    .line 28
    .line 29
    invoke-static {p0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public b(Ll/fzv;)V
    .locals 0
    .param p1    # Ll/fzv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Ll/kqw;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/kqw;-><init>(Ll/fzv;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x5

    .line 7
    invoke-static {p1, p0}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method
