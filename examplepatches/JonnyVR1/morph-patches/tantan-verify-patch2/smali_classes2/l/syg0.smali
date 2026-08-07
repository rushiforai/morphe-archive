.class public final Ll/syg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/elg0;


# instance fields
.field public final synthetic a:Ll/f0h0;


# direct methods
.method public constructor <init>(Ll/f0h0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/syg0;->a:Ll/f0h0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "isCoreInstalled error:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "SudGameLoadingStageLoadCore"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/syg0;->a:Ll/f0h0;

    .line 21
    .line 22
    iget-boolean v0, p0, Ll/f0h0;->e:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/f0h0;->a:Ll/mrg0;

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    const/4 v1, -0x1

    .line 30
    invoke-virtual {p0, v0, v1, p1}, Ll/mrg0;->b(IILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "isCoreInstalled isInstalled=true  abi:"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "SudGameLoadingStageLoadCore"

    .line 8
    .line 9
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    sget-object v1, Ll/f0h0;->f:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {v1, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/syg0;->a:Ll/f0h0;

    .line 22
    .line 23
    iget-boolean p1, p0, Ll/f0h0;->e:Z

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/f0h0;->c:Ltech/sud/gip/core/GameInfo;

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    iput-object v0, p1, Ltech/sud/gip/core/GameInfo;->etCorePath:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p0, p0, Ll/f0h0;->a:Ll/mrg0;

    .line 34
    .line 35
    const/4 p1, 0x2

    .line 36
    invoke-virtual {p0, p1}, Ll/mrg0;->a(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method
