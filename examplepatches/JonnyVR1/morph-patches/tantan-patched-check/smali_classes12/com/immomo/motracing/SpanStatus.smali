.class public final enum Lcom/immomo/motracing/SpanStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/motracing/SpanStatus;",
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
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0005\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/immomo/motracing/SpanStatus;",
        "",
        "(Ljava/lang/String;I)V",
        "OK",
        "ERROR",
        "UNSET",
        "MoTracing_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/motracing/SpanStatus;

.field public static final enum ERROR:Lcom/immomo/motracing/SpanStatus;

.field public static final enum OK:Lcom/immomo/motracing/SpanStatus;

.field public static final enum UNSET:Lcom/immomo/motracing/SpanStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lcom/immomo/motracing/SpanStatus;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/immomo/motracing/SpanStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/immomo/motracing/SpanStatus;->OK:Lcom/immomo/motracing/SpanStatus;

    new-instance v1, Lcom/immomo/motracing/SpanStatus;

    const-string v2, "ERROR"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/immomo/motracing/SpanStatus;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/immomo/motracing/SpanStatus;->ERROR:Lcom/immomo/motracing/SpanStatus;

    new-instance v2, Lcom/immomo/motracing/SpanStatus;

    const-string v3, "UNSET"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/immomo/motracing/SpanStatus;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/immomo/motracing/SpanStatus;->UNSET:Lcom/immomo/motracing/SpanStatus;

    filled-new-array {v0, v1, v2}, [Lcom/immomo/motracing/SpanStatus;

    move-result-object v0

    sput-object v0, Lcom/immomo/motracing/SpanStatus;->$VALUES:[Lcom/immomo/motracing/SpanStatus;

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

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/motracing/SpanStatus;
    .locals 1

    const-class v0, Lcom/immomo/motracing/SpanStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/immomo/motracing/SpanStatus;

    return-object p0
.end method

.method public static values()[Lcom/immomo/motracing/SpanStatus;
    .locals 1

    sget-object v0, Lcom/immomo/motracing/SpanStatus;->$VALUES:[Lcom/immomo/motracing/SpanStatus;

    invoke-virtual {v0}, [Lcom/immomo/motracing/SpanStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/immomo/motracing/SpanStatus;

    return-object v0
.end method
