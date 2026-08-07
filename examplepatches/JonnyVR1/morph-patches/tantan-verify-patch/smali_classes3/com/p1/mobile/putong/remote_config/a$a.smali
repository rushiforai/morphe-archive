.class public Lcom/p1/mobile/putong/remote_config/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/remote_config/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lorg/json/JSONObject;

.field public b:Ljava/util/Date;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/a$a;->a:Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/a;->a()Ljava/util/Date;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/a$a;->b:Ljava/util/Date;

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Ll/ew5;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/remote_config/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/remote_config/a;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/remote_config/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/remote_config/a$a;->a:Lorg/json/JSONObject;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/remote_config/a$a;->b:Ljava/util/Date;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p0, v2}, Lcom/p1/mobile/putong/remote_config/a;-><init>(Lorg/json/JSONObject;Ljava/util/Date;Ll/ew5;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public b(Lorg/json/JSONObject;)Lcom/p1/mobile/putong/remote_config/a$a;
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/remote_config/a$a;->a:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    return-object p0

    .line 13
    :catch_0
    move-exception p1

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public c(Ljava/util/Date;)Lcom/p1/mobile/putong/remote_config/a$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/remote_config/a$a;->b:Ljava/util/Date;

    .line 2
    .line 3
    return-object p0
.end method
