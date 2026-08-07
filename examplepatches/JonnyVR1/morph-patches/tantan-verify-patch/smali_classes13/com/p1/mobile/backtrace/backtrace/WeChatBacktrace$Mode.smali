.class public final enum Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

.field public static final enum Dwarf:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

.field public static final enum DwarfUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

.field public static final enum Fp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

.field public static final enum FpUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

.field public static final enum Quicken:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;


# instance fields
.field value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 2
    .line 3
    const-string v1, "Fp"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Fp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 12
    .line 13
    const-string v2, "Quicken"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Quicken:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 20
    .line 21
    new-instance v2, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 22
    .line 23
    const-string v3, "Dwarf"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Dwarf:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 30
    .line 31
    new-instance v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 32
    .line 33
    const-string v4, "FpUntilQuickenWarmedUp"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->FpUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 40
    .line 41
    new-instance v4, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 42
    .line 43
    const-string v5, "DwarfUntilQuickenWarmedUp"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->DwarfUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 50
    .line 51
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->$VALUES:[Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 56
    .line 57
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
    iput p3, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->$VALUES:[Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$2;->$SwitchMap$com$p1$mobile$backtrace$backtrace$WeChatBacktrace$Mode:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v0, 0x4

    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x5

    .line 22
    if-eq p0, v0, :cond_0

    .line 23
    .line 24
    const-string p0, "Unreachable."

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    const-string p0, "Use dwarf-based backtrace before quicken has warmed up."

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string p0, "Use fp-based backtrace before quicken has warmed up."

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    const-string p0, "Dwarf-based."

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_3
    const-string p0, "WeChat QuickenUnwindTable-based."

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_4
    const-string p0, "FramePointer-based."

    .line 40
    .line 41
    return-object p0
.end method
