.class public abstract Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/callbacks/RegisterDeviceCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "EmailCallback"
.end annotation


# instance fields
.field private email:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onResponse(Ljava/lang/String;)V
.end method

.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;->email:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;->onResponse(Ljava/lang/String;)V

    return-void
.end method

.method public setResponseHandler(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/callbacks/RegisterDeviceCallback$EmailCallback;->email:Ljava/lang/String;

    return-void
.end method
