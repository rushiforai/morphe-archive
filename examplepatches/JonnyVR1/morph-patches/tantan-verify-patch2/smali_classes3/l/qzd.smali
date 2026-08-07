.class public Ll/qzd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/zqe0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zqe0<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ljava/lang/String;

.field public static c:Ljava/lang/String;

.field public static d:Ljava/lang/String;

.field public static e:Ljava/lang/String;

.field public static f:Ljava/lang/String;

.field public static g:Ljava/lang/String;

.field public static h:Ljava/lang/String;

.field public static i:Ljava/lang/String;

.field public static j:Ljava/lang/String;

.field public static k:Ljava/lang/String;

.field public static l:Ljava/lang/String;

.field public static m:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/wbg0;->a()Ll/zqe0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/qzd;->a:Ll/zqe0;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    sput-object v0, Ll/qzd;->b:Ljava/lang/String;

    .line 13
    .line 14
    sput-object v0, Ll/qzd;->c:Ljava/lang/String;

    .line 15
    .line 16
    sput-object v0, Ll/qzd;->d:Ljava/lang/String;

    .line 17
    .line 18
    sput-object v0, Ll/qzd;->e:Ljava/lang/String;

    .line 19
    .line 20
    sput-object v0, Ll/qzd;->f:Ljava/lang/String;

    .line 21
    .line 22
    sput-object v0, Ll/qzd;->g:Ljava/lang/String;

    .line 23
    .line 24
    sput-object v0, Ll/qzd;->h:Ljava/lang/String;

    .line 25
    .line 26
    sput-object v0, Ll/qzd;->i:Ljava/lang/String;

    .line 27
    .line 28
    sput-object v0, Ll/qzd;->j:Ljava/lang/String;

    .line 29
    .line 30
    sput-object v0, Ll/qzd;->k:Ljava/lang/String;

    .line 31
    .line 32
    sput-object v0, Ll/qzd;->l:Ljava/lang/String;

    .line 33
    .line 34
    sput-object v0, Ll/qzd;->m:Ljava/lang/String;

    .line 35
    .line 36
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

.method public static a()Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    sget-object v0, Ll/qzd;->c:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/qzd;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/jyb;->a:Ljava/nio/charset/Charset;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ljava/util/UUID;->nameUUIDFromBytes([B)Ljava/util/UUID;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/qzd;->c:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    sget-object v0, Ll/qzd;->c:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    sput-object v0, Ll/qzd;->c:Ljava/lang/String;

    .line 32
    .line 33
    :cond_1
    sget-object v0, Ll/qzd;->c:Ljava/lang/String;

    .line 34
    .line 35
    return-object v0
.end method

.method public static b()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qzd;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/qzd;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object v0, Ll/qzd;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method

.method public static c()V
    .locals 2

    .line 1
    sget-object v0, Ll/qzd;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/xn0;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/qzd;->b:Ljava/lang/String;

    .line 10
    .line 11
    sget-object v0, Ll/qzd;->a:Ll/zqe0;

    .line 12
    .line 13
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/zqe0;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qzd;->d:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-static {v0}, Ll/qzd;->k(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/qzd;->d:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/qzd;->d:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
.end method

.method public static e()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qzd;->e:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {v0}, Ll/qzd;->k(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/qzd;->e:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/qzd;->e:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
.end method

.method public static f()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qzd;->f:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0}, Ll/qzd;->k(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/qzd;->f:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/qzd;->f:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
.end method

.method public static g()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qzd;->g:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-static {v0}, Ll/qzd;->l(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/qzd;->g:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/qzd;->g:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
.end method

.method public static h()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qzd;->h:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {v0}, Ll/qzd;->l(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/qzd;->h:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/qzd;->h:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
.end method

.method public static i()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qzd;->i:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0}, Ll/qzd;->l(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/qzd;->i:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/qzd;->i:Ljava/lang/String;

    .line 13
    .line 14
    return-object v0
.end method

.method public static j()Ljava/lang/String;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/qzd;->j:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 6
    .line 7
    const/16 v1, 0x1d

    .line 8
    .line 9
    const-string v2, ""

    .line 10
    .line 11
    if-lt v0, v1, :cond_0

    .line 12
    .line 13
    sput-object v2, Ll/qzd;->j:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sput-object v2, Ll/qzd;->j:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    :goto_0
    sget-object v0, Ll/qzd;->j:Ljava/lang/String;

    .line 19
    .line 20
    return-object v0
.end method

.method public static k(I)Ljava/lang/String;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public static l(I)Ljava/lang/String;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method
