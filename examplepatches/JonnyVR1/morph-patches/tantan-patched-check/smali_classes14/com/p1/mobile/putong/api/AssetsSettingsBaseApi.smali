.class public Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field public static i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:Ll/wyd0;


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
    sput-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->i:Lrx/subjects/a;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .line 1
    new-instance v0, Ll/dji;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    const-string v2, "assets_settings_json_protobuf"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v1, v2, v3, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    sget-object v4, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2, v4}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/c21;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/c21;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "assets_settings"

    .line 23
    .line 24
    invoke-direct {p0, v2, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/wyd0;

    .line 28
    .line 29
    const-string v1, "assetHadLoadMd5"

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-direct {v0, v1, v3, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->h:Ll/wyd0;

    .line 36
    .line 37
    new-instance v0, Ll/d21;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/d21;-><init>(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    sget-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->i:Lrx/subjects/a;

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static synthetic B(Ljava/lang/String;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, "md5"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mof0;->m()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/String;

    .line 8
    .line 9
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_2

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->h:Ll/wyd0;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    return-object p2

    .line 40
    :cond_1
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const/4 p1, 0x1

    .line 48
    if-le v2, p1, :cond_3

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->h:Ll/wyd0;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    return-object p2

    .line 56
    :cond_3
    :goto_1
    return-object v1

    .line 57
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-object v1
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->G()V

    return-void
.end method

.method public static synthetic E()Lrx/c;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->h:Ll/wyd0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ljava/lang/String;

    .line 16
    .line 17
    new-instance v2, Ll/si20;

    .line 18
    .line 19
    new-instance v3, Ll/f21;

    .line 20
    .line 21
    invoke-direct {v3, v1}, Ll/f21;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v4, Lcom/tantanapp/common/data/INetParser;->STRING_PARSER:Lcom/tantanapp/common/data/INetParser;

    .line 25
    .line 26
    invoke-direct {v2, v3, v4}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ll/g21;

    .line 30
    .line 31
    invoke-direct {v3}, Ll/g21;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    new-instance v3, Ll/h21;

    .line 39
    .line 40
    invoke-direct {v3, v0, v1}, Ll/h21;-><init>(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    return-object v0
.end method

.method public static synthetic F(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->basic()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/settings?md5=%s"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const-string p0, ""

    .line 16
    .line 17
    :cond_0
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static H(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->savedValue:Ll/vxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic G()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lrx/c;->first()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/e21;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/e21;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method
