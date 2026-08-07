.class public final enum Lcom/hellogroup/mk/core/log/core/MKLogLevel;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/hellogroup/mk/core/log/core/MKLogLevel;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/hellogroup/mk/core/log/core/MKLogLevel;",
        "",
        "value",
        "",
        "(Ljava/lang/String;II)V",
        "getValue",
        "()I",
        "DEBUG",
        "INFO",
        "WARNING",
        "ERROR",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/hellogroup/mk/core/log/core/MKLogLevel;

.field public static final enum DEBUG:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

.field public static final enum ERROR:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

.field public static final enum INFO:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

.field public static final enum WARNING:Lcom/hellogroup/mk/core/log/core/MKLogLevel;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 2
    .line 3
    const-string v1, "DEBUG"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/hellogroup/mk/core/log/core/MKLogLevel;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->DEBUG:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 10
    .line 11
    new-instance v1, Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 12
    .line 13
    const-string v2, "INFO"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/hellogroup/mk/core/log/core/MKLogLevel;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->INFO:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 20
    .line 21
    new-instance v2, Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 22
    .line 23
    const-string v3, "WARNING"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/hellogroup/mk/core/log/core/MKLogLevel;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->WARNING:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 30
    .line 31
    new-instance v3, Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 32
    .line 33
    const-string v4, "ERROR"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/hellogroup/mk/core/log/core/MKLogLevel;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->ERROR:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->$VALUES:[Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 46
    .line 47
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
    iput p3, p0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hellogroup/mk/core/log/core/MKLogLevel;
    .locals 1

    const-class v0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    return-object p0
.end method

.method public static values()[Lcom/hellogroup/mk/core/log/core/MKLogLevel;
    .locals 1

    sget-object v0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->$VALUES:[Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    invoke-virtual {v0}, [Lcom/hellogroup/mk/core/log/core/MKLogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    return-object v0
.end method


# virtual methods
.method public final getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->value:I

    .line 2
    .line 3
    return p0
.end method
