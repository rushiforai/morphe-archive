.class public final enum Lnet/jpountz/util/UnsafeUtils;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnet/jpountz/util/UnsafeUtils;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnet/jpountz/util/UnsafeUtils;

.field private static final BYTE_ARRAY_OFFSET:J

.field private static final BYTE_ARRAY_SCALE:I

.field private static final INT_ARRAY_OFFSET:J

.field private static final INT_ARRAY_SCALE:I

.field private static final SHORT_ARRAY_OFFSET:J

.field private static final SHORT_ARRAY_SCALE:I

.field private static final UNSAFE:Lsun/misc/Unsafe;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const-class v0, [S

    .line 2
    .line 3
    const-class v1, [I

    .line 4
    .line 5
    const-class v2, [B

    .line 6
    .line 7
    const-string v3, "Cannot access Unsafe"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    new-array v4, v4, [Lnet/jpountz/util/UnsafeUtils;

    .line 11
    .line 12
    sput-object v4, Lnet/jpountz/util/UnsafeUtils;->$VALUES:[Lnet/jpountz/util/UnsafeUtils;

    .line 13
    .line 14
    :try_start_0
    const-class v4, Lsun/misc/Unsafe;

    .line 15
    .line 16
    const-string v5, "theUnsafe"

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    const/4 v5, 0x1

    .line 23
    invoke-virtual {v4, v5}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 24
    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Lsun/misc/Unsafe;

    .line 32
    .line 33
    sput-object v4, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 34
    .line 35
    invoke-virtual {v4, v2}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    int-to-long v5, v5

    .line 40
    sput-wide v5, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    .line 41
    .line 42
    invoke-virtual {v4, v2}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    sput v2, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_SCALE:I

    .line 47
    .line 48
    invoke-virtual {v4, v1}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    int-to-long v5, v2

    .line 53
    sput-wide v5, Lnet/jpountz/util/UnsafeUtils;->INT_ARRAY_OFFSET:J

    .line 54
    .line 55
    invoke-virtual {v4, v1}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    sput v1, Lnet/jpountz/util/UnsafeUtils;->INT_ARRAY_SCALE:I

    .line 60
    .line 61
    invoke-virtual {v4, v0}, Lsun/misc/Unsafe;->arrayBaseOffset(Ljava/lang/Class;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    int-to-long v1, v1

    .line 66
    sput-wide v1, Lnet/jpountz/util/UnsafeUtils;->SHORT_ARRAY_OFFSET:J

    .line 67
    .line 68
    invoke-virtual {v4, v0}, Lsun/misc/Unsafe;->arrayIndexScale(Ljava/lang/Class;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    sput v0, Lnet/jpountz/util/UnsafeUtils;->SHORT_ARRAY_SCALE:I
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    return-void

    .line 75
    :catch_0
    new-instance v0, Ljava/lang/ExceptionInInitializerError;

    .line 76
    .line 77
    invoke-direct {v0, v3}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    throw v0

    .line 81
    :catch_1
    new-instance v0, Ljava/lang/ExceptionInInitializerError;

    .line 82
    .line 83
    invoke-direct {v0, v3}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw v0

    .line 87
    :catch_2
    new-instance v0, Ljava/lang/ExceptionInInitializerError;

    .line 88
    .line 89
    invoke-direct {v0, v3}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw v0
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

.method public static checkLength(I)V
    .locals 0

    .line 1
    invoke-static {p0}, Lnet/jpountz/util/SafeUtils;->checkLength(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static checkRange([BI)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/SafeUtils;->checkRange([BI)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static checkRange([BII)V
    .locals 0

    .line 5
    invoke-static {p0, p1, p2}, Lnet/jpountz/util/SafeUtils;->checkRange([BII)V

    return-void
.end method

.method public static readByte([BI)B
    .locals 5

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    .line 4
    .line 5
    sget v3, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_SCALE:I

    .line 6
    .line 7
    mul-int/2addr v3, p1

    .line 8
    int-to-long v3, v3

    .line 9
    add-long/2addr v1, v3

    .line 10
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getByte(Ljava/lang/Object;J)B

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static readInt([BI)I
    .locals 5

    .line 15
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    int-to-long v3, p1

    add-long/2addr v1, v3

    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    move-result p0

    return p0
.end method

.method public static readInt([II)I
    .locals 5

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->INT_ARRAY_OFFSET:J

    .line 4
    .line 5
    sget v3, Lnet/jpountz/util/UnsafeUtils;->INT_ARRAY_SCALE:I

    .line 6
    .line 7
    mul-int/2addr v3, p1

    .line 8
    int-to-long v3, v3

    .line 9
    add-long/2addr v1, v3

    .line 10
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getInt(Ljava/lang/Object;J)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public static readIntLE([BI)I
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sget-object p1, Lnet/jpountz/util/Utils;->NATIVE_BYTE_ORDER:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Integer;->reverseBytes(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    :cond_0
    return p0
.end method

.method public static readLong([BI)J
    .locals 5

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    .line 4
    .line 5
    int-to-long v3, p1

    .line 6
    add-long/2addr v1, v3

    .line 7
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getLong(Ljava/lang/Object;J)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public static readLongLE([BI)J
    .locals 2

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readLong([BI)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    sget-object v0, Lnet/jpountz/util/Utils;->NATIVE_BYTE_ORDER:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p1}, Ljava/lang/Long;->reverseBytes(J)J

    .line 12
    .line 13
    .line 14
    move-result-wide p0

    .line 15
    :cond_0
    return-wide p0
.end method

.method public static readShort([SI)I
    .locals 5

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->SHORT_ARRAY_OFFSET:J

    .line 4
    .line 5
    sget v3, Lnet/jpountz/util/UnsafeUtils;->SHORT_ARRAY_SCALE:I

    .line 6
    .line 7
    mul-int/2addr v3, p1

    .line 8
    int-to-long v3, v3

    .line 9
    add-long/2addr v1, v3

    .line 10
    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getShort(Ljava/lang/Object;J)S

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const p1, 0xffff

    .line 15
    .line 16
    .line 17
    and-int/2addr p0, p1

    .line 18
    return p0
.end method

.method public static readShort([BI)S
    .locals 5

    .line 19
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    int-to-long v3, p1

    add-long/2addr v1, v3

    invoke-virtual {v0, p0, v1, v2}, Lsun/misc/Unsafe;->getShort(Ljava/lang/Object;J)S

    move-result p0

    return p0
.end method

.method public static readShortLE([BI)I
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lnet/jpountz/util/UnsafeUtils;->readShort([BI)S

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sget-object p1, Lnet/jpountz/util/Utils;->NATIVE_BYTE_ORDER:Ljava/nio/ByteOrder;

    .line 6
    .line 7
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Short;->reverseBytes(S)S

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    :cond_0
    const p1, 0xffff

    .line 16
    .line 17
    .line 18
    and-int/2addr p0, p1

    .line 19
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lnet/jpountz/util/UnsafeUtils;
    .locals 1

    .line 1
    const-class v0, Lnet/jpountz/util/UnsafeUtils;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lnet/jpountz/util/UnsafeUtils;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lnet/jpountz/util/UnsafeUtils;
    .locals 1

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->$VALUES:[Lnet/jpountz/util/UnsafeUtils;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lnet/jpountz/util/UnsafeUtils;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lnet/jpountz/util/UnsafeUtils;

    .line 8
    .line 9
    return-object v0
.end method

.method public static writeByte([BIB)V
    .locals 5

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    .line 4
    .line 5
    sget v3, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_SCALE:I

    .line 6
    .line 7
    mul-int/2addr v3, p1

    .line 8
    int-to-long v3, v3

    .line 9
    add-long/2addr v1, v3

    .line 10
    invoke-virtual {v0, p0, v1, v2, p2}, Lsun/misc/Unsafe;->putByte(Ljava/lang/Object;JB)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static writeByte([BII)V
    .locals 0

    int-to-byte p2, p2

    .line 14
    invoke-static {p0, p1, p2}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BIB)V

    return-void
.end method

.method public static writeInt([BII)V
    .locals 5

    .line 14
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    int-to-long v3, p1

    add-long/2addr v1, v3

    invoke-virtual {v0, p0, v1, v2, p2}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    return-void
.end method

.method public static writeInt([III)V
    .locals 5

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->INT_ARRAY_OFFSET:J

    .line 4
    .line 5
    sget v3, Lnet/jpountz/util/UnsafeUtils;->INT_ARRAY_SCALE:I

    .line 6
    .line 7
    mul-int/2addr v3, p1

    .line 8
    int-to-long v3, v3

    .line 9
    add-long/2addr v1, v3

    .line 10
    invoke-virtual {v0, p0, v1, v2, p2}, Lsun/misc/Unsafe;->putInt(Ljava/lang/Object;JI)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static writeLong([BIJ)V
    .locals 6

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    .line 4
    .line 5
    int-to-long v3, p1

    .line 6
    add-long v2, v1, v3

    .line 7
    .line 8
    move-object v1, p0

    .line 9
    move-wide v4, p2

    .line 10
    invoke-virtual/range {v0 .. v5}, Lsun/misc/Unsafe;->putLong(Ljava/lang/Object;JJ)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static writeShort([BIS)V
    .locals 5

    .line 15
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->BYTE_ARRAY_OFFSET:J

    int-to-long v3, p1

    add-long/2addr v1, v3

    invoke-virtual {v0, p0, v1, v2, p2}, Lsun/misc/Unsafe;->putShort(Ljava/lang/Object;JS)V

    return-void
.end method

.method public static writeShort([SII)V
    .locals 5

    .line 1
    sget-object v0, Lnet/jpountz/util/UnsafeUtils;->UNSAFE:Lsun/misc/Unsafe;

    .line 2
    .line 3
    sget-wide v1, Lnet/jpountz/util/UnsafeUtils;->SHORT_ARRAY_OFFSET:J

    .line 4
    .line 5
    sget v3, Lnet/jpountz/util/UnsafeUtils;->SHORT_ARRAY_SCALE:I

    .line 6
    .line 7
    mul-int/2addr v3, p1

    .line 8
    int-to-long v3, v3

    .line 9
    add-long/2addr v1, v3

    .line 10
    int-to-short p1, p2

    .line 11
    invoke-virtual {v0, p0, v1, v2, p1}, Lsun/misc/Unsafe;->putShort(Ljava/lang/Object;JS)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static writeShortLE([BII)V
    .locals 1

    .line 1
    int-to-byte v0, p2

    .line 2
    invoke-static {p0, p1, v0}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BIB)V

    .line 3
    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    ushr-int/lit8 p2, p2, 0x8

    .line 8
    .line 9
    int-to-byte p2, p2

    .line 10
    invoke-static {p0, p1, p2}, Lnet/jpountz/util/UnsafeUtils;->writeByte([BIB)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
