.class public final synthetic Ll/udi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/udi0;->a:Ll/xc00;

    iput-object p2, p0, Ll/udi0;->b:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/udi0;->a:Ll/xc00;

    iget-object p0, p0, Ll/udi0;->b:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    invoke-static {v0, p0}, Ll/nei0;->R(Ll/xc00;Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    return-void
.end method
