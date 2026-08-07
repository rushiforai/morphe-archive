.class public final synthetic Ll/nxc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t26;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

.field public final synthetic b:Ll/jni0;

.field public final synthetic c:Ll/jni0;

.field public final synthetic d:Ll/bw5;

.field public final synthetic e:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ll/jni0;Ll/jni0;Ll/bw5;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iput-object p2, p0, Ll/nxc0;->b:Ll/jni0;

    iput-object p3, p0, Ll/nxc0;->c:Ll/jni0;

    iput-object p4, p0, Ll/nxc0;->d:Ll/bw5;

    iput-object p5, p0, Ll/nxc0;->e:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    return-void
.end method


# virtual methods
.method public final a(Ll/jni0;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/nxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iget-object v1, p0, Ll/nxc0;->b:Ll/jni0;

    iget-object v2, p0, Ll/nxc0;->c:Ll/jni0;

    iget-object v3, p0, Ll/nxc0;->d:Ll/bw5;

    iget-object v4, p0, Ll/nxc0;->e:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->j(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ll/jni0;Ll/jni0;Ll/bw5;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;Ll/jni0;)Ll/jni0;

    move-result-object p0

    return-object p0
.end method
