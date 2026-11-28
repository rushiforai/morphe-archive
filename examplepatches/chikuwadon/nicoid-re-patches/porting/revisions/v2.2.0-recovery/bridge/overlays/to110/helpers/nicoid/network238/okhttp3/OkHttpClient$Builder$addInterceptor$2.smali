.class public final Lnicoid/network238/okhttp3/OkHttpClient$Builder$addInterceptor$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/OkHttpClient$Builder;->-addInterceptor(Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0xb0
.end annotation


# instance fields
.field final synthetic $block:Lnicoid/network238/kotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/kotlin/jvm/functions/Function1;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/jvm/functions/Function1;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/jvm/functions/Function1;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder$addInterceptor$2;->$block:Lnicoid/network238/kotlin/jvm/functions/Function1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 3
    .param p1, "chain"    # Lnicoid/network238/okhttp3/Interceptor$Chain;

    const-string v0, "chain"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 693
    iget-object v0, p0, Lnicoid/network238/okhttp3/OkHttpClient$Builder$addInterceptor$2;->$block:Lnicoid/network238/kotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lnicoid/network238/kotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method
