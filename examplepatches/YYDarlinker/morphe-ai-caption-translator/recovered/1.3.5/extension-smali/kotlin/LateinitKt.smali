.class public final Lkotlin/LateinitKt;
.super Ljava/lang/Object;
.source "Lateinit.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\";\u0010\u0000\u001a\u00020\u0001*\u0006\u0012\u0002\u0008\u00030\u00028\u00c6\u0002X\u0087\u0084\u0008r\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008r\u0002\u0008\t\u008a\u0002\u0002\u0008\n\u00a2\u0006\u000c\u0012\u0004\u0008\u0003\u0010\u0004\u001a\u0004\u0008\u0000\u0010\u0005\u00a8\u0006\u000b"
    }
    d2 = {
        "isInitialized",
        "",
        "Lkotlin/reflect/KProperty0;",
        "isInitialized$annotations",
        "(Lkotlin/reflect/KProperty0;)V",
        "(Lkotlin/reflect/KProperty0;)Z",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.2",
        "Lkotlin/internal/InlineOnly;",
        "Lkotlin/internal/AccessibleLateinitPropertyLiteral;",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private static final isInitialized(Lkotlin/reflect/KProperty0;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KProperty0<",
            "*>;)Z"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    new-instance p0, Lkotlin/NotImplementedError;

    const-string v0, "Implementation is intrinsic"

    invoke-direct {p0, v0}, Lkotlin/NotImplementedError;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic isInitialized$annotations(Lkotlin/reflect/KProperty0;)V
    .registers 1

    return-void
.end method
