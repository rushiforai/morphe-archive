.class Lcom/google/common/escape/Platform$1;
.super Ljava/lang/ThreadLocal;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/escape/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "[C>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 42
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .registers 1

    .line 42
    invoke-virtual {p0}, Lcom/google/common/escape/Platform$1;->initialValue()[C

    move-result-object p0

    return-object p0
.end method

.method protected initialValue()[C
    .registers 1

    const/16 p0, 0x400

    .line 45
    new-array p0, p0, [C

    return-object p0
.end method
