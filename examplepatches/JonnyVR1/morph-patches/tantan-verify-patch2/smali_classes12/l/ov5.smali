.class public Ll/ov5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public commConfig:Ll/ug5;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "comm_config"
    .end annotation
.end field

.field public logConfig:Ll/ryv;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "log_config"
    .end annotation
.end field

.field public pullConfig:Ll/x7b0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pull_config"
    .end annotation
.end field

.field public pushConfig:Ll/emb0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "push_config"
    .end annotation
.end field

.field refereeConfig:Lcom/immomo/medialog/safejson/RefereeConfig;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "referee_config"
    .end annotation
.end field

.field public vodConfig:Ll/akm0;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "vod_config"
    .end annotation
.end field


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


# virtual methods
.method public a()Ll/ug5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ov5;->commConfig:Ll/ug5;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/ryv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ov5;->logConfig:Ll/ryv;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/x7b0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ov5;->pullConfig:Ll/x7b0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/emb0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ov5;->pushConfig:Ll/emb0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/akm0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ov5;->vodConfig:Ll/akm0;

    .line 2
    .line 3
    return-object p0
.end method
