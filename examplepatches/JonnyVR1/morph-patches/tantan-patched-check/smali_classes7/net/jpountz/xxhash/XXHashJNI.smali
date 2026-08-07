.class final enum Lnet/jpountz/xxhash/XXHashJNI;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnet/jpountz/xxhash/XXHashJNI;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnet/jpountz/xxhash/XXHashJNI;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lnet/jpountz/xxhash/XXHashJNI;

    .line 3
    .line 4
    sput-object v0, Lnet/jpountz/xxhash/XXHashJNI;->$VALUES:[Lnet/jpountz/xxhash/XXHashJNI;

    .line 5
    .line 6
    invoke-static {}, Lnet/jpountz/util/Native;->load()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lnet/jpountz/xxhash/XXHashJNI;->init()V

    .line 10
    .line 11
    .line 12
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

.method public static native XXH32([BIII)I
.end method

.method public static native XXH32BB(Ljava/nio/ByteBuffer;III)I
.end method

.method public static native XXH32_digest(J)I
.end method

.method public static native XXH32_free(J)V
.end method

.method public static native XXH32_init(I)J
.end method

.method public static native XXH32_update(J[BII)V
.end method

.method public static native XXH64([BIIJ)J
.end method

.method public static native XXH64BB(Ljava/nio/ByteBuffer;IIJ)J
.end method

.method public static native XXH64_digest(J)J
.end method

.method public static native XXH64_free(J)V
.end method

.method public static native XXH64_init(J)J
.end method

.method public static native XXH64_update(J[BII)V
.end method

.method private static native init()V
.end method

.method public static valueOf(Ljava/lang/String;)Lnet/jpountz/xxhash/XXHashJNI;
    .locals 1

    .line 1
    const-class v0, Lnet/jpountz/xxhash/XXHashJNI;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lnet/jpountz/xxhash/XXHashJNI;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lnet/jpountz/xxhash/XXHashJNI;
    .locals 1

    .line 1
    sget-object v0, Lnet/jpountz/xxhash/XXHashJNI;->$VALUES:[Lnet/jpountz/xxhash/XXHashJNI;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lnet/jpountz/xxhash/XXHashJNI;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lnet/jpountz/xxhash/XXHashJNI;

    .line 8
    .line 9
    return-object v0
.end method
