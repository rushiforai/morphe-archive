.class public Ll/dml$e;
.super Ll/gc20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dml;->N(ILjava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:I

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Z

.field public final synthetic e:Ll/dml;


# direct methods
.method public varargs constructor <init>(Ll/dml;Ljava/lang/String;[Ljava/lang/Object;ILjava/util/List;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dml$e;->e:Ll/dml;

    .line 2
    .line 3
    iput p4, p0, Ll/dml$e;->b:I

    .line 4
    .line 5
    iput-object p5, p0, Ll/dml$e;->c:Ljava/util/List;

    .line 6
    .line 7
    iput-boolean p6, p0, Ll/dml$e;->d:Z

    .line 8
    .line 9
    invoke-direct {p0, p2, p3}, Ll/gc20;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public k()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dml$e;->e:Ll/dml;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dml;->j:Ll/vnb0;

    .line 4
    .line 5
    iget v1, p0, Ll/dml$e;->b:I

    .line 6
    .line 7
    iget-object v2, p0, Ll/dml$e;->c:Ljava/util/List;

    .line 8
    .line 9
    iget-boolean v3, p0, Ll/dml$e;->d:Z

    .line 10
    .line 11
    invoke-interface {v0, v1, v2, v3}, Ll/vnb0;->b(ILjava/util/List;Z)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    :try_start_0
    iget-object v1, p0, Ll/dml$e;->e:Ll/dml;

    .line 18
    .line 19
    iget-object v1, v1, Ll/dml;->w:Ll/hml;

    .line 20
    .line 21
    iget v2, p0, Ll/dml$e;->b:I

    .line 22
    .line 23
    sget-object v3, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    .line 24
    .line 25
    invoke-virtual {v1, v2, v3}, Ll/hml;->H(ILokhttp3/internal/http2/ErrorCode;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    if-nez v0, :cond_1

    .line 29
    .line 30
    iget-boolean v0, p0, Ll/dml$e;->d:Z

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Ll/dml$e;->e:Ll/dml;

    .line 35
    .line 36
    monitor-enter v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    :try_start_1
    iget-object v1, p0, Ll/dml$e;->e:Ll/dml;

    .line 38
    .line 39
    iget-object v1, v1, Ll/dml;->y:Ljava/util/Set;

    .line 40
    .line 41
    iget p0, p0, Ll/dml$e;->b:I

    .line 42
    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    monitor-exit v0

    .line 51
    return-void

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 55
    :catch_0
    :cond_2
    return-void
.end method
