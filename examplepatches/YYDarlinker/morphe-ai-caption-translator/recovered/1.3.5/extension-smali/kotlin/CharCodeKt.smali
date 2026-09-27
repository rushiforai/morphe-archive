.class public final Lkotlin/CharCodeKt;
.super Ljava/lang/Object;
.source "CharCode.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0000\n\u0002\u0010\u000c\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u001a$\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0087\u0088\u0004b\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006b\u0002\u0008\u0007\"6\u0010\u0002\u001a\u00020\u0003*\u00020\u00018\u00c6\u0002X\u0087\u0084\u0008r\u000c\u0008\u0004\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u0006r\u0002\u0008\u0007r\u0002\u0008\u000c\u00a2\u0006\u000c\u0012\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Char",
        "",
        "code",
        "",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.5",
        "Lkotlin/internal/InlineOnly;",
        "getCode$annotations",
        "(C)V",
        "getCode",
        "(C)I",
        "Lkotlin/internal/IntrinsicConstEvaluation;",
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
.method private static final Char(I)C
    .registers 4

    if-ltz p0, :cond_9

    const v0, 0xffff

    if-gt p0, v0, :cond_9

    int-to-char p0, p0

    return p0

    .line 22
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid Char code: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static final getCode(C)I
    .registers 1

    return p0
.end method

.method public static synthetic getCode$annotations(C)V
    .registers 1

    return-void
.end method
