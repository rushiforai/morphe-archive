.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;
.super Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;
.source "SourceFile"


# static fields
.field public static final NONE_STR:Ljava/lang/String; = "-"


# instance fields
.field public selectItem1:Ljava/lang/String;

.field public selectItem2:Ljava/lang/String;

.field public selectItem3:Ljava/lang/String;

.field public wheelData1:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public wheelData2:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public wheelData3:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpInputContentBaseData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public fillWithEmpty(ILjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p1, v0, :cond_0

    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 5
    .line 6
    filled-new-array {p2}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData1:Ljava/util/List;

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x2

    .line 17
    if-lt p1, v0, :cond_1

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 20
    .line 21
    filled-new-array {p2}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData2:Ljava/util/List;

    .line 30
    .line 31
    :cond_1
    const/4 v0, 0x3

    .line 32
    if-lt p1, v0, :cond_2

    .line 33
    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 35
    .line 36
    filled-new-array {p2}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->wheelData3:Ljava/util/List;

    .line 45
    .line 46
    :cond_2
    return-void
.end method

.method public onItemSelected(ILjava/lang/String;I)V
    .locals 0

    .line 1
    const/4 p3, 0x1

    .line 2
    if-ne p1, p3, :cond_0

    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem1:Ljava/lang/String;

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 p3, 0x2

    .line 8
    if-ne p1, p3, :cond_1

    .line 9
    .line 10
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem2:Ljava/lang/String;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    const/4 p3, 0x3

    .line 14
    if-ne p1, p3, :cond_2

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopWheelTypeData;->selectItem3:Ljava/lang/String;

    .line 17
    .line 18
    :cond_2
    return-void
.end method
