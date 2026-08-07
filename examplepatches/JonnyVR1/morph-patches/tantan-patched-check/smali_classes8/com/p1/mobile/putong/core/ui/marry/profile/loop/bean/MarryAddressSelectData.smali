.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;
    }
.end annotation


# instance fields
.field public city:Ljava/lang/String;

.field public country:Ljava/lang/String;

.field private isSelected:Z

.field private level:I

.field nextList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
            ">;"
        }
    .end annotation
.end field

.field public province:Ljava/lang/String;

.field private showArrow:Z

.field private showText:Ljava/lang/String;

.field private type:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->isSelected:Z

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_INFO:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->country:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->province:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->city:Ljava/lang/String;

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->level:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showArrow:Z

    .line 20
    .line 21
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->type:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showText:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->isSelected:Z

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_INFO:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->level:I

    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showArrow:Z

    .line 31
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->type:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showText:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->country:Ljava/lang/String;

    .line 34
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->city:Ljava/lang/String;

    .line 35
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->province:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getNextList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->nextList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getShowText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showText:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->type:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 2
    .line 3
    return-object p0
.end method

.method public hasNextData()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->nextList:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public isOldData()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->type:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->OLD_DATA:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

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

.method public isOverseasData()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->type:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;->SELECT_OVERSEAS:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData$MarryAddressDataSelectType;

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

.method public isSelected()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->isSelected:Z

    .line 2
    .line 3
    return p0
.end method

.method public setData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->country:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->city:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->province:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public setLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->level:I

    .line 2
    .line 3
    return-void
.end method

.method public setNextList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->nextList:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public setSelected(Z)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->isSelected:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public setShowArrow()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showArrow:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public setShowText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showText:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public showArrow()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showArrow:Z

    .line 2
    .line 3
    return p0
.end method
