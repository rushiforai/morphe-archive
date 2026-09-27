.class final Lkotlin/KotlinVersionCurrentValue;
.super Ljava/lang/Object;
.source "KotlinVersion.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u0005H\u0087\u0080\u0004b\u0002\u0008\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lkotlin/KotlinVersionCurrentValue;",
        "",
        "<init>",
        "()V",
        "get",
        "Lkotlin/KotlinVersion;",
        "Lkotlin/jvm/JvmStatic;",
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
.field public static final INSTANCE:Lkotlin/KotlinVersionCurrentValue;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lkotlin/KotlinVersionCurrentValue;

    invoke-direct {v0}, Lkotlin/KotlinVersionCurrentValue;-><init>()V

    sput-object v0, Lkotlin/KotlinVersionCurrentValue;->INSTANCE:Lkotlin/KotlinVersionCurrentValue;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final get()Lkotlin/KotlinVersion;
    .registers 4
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 82
    new-instance v0, Lkotlin/KotlinVersion;

    const/4 v1, 0x4

    const/16 v2, 0xa

    const/4 v3, 0x2

    invoke-direct {v0, v3, v1, v2}, Lkotlin/KotlinVersion;-><init>(III)V

    return-object v0
.end method
