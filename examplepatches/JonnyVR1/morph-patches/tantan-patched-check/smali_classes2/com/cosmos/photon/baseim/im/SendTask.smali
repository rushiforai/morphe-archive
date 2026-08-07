.class public abstract Lcom/cosmos/photon/baseim/im/SendTask;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/baseim/im/ITask;


# static fields
.field public static final TASK_TYPE_ASYNC:I = 0x2

.field public static final TASK_TYPE_SUCCESSION:I = 0x0

.field public static final TASK_TYPE_SUCCESSION_LONG:I = 0x1


# instance fields
.field private taskId:Ljava/lang/String;

.field private type:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "Default"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/cosmos/photon/baseim/im/SendTask;->taskId:Ljava/lang/String;

    .line 7
    .line 8
    iput p1, p0, Lcom/cosmos/photon/baseim/im/SendTask;->type:I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput p1, p0, Lcom/cosmos/photon/baseim/im/SendTask;->type:I

    .line 13
    iput-object p2, p0, Lcom/cosmos/photon/baseim/im/SendTask;->taskId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/baseim/im/SendTask;->taskId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/cosmos/photon/baseim/im/SendTask;->type:I

    .line 2
    .line 3
    return p0
.end method
