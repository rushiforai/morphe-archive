.class public Ll/dml$d;
.super Ll/gc20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dml;->Q(ILjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ll/dml;


# direct methods
.method public varargs constructor <init>(Ll/dml;Ljava/lang/String;[Ljava/lang/Object;ILjava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dml$d;->d:Ll/dml;

    .line 2
    .line 3
    iput p4, p0, Ll/dml$d;->b:I

    .line 4
    .line 5
    iput-object p5, p0, Ll/dml$d;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Ll/gc20;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dml$d;->d:Ll/dml;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dml;->j:Ll/vnb0;

    .line 4
    .line 5
    iget v1, p0, Ll/dml$d;->b:I

    .line 6
    .line 7
    iget-object v2, p0, Ll/dml$d;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, v1, v2}, Ll/vnb0;->a(ILjava/util/List;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    :try_start_0
    iget-object v0, p0, Ll/dml$d;->d:Ll/dml;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dml;->w:Ll/hml;

    .line 18
    .line 19
    iget v1, p0, Ll/dml$d;->b:I

    .line 20
    .line 21
    sget-object v2, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ll/hml;->H(ILokhttp3/internal/http2/ErrorCode;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/dml$d;->d:Ll/dml;

    .line 27
    .line 28
    monitor-enter v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :try_start_1
    iget-object v1, p0, Ll/dml$d;->d:Ll/dml;

    .line 30
    .line 31
    iget-object v1, v1, Ll/dml;->y:Ljava/util/Set;

    .line 32
    .line 33
    iget p0, p0, Ll/dml$d;->b:I

    .line 34
    .line 35
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    monitor-exit v0

    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 47
    :catch_0
    :cond_0
    return-void
.end method
