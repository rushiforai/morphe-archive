.class public Ll/dml$a;
.super Ll/gc20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dml;->n0(ILokhttp3/internal/http2/ErrorCode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:I

.field public final synthetic c:Lokhttp3/internal/http2/ErrorCode;

.field public final synthetic d:Ll/dml;


# direct methods
.method public varargs constructor <init>(Ll/dml;Ljava/lang/String;[Ljava/lang/Object;ILokhttp3/internal/http2/ErrorCode;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dml$a;->d:Ll/dml;

    .line 2
    .line 3
    iput p4, p0, Ll/dml$a;->b:I

    .line 4
    .line 5
    iput-object p5, p0, Ll/dml$a;->c:Lokhttp3/internal/http2/ErrorCode;

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
    :try_start_0
    iget-object v0, p0, Ll/dml$a;->d:Ll/dml;

    .line 2
    .line 3
    iget v1, p0, Ll/dml$a;->b:I

    .line 4
    .line 5
    iget-object v2, p0, Ll/dml$a;->c:Lokhttp3/internal/http2/ErrorCode;

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Ll/dml;->m0(ILokhttp3/internal/http2/ErrorCode;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception v0

    .line 12
    iget-object p0, p0, Ll/dml$a;->d:Ll/dml;

    .line 13
    .line 14
    invoke-static {p0, v0}, Ll/dml;->b(Ll/dml;Ljava/io/IOException;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
