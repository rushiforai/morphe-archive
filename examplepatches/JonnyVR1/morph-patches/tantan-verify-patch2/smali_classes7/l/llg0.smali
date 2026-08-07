.class public final Ll/llg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wfg0;


# instance fields
.field public final synthetic a:Ll/klg0;

.field public final synthetic b:Ll/oqg0;

.field public final synthetic c:Ll/vog0;


# direct methods
.method public constructor <init>(Ll/vog0;Ll/klg0;Ll/oqg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/llg0;->c:Ll/vog0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/llg0;->a:Ll/klg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/llg0;->b:Ll/oqg0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic h(Ljava/lang/String;Ll/klg0;ILl/bxg0;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onDownloadFailure error:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "RealSudGamePackageManager"

    .line 16
    .line 17
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/vog0;->d:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1, p2, p0, p3}, Ll/klg0;->e(ILjava/lang/String;Ll/bxg0;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic i(Ll/klg0;)V
    .locals 2

    .line 1
    const-string v0, "RealSudGamePackageManager"

    .line 2
    .line 3
    const-string v1, "onDownloadStart"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/vog0;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0}, Ll/klg0;->a()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic j(Ll/klg0;JJ)V
    .locals 0

    .line 1
    invoke-interface {p0, p1, p2, p3, p4}, Ll/klg0;->d(JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/klg0;JJLtech/sud/gip/core/PkgDownloadStatus;)V
    .locals 0

    .line 1
    invoke-interface/range {p0 .. p5}, Ll/klg0;->c(JJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/llg0;->a:Ll/klg0;

    .line 2
    .line 3
    new-instance v0, Ll/qig0;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/qig0;-><init>(Ll/klg0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final b()LSudabstract/Sudfor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/llg0;->b:Ll/oqg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/oqg0;->b:LSudabstract/Sudfor;

    .line 4
    .line 5
    return-object p0
.end method

.method public final c(JJLtech/sud/gip/core/PkgDownloadStatus;)V
    .locals 7

    .line 1
    iget-object v1, p0, Ll/llg0;->a:Ll/klg0;

    .line 2
    .line 3
    new-instance v0, Ll/pig0;

    .line 4
    .line 5
    move-wide v2, p1

    .line 6
    move-wide v4, p3

    .line 7
    move-object v6, p5

    .line 8
    invoke-direct/range {v0 .. v6}, Ll/pig0;-><init>(Ll/klg0;JJLtech/sud/gip/core/PkgDownloadStatus;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final d(JJ)V
    .locals 6

    .line 1
    iget-object v1, p0, Ll/llg0;->a:Ll/klg0;

    .line 2
    .line 3
    new-instance v0, Ll/rig0;

    .line 4
    .line 5
    move-wide v2, p1

    .line 6
    move-wide v4, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/rig0;-><init>(Ll/klg0;JJ)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final e(ILjava/lang/String;Ll/bxg0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/llg0;->a:Ll/klg0;

    .line 2
    .line 3
    new-instance v0, Ll/oig0;

    .line 4
    .line 5
    invoke-direct {v0, p2, p0, p1, p3}, Ll/oig0;-><init>(Ljava/lang/String;Ll/klg0;ILl/bxg0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final f(Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;)V
    .locals 8

    .line 1
    iget-object v7, p0, Ll/llg0;->a:Ll/klg0;

    .line 2
    .line 3
    new-instance v0, Ll/jig0;

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    move-object v2, p1

    .line 7
    move-wide v3, p2

    .line 8
    move-object v5, p4

    .line 9
    move-object v6, p5

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/jig0;-><init>(Ll/llg0;Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;Ll/klg0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic g(Ljava/lang/String;JLjava/lang/Object;Ll/bxg0;Ll/klg0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/llg0;->c:Ll/vog0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p4, p5, p6}, Ll/vog0;->h(Ljava/lang/String;Ljava/lang/Object;Ll/bxg0;Ll/klg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
