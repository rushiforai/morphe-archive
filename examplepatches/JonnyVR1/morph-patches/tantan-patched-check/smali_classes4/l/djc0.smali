.class public final synthetic Ll/djc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/djc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/djc0;->a:Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    invoke-static {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->c(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
