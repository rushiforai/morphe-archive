.class public Ll/qd80;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "cmd"

.field public static b:Ljava/lang/String; = "setLrcTime"

.field public static c:Ljava/lang/String; = "currentPosition"

.field public static d:Ljava/lang/String; = "songCode"

.field public static e:Ljava/lang/String; = "duration"

.field public static f:Ljava/lang/String; = "testDelay"

.field public static g:Ljava/lang/String; = "startSing"

.field public static h:Ljava/lang/String; = "stopSing"

.field public static i:Ljava/lang/String; = "pause"

.field public static j:Ljava/lang/String; = "continue"

.field public static k:Ljava/lang/String; = "switch"

.field public static l:Ljava/lang/String; = "playFail"

.field public static m:Ljava/lang/String; = "pause"

.field public static n:Ljava/lang/String; = "crash_leave_room"


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

.method public static a(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-lt p0, v0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public static b(I)Z
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    if-lt p0, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x5

    .line 5
    if-ge p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
