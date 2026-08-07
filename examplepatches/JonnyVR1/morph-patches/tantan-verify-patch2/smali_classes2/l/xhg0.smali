.class public final Ll/xhg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/elg0;


# instance fields
.field public final synthetic a:Ltech/sud/gip/core/GameInfo;

.field public final synthetic b:Ll/dng0;


# direct methods
.method public constructor <init>(Ll/dng0;Ltech/sud/gip/core/GameInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xhg0;->b:Ll/dng0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/xhg0;->a:Ltech/sud/gip/core/GameInfo;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xhg0;->b:Ll/dng0;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p0, v0, p1}, Ll/dng0;->a(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xhg0;->b:Ll/dng0;

    .line 2
    .line 3
    iget-boolean p1, p1, Ll/dng0;->c:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p1, "SudGamePkgPreloadTask"

    .line 9
    .line 10
    const-string v0, "isCoreInstalled isInstalled=true"

    .line 11
    .line 12
    invoke-static {p1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Ll/dng0;->i:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "preload core is installed"

    .line 21
    .line 22
    invoke-static {p1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/xhg0;->b:Ll/dng0;

    .line 29
    .line 30
    iget-object p0, p0, Ll/xhg0;->a:Ltech/sud/gip/core/GameInfo;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ll/dng0;->b(Ltech/sud/gip/core/GameInfo;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
