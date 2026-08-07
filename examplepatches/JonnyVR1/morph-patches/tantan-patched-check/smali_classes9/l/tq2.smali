.class public final synthetic Ll/tq2;
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

    iput-object p1, p0, Ll/tq2;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tq2;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/BasePreOperationView;->m0()V

    return-void
.end method
