.class public Ll/eqw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile a:Z


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

.method public static a(Ljava/lang/String;)Ll/fzv;
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gzv;->e()Ll/gzv;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Ll/gzv;->a(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/fzv;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/fzv;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    new-instance v0, Lcom/immomo/momo/mulog/exception/MULogIllegalParamsException;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, " has not registered"

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-direct {v0, p0}, Lcom/immomo/momo/mulog/exception/MULogIllegalParamsException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw v0

    .line 46
    :cond_1
    new-instance p0, Lcom/immomo/momo/mulog/exception/MULogIllegalParamsException;

    .line 47
    .line 48
    const-string v0, "business should not be null"

    .line 49
    .line 50
    invoke-direct {p0, v0}, Lcom/immomo/momo/mulog/exception/MULogIllegalParamsException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p0
.end method

.method public static b(Landroid/app/Application;Ll/fqw;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    sget-boolean v0, Ll/eqw;->a:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/eqw;->c(Landroid/content/Context;Ll/fqw;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/gqw;->n(Landroid/content/Context;Ll/fqw;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/jqw;->e(Landroid/content/Context;Ll/fqw;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/yy0;->c(Landroid/app/Application;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    sput-boolean p0, Ll/eqw;->a:Z

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "already init"

    .line 26
    .line 27
    invoke-static {p0}, Ll/gqw;->s(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    new-instance p0, Lcom/immomo/momo/mulog/exception/MULogIllegalParamsException;

    .line 32
    .line 33
    const-string p1, "context is null or config is null"

    .line 34
    .line 35
    invoke-direct {p0, p1}, Lcom/immomo/momo/mulog/exception/MULogIllegalParamsException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p0
.end method

.method private static c(Landroid/content/Context;Ll/fqw;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Ll/fqw;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p1}, Lcom/cosmos/mdlog/MDLog;->setLevel(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    sget-object p1, Ll/jv0;->a:Landroid/content/Context;

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-static {p0}, Ll/jv0;->d(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method
