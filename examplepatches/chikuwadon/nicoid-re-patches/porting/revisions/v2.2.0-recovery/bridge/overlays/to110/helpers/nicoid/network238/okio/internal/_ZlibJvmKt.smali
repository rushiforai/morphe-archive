.class public final Lnicoid/network238/okio/internal/_ZlibJvmKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000 \n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0007\n\u0002\u0010\u0012\n\u0002\u0008\u0003\u001a8\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u00012\u0006\u0010\t\u001a\u00020\u00012\u0006\u0010\n\u001a\u00020\u00012\u0006\u0010\u000b\u001a\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u00012\u0006\u0010\r\u001a\u00020\u0001H\u0000\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\"\u0014\u0010\u000e\u001a\u00020\u000fX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011*\u000c\u0008\u0000\u0010\u0004\"\u00020\u00052\u00020\u0005\u00a8\u0006\u0012"
    }
    d2 = {
        "DEFAULT_COMPRESSION",
        "",
        "getDEFAULT_COMPRESSION",
        "()I",
        "CRC32",
        "Ljava/util/zip/CRC32;",
        "datePartsToEpochMillis",
        "",
        "year",
        "month",
        "day",
        "hour",
        "minute",
        "second",
        "EMPTY_BYTE_ARRAY",
        "",
        "getEMPTY_BYTE_ARRAY",
        "()[B",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final DEFAULT_COMPRESSION:I = -0x1

.field private static final EMPTY_BYTE_ARRAY:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 40
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lnicoid/network238/okio/internal/_ZlibJvmKt;->EMPTY_BYTE_ARRAY:[B

    return-void
.end method

.method public static final datePartsToEpochMillis(IIIIII)J
    .registers 13

    .line 34
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 35
    const/16 v1, 0xe

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    add-int/lit8 v2, p1, -0x1

    .line 36
    move v1, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 37
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide p0

    return-wide p0
.end method

.method public static final getDEFAULT_COMPRESSION()I
    .registers 1

    .line 22
    sget v0, Lnicoid/network238/okio/internal/_ZlibJvmKt;->DEFAULT_COMPRESSION:I

    return v0
.end method

.method public static final getEMPTY_BYTE_ARRAY()[B
    .registers 1

    .line 40
    sget-object v0, Lnicoid/network238/okio/internal/_ZlibJvmKt;->EMPTY_BYTE_ARRAY:[B

    return-object v0
.end method
