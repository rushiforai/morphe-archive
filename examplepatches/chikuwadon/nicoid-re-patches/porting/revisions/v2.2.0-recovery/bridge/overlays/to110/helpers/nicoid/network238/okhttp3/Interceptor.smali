.class public interface abstract Lnicoid/network238/okhttp3/Interceptor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Interceptor$Chain;,
        Lnicoid/network238/okhttp3/Interceptor$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00e6\u0080\u0001\u0018\u0000 \u00062\u00020\u0001:\u0002\u0006\u0007J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u0008\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Interceptor;",
        "",
        "intercept",
        "Lnicoid/network238/okhttp3/Response;",
        "chain",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "Companion",
        "Chain",
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
.field public static final Companion:Lnicoid/network238/okhttp3/Interceptor$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/Interceptor$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/Interceptor$Companion;

    sput-object v0, Lnicoid/network238/okhttp3/Interceptor;->Companion:Lnicoid/network238/okhttp3/Interceptor$Companion;

    return-void
.end method


# virtual methods
.method public abstract intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
