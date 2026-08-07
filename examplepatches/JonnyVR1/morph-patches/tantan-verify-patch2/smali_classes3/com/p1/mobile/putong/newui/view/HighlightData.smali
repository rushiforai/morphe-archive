.class public Lcom/p1/mobile/putong/newui/view/HighlightData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private clickListener:Ll/x20;

.field private endIndex:I

.field private highColor:I

.field private isBold:Z

.field private isMatchAll:Z

.field private key:Ljava/lang/String;

.field private startIndex:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 25
    sget v1, Ll/b9c0;->h:I

    iput v1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    const/4 v0, -0x1

    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 6
    .line 7
    sget v1, Ll/b9c0;->h:I

    .line 8
    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->key:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p2, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->clickListener:Ll/x20;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZIZLl/x20;)V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->key:Ljava/lang/String;

    .line 41
    iput-boolean p2, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 42
    iput p3, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    .line 43
    iput-boolean p4, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    .line 44
    iput-object p5, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->clickListener:Ll/x20;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZZLl/x20;)V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    sget v0, Ll/b9c0;->h:I

    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    const/4 v0, -0x1

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->key:Ljava/lang/String;

    .line 34
    iput-boolean p2, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 35
    iput-boolean p3, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    .line 36
    iput-object p4, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->clickListener:Ll/x20;

    return-void
.end method


# virtual methods
.method public copy(Lcom/p1/mobile/putong/newui/view/HighlightData;)Lcom/p1/mobile/putong/newui/view/HighlightData;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/newui/view/HighlightData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/HighlightData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/newui/view/HighlightData;->key:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->key:Ljava/lang/String;

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    .line 17
    .line 18
    iget-boolean v0, p1, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 21
    .line 22
    iget v0, p1, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    .line 23
    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    .line 25
    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/newui/view/HighlightData;->clickListener:Ll/x20;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->clickListener:Ll/x20;

    .line 33
    .line 34
    return-object p0
.end method

.method public getClickListener()Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->clickListener:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEndIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getHighColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStartIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public isBold()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMatchAll()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    .line 2
    .line 3
    return p0
.end method

.method public setBold(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isBold:Z

    .line 2
    .line 3
    return-void
.end method

.method public setClickListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->clickListener:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setEndIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->endIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setHighColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->highColor:I

    .line 2
    .line 3
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setMatchAll(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->isMatchAll:Z

    .line 2
    .line 3
    return-void
.end method

.method public setStartIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/HighlightData;->startIndex:I

    .line 2
    .line 3
    return-void
.end method
