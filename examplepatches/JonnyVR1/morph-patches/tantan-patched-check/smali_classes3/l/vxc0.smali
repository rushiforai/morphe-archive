.class public final synthetic Ll/vxc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/remote_config/RemoteConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vxc0;->a:Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    invoke-static {p0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->b(Lcom/p1/mobile/putong/remote_config/RemoteConfig;)V

    return-void
.end method
