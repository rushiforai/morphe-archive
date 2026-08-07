.class public Lcom/p1/mobile/putong/core/data/ChatHeatActionData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;
    }
.end annotation


# instance fields
.field action:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

.field params:[Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field responseSuccess:Z

.field throwable:Ljava/lang/Throwable;

.field public userId:Ljava/lang/String;


# direct methods
.method public varargs constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;Z[Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;",
            "Z[",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->userId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->action:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->responseSuccess:Z

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->params:[Ll/pf60;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getParams()[Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->params:[Ll/pf60;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->action:Lcom/p1/mobile/putong/core/data/ChatHeatActionData$ExclusiveAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public isSuccess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->responseSuccess:Z

    .line 2
    .line 3
    return p0
.end method

.method public setThrowable(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatHeatActionData;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-void
.end method
