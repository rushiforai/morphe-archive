.class public final Lcom/google/common/base/Objects;
.super Lcom/google/common/base/ExtraObjectsMethodsForWeb;
.source "Objects.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 81
    invoke-direct {p0}, Lcom/google/common/base/ExtraObjectsMethodsForWeb;-><init>()V

    return-void
.end method

.method public static equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "b"
        }
    .end annotation

    .line 52
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static varargs hashCode([Ljava/lang/Object;)I
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "objects"
        }
    .end annotation

    .line 78
    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
