.class public final synthetic Ll/mxc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ydg0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

.field public final synthetic b:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iput-object p2, p0, Ll/mxc0;->b:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    return-void
.end method


# virtual methods
.method public final then(Ljava/lang/Object;)Ll/jni0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iget-object p0, p0, Ll/mxc0;->b:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->d(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ljava/lang/Boolean;)Ll/jni0;

    move-result-object p0

    return-object p0
.end method
