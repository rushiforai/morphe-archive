.class public final Lkotlin/_Assertions;
.super Ljava/lang/Object;
.source "AssertionsJVM.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c1\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R \u0010\u0004\u001a\u00020\u00058\u0000X\u0081\u0084\u0008r\u0002\u0008\u0007\u0092\u0002\u0002\u0008\u0008\u00a2\u0006\u0008\n\u0000\u0012\u0004\u0008\u0006\u0010\u0003\u00ca\u0001\u0002\u0008\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Lkotlin/_Assertions;",
        "",
        "<init>",
        "()V",
        "ENABLED",
        "",
        "getENABLED$annotations",
        "Lkotlin/PublishedApi;",
        "Lkotlin/jvm/JvmField;",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final ENABLED:Z

.field public static final INSTANCE:Lkotlin/_Assertions;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/_Assertions;

    invoke-direct {v0}, Lkotlin/_Assertions;-><init>()V

    sput-object v0, Lkotlin/_Assertions;->INSTANCE:Lkotlin/_Assertions;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic getENABLED$annotations()V
    .registers 0

    return-void
.end method
