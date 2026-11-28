.class public interface abstract Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008`\u0018\u0000 \n2\u00020\u0001:\u0001\nJ\u0008\u0010\u0002\u001a\u00020\u0003H&R\u0012\u0010\u0004\u001a\u00020\u0005X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007R\u0012\u0010\u0008\u001a\u00020\u0005X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\u0007\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u000b\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;",
        "",
        "ensureLoaded",
        "",
        "bytes",
        "Lnicoid/network238/okio/ByteString;",
        "getBytes",
        "()Lnicoid/network238/okio/ByteString;",
        "exceptionBytes",
        "getExceptionBytes",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;->$$INSTANCE:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;

    sput-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixList$Companion;

    return-void
.end method


# virtual methods
.method public abstract ensureLoaded()V
.end method

.method public abstract getBytes()Lnicoid/network238/okio/ByteString;
.end method

.method public abstract getExceptionBytes()Lnicoid/network238/okio/ByteString;
.end method
