.class public final Lnicoid/network238/okhttp3/internal/dns/_DnsMessageWriterKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0002"
    }
    d2 = {
        "LABEL_SEPARATOR",
        "Lnicoid/network238/okio/ByteString;",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final LABEL_SEPARATOR:Lnicoid/network238/okio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 201
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v1, "."

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/dns/_DnsMessageWriterKt;->LABEL_SEPARATOR:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public static final synthetic access$getLABEL_SEPARATOR$p()Lnicoid/network238/okio/ByteString;
    .registers 1

    .line 1
    sget-object v0, Lnicoid/network238/okhttp3/internal/dns/_DnsMessageWriterKt;->LABEL_SEPARATOR:Lnicoid/network238/okio/ByteString;

    return-object v0
.end method
