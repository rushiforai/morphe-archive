.class public Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;->SELECT_INFO:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;)V
    .locals 1

    .line 20
    const-string v0, ""

    invoke-direct {p0, v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a:Z

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;->INPUT_ENTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f:Z

    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->d:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e:Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;->INPUT_ENTRY:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;->CHECK_BOX:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData$LoopSelectType;

    .line 4
    .line 5
    return-object p0
.end method

.method public h(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Z)Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->a:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;->f:Z

    .line 2
    .line 3
    return p0
.end method
