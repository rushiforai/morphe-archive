.class public Lorg/seamless/util/OS;
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

.method public static checkForHp()Z
    .locals 2

    .line 1
    const-string v0, "os.name"

    .line 2
    .line 3
    const-string v1, "hp"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lorg/seamless/util/OS;->checkForPresence(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public static checkForLinux()Z
    .locals 2

    .line 1
    const-string v0, "os.name"

    .line 2
    .line 3
    const-string v1, "linux"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lorg/seamless/util/OS;->checkForPresence(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public static checkForMac()Z
    .locals 2

    .line 1
    const-string v0, "os.name"

    .line 2
    .line 3
    const-string v1, "mac"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lorg/seamless/util/OS;->checkForPresence(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method private static checkForPresence(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :catchall_0
    :cond_0
    return v0
.end method

.method public static checkForSolaris()Z
    .locals 2

    .line 1
    const-string v0, "os.name"

    .line 2
    .line 3
    const-string v1, "sun"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lorg/seamless/util/OS;->checkForPresence(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method

.method public static checkForWindows()Z
    .locals 2

    .line 1
    const-string v0, "os.name"

    .line 2
    .line 3
    const-string v1, "win"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lorg/seamless/util/OS;->checkForPresence(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    return v0
.end method
