.class public final Lnnb;
.super Lfnb;
.source "SourceFile"


# instance fields
.field public final i:Ljava/net/HttpURLConnection;

.field public final j:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public k:Ljava/nio/channels/WritableByteChannel;

.field public l:Ljava/io/OutputStream;

.field public final synthetic m:Lpnb;


# direct methods
.method public constructor <init>(Lpnb;Ljava/util/concurrent/Executor;Lonb;Ljava/net/HttpURLConnection;Ltom;)V
    .registers 6

    iput-object p1, p0, Lnnb;->m:Lpnb;

    invoke-direct {p0, p2, p3, p5}, Lfnb;-><init>(Ljava/util/concurrent/Executor;Lonb;Ltom;)V

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lnnb;->j:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p4, p0, Lnnb;->i:Ljava/net/HttpURLConnection;

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/Exception;)V
    .registers 4

    new-instance v0, Ls21;

    const-string v1, "Exception received from UploadDataProvider"

    invoke-direct {v0, v1, p1}, Lorg/chromium/net/CallbackException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object p0, p0, Lnnb;->m:Lpnb;

    invoke-virtual {p0, v0}, Lpnb;->b(Lorg/chromium/net/CronetException;)V

    return-void
.end method
