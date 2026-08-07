.class public final Lorg/fourthline/cling/model/types/UnsignedIntegerFourBytes;
.super Lorg/fourthline/cling/model/types/UnsignedVariableInteger;
.source "SourceFile"


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger;-><init>(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1}, Lorg/fourthline/cling/model/types/UnsignedVariableInteger;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getBits()Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;
    .locals 0

    .line 1
    sget-object p0, Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;->THIRTYTWO:Lorg/fourthline/cling/model/types/UnsignedVariableInteger$Bits;

    .line 2
    .line 3
    return-object p0
.end method
