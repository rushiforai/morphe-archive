.class public final synthetic Ll/xxc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

.field public final synthetic b:Lorg/json/JSONObject;

.field public final synthetic c:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lorg/json/JSONObject;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iput-object p2, p0, Ll/xxc0;->b:Lorg/json/JSONObject;

    iput-object p3, p0, Ll/xxc0;->c:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iget-object v1, p0, Ll/xxc0;->b:Lorg/json/JSONObject;

    iget-object p0, p0, Ll/xxc0;->c:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->g(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lorg/json/JSONObject;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
