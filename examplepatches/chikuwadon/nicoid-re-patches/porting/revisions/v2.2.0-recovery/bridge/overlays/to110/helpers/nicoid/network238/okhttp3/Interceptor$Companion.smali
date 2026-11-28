.class public final Lnicoid/network238/okhttp3/Interceptor$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Interceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J)\u0010\t\u001a\u00020\u00082\u0014\u0008\u0004\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004H\u0086\n\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\t\u0010\n\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Interceptor$Companion;",
        "",
        "<init>",
        "()V",
        "Lnicoid/network238/kotlin/Function1;",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "Lnicoid/network238/okhttp3/Response;",
        "block",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "invoke",
        "(Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okhttp3/Interceptor;",
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


# static fields
.field static final synthetic $$INSTANCE:Lnicoid/network238/okhttp3/Interceptor$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/Interceptor$Companion;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Interceptor$Companion;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/Interceptor$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/Interceptor$Companion;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okhttp3/Interceptor;
    .registers 4
    .param p1, "block"    # Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")",
            "Lnicoid/network238/okhttp3/Interceptor;"
        }
    .end annotation

    const-string v0, "block"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 81
    .local v0, "$i$f$invoke":I
    new-instance v1, Lnicoid/network238/okhttp3/Interceptor$Companion$invoke$1;

    invoke-direct {v1, p1}, Lnicoid/network238/okhttp3/Interceptor$Companion$invoke$1;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function1;)V

    check-cast v1, Lnicoid/network238/okhttp3/Interceptor;

    return-object v1
.end method
