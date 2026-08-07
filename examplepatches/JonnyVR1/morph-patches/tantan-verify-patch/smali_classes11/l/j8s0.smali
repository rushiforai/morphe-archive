.class public final Ll/j8s0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation


# instance fields
.field public a:Ljava/io/ByteArrayOutputStream;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public b:Landroid/util/Base64OutputStream;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 5
    .line 6
    const/16 v1, 0x1000

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/j8s0;->a:Ljava/io/ByteArrayOutputStream;

    .line 12
    .line 13
    new-instance v0, Landroid/util/Base64OutputStream;

    .line 14
    .line 15
    iget-object v1, p0, Ll/j8s0;->a:Ljava/io/ByteArrayOutputStream;

    .line 16
    .line 17
    const/16 v2, 0xa

    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Landroid/util/Base64OutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/j8s0;->b:Landroid/util/Base64OutputStream;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "HashManager: Unable to convert to Base64."

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Ll/j8s0;->b:Landroid/util/Base64OutputStream;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/util/Base64OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v1

    .line 10
    invoke-static {v0, v1}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    :goto_0
    const/4 v1, 0x0

    .line 14
    :try_start_1
    iget-object v2, p0, Ll/j8s0;->a:Ljava/io/ByteArrayOutputStream;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Ll/j8s0;->a:Ljava/io/ByteArrayOutputStream;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    goto :goto_1

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    goto :goto_2

    .line 28
    :catch_1
    move-exception v2

    .line 29
    :try_start_2
    invoke-static {v0, v2}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    const-string v0, ""
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 33
    .line 34
    :goto_1
    iput-object v1, p0, Ll/j8s0;->a:Ljava/io/ByteArrayOutputStream;

    .line 35
    .line 36
    iput-object v1, p0, Ll/j8s0;->b:Landroid/util/Base64OutputStream;

    .line 37
    .line 38
    return-object v0

    .line 39
    :goto_2
    iput-object v1, p0, Ll/j8s0;->a:Ljava/io/ByteArrayOutputStream;

    .line 40
    .line 41
    iput-object v1, p0, Ll/j8s0;->b:Landroid/util/Base64OutputStream;

    .line 42
    .line 43
    throw v0
.end method
