.class public final enum Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/model/types/UnsignedVariableInteger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Bits"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

.field public static final enum EIGHT:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

.field public static final enum SIXTEEN:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

.field public static final enum THIRTYTWO:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

.field public static final enum TWENTYFOUR:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;


# instance fields
.field private maxValue:J


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-wide/16 v2, 0xff

    .line 5
    .line 6
    const-string v4, "EIGHT"

    .line 7
    .line 8
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;-><init>(Ljava/lang/String;IJ)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->EIGHT:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 12
    .line 13
    new-instance v1, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-wide/32 v3, 0xffff

    .line 17
    .line 18
    .line 19
    const-string v5, "SIXTEEN"

    .line 20
    .line 21
    invoke-direct {v1, v5, v2, v3, v4}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;-><init>(Ljava/lang/String;IJ)V

    .line 22
    .line 23
    .line 24
    sput-object v1, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->SIXTEEN:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 25
    .line 26
    new-instance v2, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 27
    .line 28
    const/4 v3, 0x2

    .line 29
    const-wide/32 v4, 0xffffff

    .line 30
    .line 31
    .line 32
    const-string v6, "TWENTYFOUR"

    .line 33
    .line 34
    invoke-direct {v2, v6, v3, v4, v5}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;-><init>(Ljava/lang/String;IJ)V

    .line 35
    .line 36
    .line 37
    sput-object v2, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->TWENTYFOUR:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 38
    .line 39
    new-instance v3, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 40
    .line 41
    const/4 v4, 0x3

    .line 42
    const-wide v5, 0xffffffffL

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    const-string v7, "THIRTYTWO"

    .line 48
    .line 49
    invoke-direct {v3, v7, v4, v5, v6}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;-><init>(Ljava/lang/String;IJ)V

    .line 50
    .line 51
    .line 52
    sput-object v3, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->THIRTYTWO:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 53
    .line 54
    filled-new-array {v0, v1, v2, v3}, [Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sput-object v0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->$VALUES:[Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 59
    .line 60
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-wide p3, p0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->maxValue:J

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->$VALUES:[Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getMaxValue()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->maxValue:J

    .line 2
    .line 3
    return-wide v0
.end method
