.class public Lcom/hihonor/push/framework/aidl/entity/BooleanResult;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/hihonor/push/framework/aidl/IMessageEntity;


# instance fields
.field private status:Z
    .annotation runtime Lcom/hihonor/push/framework/aidl/annotation/Packed;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getStatus()Z
    .locals 0

    iget-boolean p0, p0, Lcom/hihonor/push/framework/aidl/entity/BooleanResult;->status:Z

    return p0
.end method

.method public setStatus(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/hihonor/push/framework/aidl/entity/BooleanResult;->status:Z

    return-void
.end method
