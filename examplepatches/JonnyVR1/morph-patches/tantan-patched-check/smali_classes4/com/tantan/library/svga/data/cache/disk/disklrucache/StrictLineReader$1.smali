.class Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader$1;
.super Ljava/io/ByteArrayOutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader;->readLine()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader;


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader$1;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget v0, p0, Ljava/io/ByteArrayOutputStream;->count:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ljava/io/ByteArrayOutputStream;->buf:[B

    .line 6
    .line 7
    add-int/lit8 v2, v0, -0x1

    .line 8
    .line 9
    aget-byte v1, v1, v2

    .line 10
    .line 11
    const/16 v2, 0xd

    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    .line 18
    .line 19
    iget-object v2, p0, Ljava/io/ByteArrayOutputStream;->buf:[B

    .line 20
    .line 21
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader$1;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader;->access$000(Lcom/tantan/library/svga/data/cache/disk/disklrucache/StrictLineReader;)Ljava/nio/charset/Charset;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-direct {v1, v2, v3, v0, p0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-object v1

    .line 36
    :catch_0
    move-exception p0

    .line 37
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method
