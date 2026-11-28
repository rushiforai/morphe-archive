.class public interface abstract Lnicoid/network238/okhttp3/TrailersSource;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/TrailersSource$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u0000 \u00052\u00020\u0001:\u0001\u0005J\n\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\u0016J\u0008\u0010\u0004\u001a\u00020\u0003H&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u0006\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/TrailersSource;",
        "",
        "peek",
        "Lnicoid/network238/okhttp3/Headers;",
        "get",
        "Companion",
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
.field public static final Companion:Lnicoid/network238/okhttp3/TrailersSource$Companion;

.field public static final EMPTY:Lnicoid/network238/okhttp3/TrailersSource;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/TrailersSource$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/TrailersSource$Companion;

    sput-object v0, Lnicoid/network238/okhttp3/TrailersSource;->Companion:Lnicoid/network238/okhttp3/TrailersSource$Companion;

    .line 40
    new-instance v0, Lnicoid/network238/okhttp3/TrailersSource$Companion$EMPTY$1;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/TrailersSource$Companion$EMPTY$1;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/TrailersSource;->EMPTY:Lnicoid/network238/okhttp3/TrailersSource;

    return-void
.end method


# virtual methods
.method public abstract get()Lnicoid/network238/okhttp3/Headers;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public peek()Lnicoid/network238/okhttp3/Headers;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method
