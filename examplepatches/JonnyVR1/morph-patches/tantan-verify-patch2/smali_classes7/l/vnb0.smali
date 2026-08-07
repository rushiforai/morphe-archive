.class public interface abstract Ll/vnb0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/vnb0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vnb0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vnb0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/vnb0;->a:Ll/vnb0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract a(ILjava/util/List;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ll/xzk;",
            ">;)Z"
        }
    .end annotation
.end method

.method public abstract b(ILjava/util/List;Z)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ll/xzk;",
            ">;Z)Z"
        }
    .end annotation
.end method

.method public abstract c(ILokio/BufferedSource;IZ)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract d(ILokhttp3/internal/http2/ErrorCode;)V
.end method
