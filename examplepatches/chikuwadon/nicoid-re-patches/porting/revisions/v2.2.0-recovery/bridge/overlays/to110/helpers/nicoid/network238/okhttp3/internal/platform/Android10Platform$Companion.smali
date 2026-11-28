.class public final Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/platform/Android10Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0006\u00a8\u0006\t"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;",
        "",
        "<init>",
        "()V",
        "isSupported",
        "",
        "()Z",
        "buildIfSupported",
        "Lnicoid/network238/okhttp3/internal/platform/Platform;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final buildIfSupported()Lnicoid/network238/okhttp3/internal/platform/Platform;
    .registers 2

    .line 149
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;-><init>()V

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final isSupported()Z
    .registers 2

    .line 147
    # getter for: Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->isSupported:Z
    invoke-static {}, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->access$isSupported$cp()Z

    move-result v0

    return v0
.end method
