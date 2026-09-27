.class public final Lkotlin/coroutines/jvm/internal/Boxing;
.super Ljava/lang/Object;
.source "boxing.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000`\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0005\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000c\n\u0000\u001a$\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u001a$\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0002\u001a\u00020\nH\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u001a$\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0002\u001a\u00020\rH\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u001a$\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0002\u001a\u00020\u0010H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u001a$\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u0013H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u001a$\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0002\u001a\u00020\u0016H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u001a$\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0002\u001a\u00020\u0019H\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u001a$\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u0002\u001a\u00020\u001cH\u0081\u0080\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\u00a8\u0006\u001d"
    }
    d2 = {
        "boxBoolean",
        "Ljava/lang/Boolean;",
        "primitive",
        "",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.3",
        "Lkotlin/PublishedApi;",
        "boxByte",
        "Ljava/lang/Byte;",
        "",
        "boxShort",
        "Ljava/lang/Short;",
        "",
        "boxInt",
        "Ljava/lang/Integer;",
        "",
        "boxLong",
        "Ljava/lang/Long;",
        "",
        "boxFloat",
        "Ljava/lang/Float;",
        "",
        "boxDouble",
        "Ljava/lang/Double;",
        "",
        "boxChar",
        "Ljava/lang/Character;",
        "",
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
.method public static final boxBoolean(Z)Ljava/lang/Boolean;
    .registers 1

    .line 20
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static final boxByte(B)Ljava/lang/Byte;
    .registers 1

    .line 24
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0
.end method

.method public static final boxChar(C)Ljava/lang/Character;
    .registers 2

    .line 48
    new-instance v0, Ljava/lang/Character;

    invoke-direct {v0, p0}, Ljava/lang/Character;-><init>(C)V

    return-object v0
.end method

.method public static final boxDouble(D)Ljava/lang/Double;
    .registers 3

    .line 44
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p0, p1}, Ljava/lang/Double;-><init>(D)V

    return-object v0
.end method

.method public static final boxFloat(F)Ljava/lang/Float;
    .registers 2

    .line 40
    new-instance v0, Ljava/lang/Float;

    invoke-direct {v0, p0}, Ljava/lang/Float;-><init>(F)V

    return-object v0
.end method

.method public static final boxInt(I)Ljava/lang/Integer;
    .registers 2

    .line 32
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p0}, Ljava/lang/Integer;-><init>(I)V

    return-object v0
.end method

.method public static final boxLong(J)Ljava/lang/Long;
    .registers 3

    .line 36
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p0, p1}, Ljava/lang/Long;-><init>(J)V

    return-object v0
.end method

.method public static final boxShort(S)Ljava/lang/Short;
    .registers 2

    .line 28
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, p0}, Ljava/lang/Short;-><init>(S)V

    return-object v0
.end method
