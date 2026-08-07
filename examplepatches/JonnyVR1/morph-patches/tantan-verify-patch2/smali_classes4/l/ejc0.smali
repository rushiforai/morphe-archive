.class public final synthetic Ll/ejc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ejc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ejc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    invoke-static {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->f(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V

    return-void
.end method
