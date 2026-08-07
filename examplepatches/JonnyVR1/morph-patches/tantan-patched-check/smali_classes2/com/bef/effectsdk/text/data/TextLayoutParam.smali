.class public Lcom/bef/effectsdk/text/data/TextLayoutParam;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation


# instance fields
.field public backColor:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public bitmapType:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public familyName:Ljava/lang/String;
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public fontPath:Ljava/lang/String;
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public fontSize:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public fontStyle:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public letterSpacing:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public lineBreakMode:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public lineSpacingAdd:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public lineSpacingMult:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public lineWidth:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public maxLine:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public paintStyle:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public shadowColor:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public shadowDx:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public shadowDy:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public shadowRadius:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public strokeWidth:F
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public textAlign:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field

.field public textColor:I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontStyle:I

    .line 11
    .line 12
    const/high16 v1, 0x41800000    # 16.0f

    .line 13
    .line 14
    iput v1, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontSize:F

    .line 15
    .line 16
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->textColor:I

    .line 17
    .line 18
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->backColor:I

    .line 19
    .line 20
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->paintStyle:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput v1, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->strokeWidth:F

    .line 24
    .line 25
    iput v1, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 26
    .line 27
    iput v1, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 28
    .line 29
    iput v1, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDy:F

    .line 30
    .line 31
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowColor:I

    .line 32
    .line 33
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineWidth:I

    .line 34
    .line 35
    iput v1, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->letterSpacing:F

    .line 36
    .line 37
    const/high16 v2, 0x3f800000    # 1.0f

    .line 38
    .line 39
    iput v2, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingMult:F

    .line 40
    .line 41
    iput v1, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingAdd:F

    .line 42
    .line 43
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->textAlign:I

    .line 44
    .line 45
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->maxLine:I

    .line 46
    .line 47
    iput v0, p0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineBreakMode:I

    .line 48
    .line 49
    return-void
.end method
