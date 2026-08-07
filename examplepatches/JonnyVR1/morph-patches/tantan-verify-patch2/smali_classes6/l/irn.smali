.class public Ll/irn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/jxd0;

.field public static b:Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "openDefaultRGB565"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/irn;->a:Ll/jxd0;

    .line 11
    .line 12
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

.method public static a()Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    invoke-static {}, Ll/vxr;->l()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_1

    .line 19
    .line 20
    return v2

    .line 21
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    :try_start_0
    sget-object v4, Ll/irn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;

    .line 26
    .line 27
    if-nez v4, :cond_2

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    const-string v5, "intl_image_default_rgb565"

    .line 34
    .line 35
    sget-object v6, Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 36
    .line 37
    invoke-virtual {v4, v5, v6}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;

    .line 42
    .line 43
    sput-object v4, Ll/irn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catch_0
    move-exception v0

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    :goto_0
    sget-object v4, Ll/irn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;

    .line 49
    .line 50
    if-nez v4, :cond_3

    .line 51
    .line 52
    return v2

    .line 53
    :cond_3
    iget-boolean v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;->on:Z

    .line 54
    .line 55
    if-eqz v4, :cond_6

    .line 56
    .line 57
    sub-int/2addr v3, v0

    .line 58
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    sget-object v3, Ll/irn;->b:Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;

    .line 63
    .line 64
    iget-boolean v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;->isGary:Z

    .line 65
    .line 66
    if-eqz v4, :cond_5

    .line 67
    .line 68
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveImageColorConfig;->gary_number:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v3, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_4
    return v2

    .line 78
    :cond_5
    :goto_1
    return v0

    .line 79
    :cond_6
    return v2

    .line 80
    :goto_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return v2
.end method
