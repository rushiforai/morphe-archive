.class public Ll/h0r0;
.super Ljava/io/PrintWriter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h0r0$a;
    }
.end annotation


# instance fields
.field private a:Ljava/security/MessageDigest;

.field private b:Ljava/nio/charset/Charset;

.field private c:Ll/h0r0$a;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;Ll/h0r0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/h0r0;->b:Ljava/nio/charset/Charset;

    .line 6
    .line 7
    iput-object p2, p0, Ll/h0r0;->a:Ljava/security/MessageDigest;

    .line 8
    .line 9
    iput-object p3, p0, Ll/h0r0;->c:Ll/h0r0$a;

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/h0r0;->b:Ljava/nio/charset/Charset;

    .line 18
    .line 19
    :cond_0
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 0

    .line 39
    invoke-super {p0, p1}, Ljava/io/PrintWriter;->write(I)V

    iget-object p0, p0, Ll/h0r0;->a:Ljava/security/MessageDigest;

    if-eqz p0, :cond_0

    int-to-byte p1, p1

    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update(B)V

    :cond_0
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ljava/io/PrintWriter;->write(Ljava/lang/String;II)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h0r0;->a:Ljava/security/MessageDigest;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/h0r0;->c:Ll/h0r0$a;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/h0r0$a;->a(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/h0r0;->a:Ljava/security/MessageDigest;

    .line 19
    .line 20
    iget-object p0, p0, Ll/h0r0;->b:Ljava/nio/charset/Charset;

    .line 21
    .line 22
    add-int/2addr p3, p2

    .line 23
    invoke-static {p1, p2, p3}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;II)Ljava/nio/CharBuffer;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ljava/nio/charset/Charset;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public write([CII)V
    .locals 0

    .line 40
    invoke-super {p0, p1, p2, p3}, Ljava/io/PrintWriter;->write([CII)V

    iget-object p2, p0, Ll/h0r0;->a:Ljava/security/MessageDigest;

    if-eqz p2, :cond_0

    iget-object p0, p0, Ll/h0r0;->b:Ljava/nio/charset/Charset;

    invoke-static {p1}, Ljava/nio/CharBuffer;->wrap([C)Ljava/nio/CharBuffer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/nio/charset/Charset;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/security/MessageDigest;->update([B)V

    :cond_0
    return-void
.end method
