.class public Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/User;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DefaultRiskAuditUser"
.end annotation


# instance fields
.field public isOpenRiskAudit:Z

.field final synthetic this$0:Lcom/p1/mobile/putong/data/User;

.field public userName:Ljava/lang/String;

.field public userPicture:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->this$0:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->isOpenRiskAudit:Z

    .line 8
    .line 9
    const-string p1, "\u6635\u79f0\u5ba1\u6838\u4e2d"

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->userName:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "https://auto.tancdn.com/v1/images/eyJpZCI6IklXUEs3V1hHUVU0RkhQR0pXQTdTMlRLWFk0TVY0VDA4IiwidyI6NjQwLCJoIjo2NDAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0Njg1MDM0NjI0NTMwNjc4ODE3fQ"

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->userPicture:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "default_user_info"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string p1, "switch"

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iput-boolean p1, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->isOpenRiskAudit:Z

    .line 39
    .line 40
    const-string p1, "name"

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->userName:Ljava/lang/String;

    .line 47
    .line 48
    const-string p1, "picture"

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->userPicture:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    :catch_0
    return-void
.end method
