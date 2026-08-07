.class public Ll/tx3$b;
.super Ll/k5d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tx3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/x4e$e;

.field public final b:Lokio/BufferedSource;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/x4e$e;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k5d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tx3$b;->a:Ll/x4e$e;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tx3$b;->c:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tx3$b;->d:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    invoke-virtual {p1, p2}, Ll/x4e$e;->m(I)Lokio/Source;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance p3, Ll/tx3$b$a;

    .line 16
    .line 17
    invoke-direct {p3, p0, p2, p1}, Ll/tx3$b$a;-><init>(Ll/tx3$b;Lokio/Source;Ll/x4e$e;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p3}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/tx3$b;->b:Lokio/BufferedSource;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public contentLength()J
    .locals 2

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Ll/tx3$b;->d:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    :catch_0
    :cond_0
    return-wide v0
.end method

.method public contentType()Ll/e7y;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx3$b;->c:Ljava/lang/String;

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
    iget-object p0, p0, Ll/tx3$b;->b:Lokio/BufferedSource;

    .line 2
    .line 3
    return-object p0
.end method
