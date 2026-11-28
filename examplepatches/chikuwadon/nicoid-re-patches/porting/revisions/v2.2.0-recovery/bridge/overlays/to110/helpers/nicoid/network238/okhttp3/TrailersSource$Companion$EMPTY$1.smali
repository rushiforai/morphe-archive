.class public final Lnicoid/network238/okhttp3/TrailersSource$Companion$EMPTY$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/TrailersSource;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/TrailersSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0003H\u0016\u00a8\u0006\u0005"
    }
    d2 = {
        "nicoid/network238/okhttp3/TrailersSource$Companion$EMPTY$1",
        "Lnicoid/network238/okhttp3/TrailersSource;",
        "peek",
        "Lnicoid/network238/okhttp3/Headers;",
        "get",
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
.method constructor <init>()V
    .registers 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 43
    sget-object v0, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public peek()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 41
    sget-object v0, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method
