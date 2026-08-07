.class public final synthetic Ll/cjc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/utils/AppMonitor$Callback;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cjc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    return-void
.end method


# virtual methods
.method public final callback(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cjc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->d(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;I)V

    return-void
.end method
