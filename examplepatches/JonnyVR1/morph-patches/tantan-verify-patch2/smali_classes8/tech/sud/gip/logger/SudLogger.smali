.class public Ltech/sud/gip/logger/SudLogger;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static impl:Ltech/sud/gip/core/ISudLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/cjg0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cjg0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-interface {v0, v1, p0, p1}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 8
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    const/4 v1, 0x3

    invoke-interface {v0, v1, p0, p1, p2}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    invoke-interface {v0, v1, p0, p1}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 8
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    const/4 v1, 0x6

    invoke-interface {v0, v1, p0, p1, p2}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-interface {v0, v1, p0, p1}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 8
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    const/4 v1, 0x4

    invoke-interface {v0, v1, p0, p1, p2}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static setLogLevel(I)V
    .locals 1

    .line 1
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ltech/sud/gip/core/ISudLogger;->setLogLevel(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static setLogger(Ltech/sud/gip/core/ISudLogger;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sput-object p0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 4
    .line 5
    :cond_0
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-interface {v0, v1, p0, p1}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 8
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    const/4 v1, 0x2

    invoke-interface {v0, v1, p0, p1, p2}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    invoke-interface {v0, v1, p0, p1}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 8
    sget-object v0, Ltech/sud/gip/logger/SudLogger;->impl:Ltech/sud/gip/core/ISudLogger;

    const/4 v1, 0x5

    invoke-interface {v0, v1, p0, p1, p2}, Ltech/sud/gip/core/ISudLogger;->log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
