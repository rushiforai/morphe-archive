.class public final synthetic Ll/rxc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iput-object p2, p0, Ll/rxc0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/rxc0;->c:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    iget-object v1, p0, Ll/rxc0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/rxc0;->c:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->a(Lcom/p1/mobile/putong/remote_config/RemoteConfig;Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method
