.class public Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;
    }
.end annotation


# static fields
.field public static a:I

.field public static b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;->UNKNOWN:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 2
    .line 3
    sput-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 4
    .line 5
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

.method public static synthetic a(Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 3

    return-void

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/api/push/PushTrackData;->gid:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "push"

    .line 9
    .line 10
    const-string v2, ""

    .line 11
    .line 12
    invoke-static {v1, v2, v0, p0}, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->c(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static b()V
    .locals 1

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;->UNKNOWN:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 2
    .line 3
    sput-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 4
    .line 5
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3

    return-void

    .line 1
    sget v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    new-instance v1, Ll/pf60;

    .line 9
    .line 10
    const-string v2, "is_cold_launch"

    .line 11
    .line 12
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {v1, v2, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/pf60;

    .line 20
    .line 21
    const-string v2, "launch_type"

    .line 22
    .line 23
    invoke-direct {v0, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/pf60;

    .line 27
    .line 28
    const-string v2, "link"

    .line 29
    .line 30
    invoke-direct {p0, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/pf60;

    .line 34
    .line 35
    const-string v2, "push_content"

    .line 36
    .line 37
    invoke-direct {p1, v2, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    new-instance p2, Ll/pf60;

    .line 41
    .line 42
    const-string v2, "push_id"

    .line 43
    .line 44
    invoke-direct {p2, v2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    filled-new-array {v1, v0, p0, p1, p2}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p1, "e_app_launch"

    .line 52
    .line 53
    const-string p2, ""

    .line 54
    .line 55
    invoke-static {p1, p2, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 3

    return-void

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    const-string v2, "link"

    .line 9
    .line 10
    invoke-static {v2, p0, v0, v1}, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->c(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;->LINK:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 14
    .line 15
    sput-object p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->a:I

    .line 18
    .line 19
    add-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    sput p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->a:I

    .line 22
    .line 23
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 2

    return-void

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;->UNKNOWN:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 11
    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/cx0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/cx0;-><init>(Lcom/p1/mobile/putong/api/push/PushTrackData;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;->PUSH:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 23
    .line 24
    sput-object p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 25
    .line 26
    sget p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->a:I

    .line 27
    .line 28
    add-int/lit8 p0, p0, 0x1

    .line 29
    .line 30
    sput p0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->a:I

    .line 31
    .line 32
    return-void
.end method

.method public static f()V
    .locals 3

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;->UNKNOWN:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    new-instance v0, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "normal"

    .line 13
    .line 14
    const-string v2, ""

    .line 15
    .line 16
    invoke-static {v1, v2, v0, v2}, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->c(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;->NORMAL:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 20
    .line 21
    sput-object v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->b:Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats$AppStartStatus;

    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->a:I

    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    sput v0, Lcom/p1/mobile/putong/app/statistics/AppOpenWayStats;->a:I

    .line 28
    .line 29
    return-void
.end method
