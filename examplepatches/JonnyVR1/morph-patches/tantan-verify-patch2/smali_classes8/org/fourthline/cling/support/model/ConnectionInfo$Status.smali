.class public final enum Lorg/fourthline/cling/support/model/ConnectionInfo$Status;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/model/ConnectionInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/model/ConnectionInfo$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

.field public static final enum ContentFormatMismatch:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

.field public static final enum InsufficientBandwidth:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

.field public static final enum OK:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

.field public static final enum Unknown:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

.field public static final enum UnreliableChannel:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 2
    .line 3
    const-string v1, "OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->OK:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 10
    .line 11
    new-instance v1, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 12
    .line 13
    const-string v2, "ContentFormatMismatch"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->ContentFormatMismatch:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 20
    .line 21
    new-instance v2, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 22
    .line 23
    const-string v3, "InsufficientBandwidth"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->InsufficientBandwidth:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 30
    .line 31
    new-instance v3, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 32
    .line 33
    const-string v4, "UnreliableChannel"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5}, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->UnreliableChannel:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 40
    .line 41
    new-instance v4, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 42
    .line 43
    const-string v5, "Unknown"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6}, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->Unknown:Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 50
    .line 51
    filled-new-array {v0, v1, v2, v3, v4}, [Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->$VALUES:[Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 56
    .line 57
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/ConnectionInfo$Status;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/model/ConnectionInfo$Status;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->$VALUES:[Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/model/ConnectionInfo$Status;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/model/ConnectionInfo$Status;

    .line 8
    .line 9
    return-object v0
.end method
