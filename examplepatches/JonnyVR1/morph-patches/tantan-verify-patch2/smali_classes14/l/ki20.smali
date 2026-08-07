.class public final synthetic Ll/ki20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/li20;


# direct methods
.method public synthetic constructor <init>(Ll/li20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ki20;->a:Ll/li20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ki20;->a:Ll/li20;

    check-cast p1, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    invoke-static {p0, p1}, Ll/li20;->a(Ll/li20;Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;)V

    return-void
.end method
