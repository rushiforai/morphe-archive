.class public Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field finishForReport:Z

.field from:Ljava/lang/String;

.field greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

.field hasCreatedGreeting:Z

.field hotLevel:I

.field isStartHomeCard:Z

.field preSendMsg:Ljava/lang/String;

.field recommendReason:Ljava/lang/String;

.field stateId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hasCreatedGreeting:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->from:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStateId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->stateId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
