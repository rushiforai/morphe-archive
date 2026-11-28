.class public final Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Appendable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/RealBufferedSink;->utf8Appendable()Ljava/lang/Appendable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000)\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\r\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000c\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00060\u0001j\u0002`\u0002J\u0017\u0010\u0004\u001a\u00020\u00002\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0002\u0010\u0007J\'\u0010\u0004\u001a\u00020\u00002\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0002\u0010\u000bJ\u0015\u0010\u0004\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\rH\u0016\u00a2\u0006\u0002\u0010\u000eR\u0012\u0010\u0003\u001a\u00060\u0001j\u0002`\u0002X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "nicoid/network238/okio/RealBufferedSink$utf8Appendable$1",
        "Ljava/lang/Appendable;",
        "Lnicoid/network238/kotlin/text/Appendable;",
        "delegate",
        "append",
        "charSequence",
        "",
        "(Ljava/lang/CharSequence;)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;",
        "start",
        "",
        "end",
        "(Ljava/lang/CharSequence;II)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;",
        "c",
        "",
        "(C)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final delegate:Ljava/lang/Appendable;

.field final synthetic this$0:Lnicoid/network238/okio/RealBufferedSink;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/RealBufferedSink;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->this$0:Lnicoid/network238/okio/RealBufferedSink;

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    iget-object p1, p1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 136
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->utf8Appendable()Ljava/lang/Appendable;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->delegate:Ljava/lang/Appendable;

    return-void
.end method


# virtual methods
.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .registers 2

    .line 135
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->append(C)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .registers 2

    .line 135
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->append(Ljava/lang/CharSequence;)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .registers 4

    .line 135
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->append(Ljava/lang/CharSequence;II)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;

    move-result-object p1

    return-object p1
.end method

.method public append(C)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;
    .registers 4

    .line 152
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->this$0:Lnicoid/network238/okio/RealBufferedSink;

    .line 153
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->delegate:Ljava/lang/Appendable;

    invoke-interface {v1, p1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 154
    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;
    .registers 4

    .line 138
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->this$0:Lnicoid/network238/okio/RealBufferedSink;

    .line 139
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->delegate:Ljava/lang/Appendable;

    invoke-interface {v1, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 140
    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;II)Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;
    .registers 6

    .line 147
    iget-object v0, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->this$0:Lnicoid/network238/okio/RealBufferedSink;

    .line 148
    iget-object v1, p0, Lnicoid/network238/okio/RealBufferedSink$utf8Appendable$1;->delegate:Ljava/lang/Appendable;

    invoke-interface {v1, p1, p2, p3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    .line 149
    invoke-virtual {v0}, Lnicoid/network238/okio/RealBufferedSink;->emitCompleteSegments()Lnicoid/network238/okio/BufferedSink;

    return-object p0
.end method
