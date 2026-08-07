.class public final enum Lcom/momo/piplineext/bean/MMLiveSubtitleMode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/piplineext/bean/MMLiveSubtitleMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

.field public static final enum SUBTITLE_MODE_RECOGNITION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

.field public static final enum SUBTITLE_MODE_TRANSLATION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;


# instance fields
.field private value:I


# direct methods
.method private static synthetic $values()[Lcom/momo/piplineext/bean/MMLiveSubtitleMode;
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->SUBTITLE_MODE_RECOGNITION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 2
    .line 3
    sget-object v1, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->SUBTITLE_MODE_TRANSLATION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 2
    .line 3
    const-string v1, "SUBTITLE_MODE_RECOGNITION"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->SUBTITLE_MODE_RECOGNITION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 12
    .line 13
    const-string v1, "SUBTITLE_MODE_TRANSLATION"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->SUBTITLE_MODE_TRANSLATION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 20
    .line 21
    invoke-static {}, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->$values()[Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->$VALUES:[Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 26
    .line 27
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/momo/piplineext/bean/MMLiveSubtitleMode;
    .locals 5

    .line 1
    invoke-static {}, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->values()[Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    sget-object p0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->SUBTITLE_MODE_RECOGNITION:Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 22
    .line 23
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/momo/piplineext/bean/MMLiveSubtitleMode;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/piplineext/bean/MMLiveSubtitleMode;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->$VALUES:[Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/piplineext/bean/MMLiveSubtitleMode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/bean/MMLiveSubtitleMode;->value:I

    .line 2
    .line 3
    return p0
.end method
