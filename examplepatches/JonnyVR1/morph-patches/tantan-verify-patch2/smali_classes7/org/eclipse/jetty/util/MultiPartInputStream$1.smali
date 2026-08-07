.class Lorg/eclipse/jetty/util/MultiPartInputStream$1;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/util/MultiPartInputStream;->parse()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/util/MultiPartInputStream;Ljava/io/InputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/util/MultiPartInputStream$1;->this$0:Lorg/eclipse/jetty/util/MultiPartInputStream;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    const/16 v1, 0x3d

    .line 10
    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object p0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 v1, 0x0

    .line 26
    if-ltz v0, :cond_0

    .line 27
    .line 28
    if-ltz p0, :cond_0

    .line 29
    .line 30
    int-to-char v0, v0

    .line 31
    int-to-char p0, p0

    .line 32
    const/4 v2, 0x2

    .line 33
    new-array v2, v2, [C

    .line 34
    .line 35
    aput-char v0, v2, v1

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    aput-char p0, v2, v0

    .line 39
    .line 40
    new-instance p0, Ljava/lang/String;

    .line 41
    .line 42
    invoke-direct {p0, v2}, Ljava/lang/String;-><init>([C)V

    .line 43
    .line 44
    .line 45
    const/16 v0, 0x10

    .line 46
    .line 47
    invoke-static {p0, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :cond_0
    const-string p0, "Unexpected end to quoted-printable byte"

    .line 53
    .line 54
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return v1

    .line 58
    :cond_1
    return v0
.end method
