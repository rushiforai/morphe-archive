.class public final synthetic Ll/ssp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ssp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ssp0;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager;->f(Lcom/p1/mobile/putong/api/WebSocketManager;Landroid/net/NetworkInfo;)V

    return-void
.end method
