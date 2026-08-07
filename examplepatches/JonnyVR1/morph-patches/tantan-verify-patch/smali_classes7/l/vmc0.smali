.class public final Ll/vmc0;
.super Ll/k5d0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:Lokio/BufferedSource;


# direct methods
.method public constructor <init>(Ljava/lang/String;JLokio/BufferedSource;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k5d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vmc0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/vmc0;->b:J

    .line 7
    .line 8
    iput-object p4, p0, Ll/vmc0;->c:Lokio/BufferedSource;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vmc0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public contentType()Ll/e7y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vmc0;->a:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public source()Lokio/BufferedSource;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vmc0;->c:Lokio/BufferedSource;

    .line 2
    .line 3
    return-object p0
.end method
