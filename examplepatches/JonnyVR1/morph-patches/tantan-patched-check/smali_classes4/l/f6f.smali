.class public Ll/f6f;
.super Ll/c610;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c610;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "catch"

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ll/c610;->c()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "/"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/f6f;->getEventType()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public d()Ll/x2f;
    .locals 0

    .line 1
    invoke-static {}, Ll/mod;->c()Ll/mod;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Ll/k5f;
    .locals 1

    .line 1
    new-instance v0, Ll/f6f$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f6f$a;-><init>(Ll/f6f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public g(Landroid/content/Context;Ll/x3f;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/c610;->g(Landroid/content/Context;Ll/x3f;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/uu2;->c(Ll/f6f;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/c610;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public getEventType()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "exception"

    .line 2
    .line 3
    return-object p0
.end method
