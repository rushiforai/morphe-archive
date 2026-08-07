.class Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/gift/SVGAGiftDescriptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# instance fields
.field private isBold:Z

.field private isCircle:Z

.field private isClick:I

.field private key:Ljava/lang/String;

.field private text:Ljava/lang/String;

.field private textAlignType:I

.field private textColor:I

.field private textSize:I

.field private type:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->textColor:I

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic access$002(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$102(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->isCircle:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$202(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->type:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$302(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$402(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->isBold:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$502(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->textSize:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$602(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->textAlignType:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$702(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->textColor:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$802(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->isClick:I

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public getIsClick()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->isClick:I

    .line 2
    .line 3
    return p0
.end method

.method public getKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->key:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextAlignType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->textAlignType:I

    .line 2
    .line 3
    return p0
.end method

.method public getTextColor()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->textColor:I

    .line 2
    .line 3
    return p0
.end method

.method public getTextSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->textSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public isBold()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->isBold:Z

    .line 2
    .line 3
    return p0
.end method

.method public isCircle()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->isCircle:Z

    .line 2
    .line 3
    return p0
.end method
