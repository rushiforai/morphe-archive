.class public final synthetic Ll/vq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vq2;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vq2;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->destroy()V

    return-void
.end method
