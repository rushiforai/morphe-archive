.class public Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public couldInputEmpty:Z

.field public defaultContent:Ljava/lang/String;

.field public editHint:Ljava/lang/String;

.field public editObjKey:Ljava/lang/String;

.field public editTitle:Z

.field public isHarmonyTest:Z

.field public loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public maxInput:I

.field public multiType:Ljava/lang/String;

.field public questionId:Ljava/lang/String;

.field public showTitle:Z

.field public subTitle:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->showTitle:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editTitle:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->questionId:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static getCreateTagInfo(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Ljava/lang/String;ILjava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->title:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 9
    .line 10
    iput p2, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->maxInput:I

    .line 11
    .line 12
    iput-object p3, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editHint:Ljava/lang/String;

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->showTitle:Z

    .line 16
    .line 17
    return-object v0
.end method


# virtual methods
.method public setDefaultContent(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->defaultContent:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setEditObjKey(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editObjKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setEmptyInput(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->couldInputEmpty:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setHarmonyTest(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->isHarmonyTest:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setMultiType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->multiType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setQuestionId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->questionId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSubTitle(Ljava/lang/String;Z)Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->subTitle:Ljava/lang/String;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->editTitle:Z

    .line 4
    .line 5
    return-object p0
.end method
