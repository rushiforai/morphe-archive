.class final Lcom/google/common/hash/Platform;
.super Ljava/lang/Object;
.source "Platform.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clone(Ljava/security/MessageDigest;)Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "digest"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 22
    invoke-virtual {p0}, Ljava/security/MessageDigest;->clone()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
