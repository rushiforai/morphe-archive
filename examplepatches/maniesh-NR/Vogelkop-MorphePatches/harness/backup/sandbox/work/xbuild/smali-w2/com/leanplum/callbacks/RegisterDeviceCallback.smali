.class public abstract Lcom/leanplum/callbacks/RegisterDeviceCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;
    }
.end annotation


# instance fields
.field private callback:Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onResponse(Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;)V
.end method

.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/callbacks/RegisterDeviceCallback;->callback:Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;

    invoke-virtual {p0, v0}, Lcom/leanplum/callbacks/RegisterDeviceCallback;->onResponse(Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;)V

    return-void
.end method

.method public setResponseHandler(Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/callbacks/RegisterDeviceCallback;->callback:Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;

    return-void
.end method
