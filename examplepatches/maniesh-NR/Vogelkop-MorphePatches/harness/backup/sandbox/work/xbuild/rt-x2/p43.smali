.class public abstract Lp43;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf94;
.implements Lih4;


# instance fields
.field public final a:Lcom/opera/api/Callback;

.field public final b:Lq65;

.field public final c:B

.field public d:Lv84;

.field public e:Z

.field public f:I

.field public g:J

.field public final synthetic h:Ls43;


# direct methods
.method public constructor <init>(Ls43;Lcom/opera/api/Callback;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lp43;->h:Ls43;

    new-instance p1, Lfv2;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lfv2;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lq65;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lp43;->b:Lq65;

    const-wide/16 v0, 0x64

    iput-wide v0, p0, Lp43;->g:J

    iput-object p2, p0, Lp43;->a:Lcom/opera/api/Callback;

    const/4 p1, 0x3

    iput-byte p1, p0, Lp43;->c:B

    invoke-virtual {p0}, Lp43;->b()Lokhttp3/internal/connection/RealCall;

    move-result-object p1

    iput-object p1, p0, Lp43;->d:Lv84;

    invoke-interface {p1, p0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method


# virtual methods
.method public final a(Lq43;)V
    .registers 4

    iget-object v0, p0, Lp43;->a:Lcom/opera/api/Callback;

    if-nez v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lbi2;

    const/16 v1, 0x9

    invoke-direct {v0, p0, p1, v1}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void
.end method

.method public abstract b()Lokhttp3/internal/connection/RealCall;
.end method

.method public c(Lpzh;)Lq43;
    .registers 2

    new-instance p0, Lq43;

    invoke-direct {p0, p1}, Lq43;-><init>(Lpzh;)V

    return-object p0
.end method

.method public final cancel()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lp43;->e:Z

    iget-object v0, p0, Lp43;->b:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object p0, p0, Lp43;->d:Lv84;

    if-eqz p0, :cond_f

    invoke-interface {p0}, Lv84;->cancel()V

    :cond_f
    return-void
.end method

.method public d(Lpzh;)Z
    .registers 2

    iget p0, p1, Lpzh;->d:I

    const/16 p1, 0xc8

    if-ne p0, p1, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final e(Ljava/lang/Runnable;)V
    .registers 5

    iget-object v0, p0, Lp43;->h:Ls43;

    iget-object v0, v0, Ls43;->b:Lumi;

    new-instance v1, Lbi2;

    const/16 v2, 0xa

    invoke-direct {v1, p0, p1, v2}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public abstract f(Lpzh;)V
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 7

    iget p1, p0, Lp43;->f:I

    iget-byte v0, p0, Lp43;->c:B

    if-lt p1, v0, :cond_14

    new-instance p1, Lq43;

    const/4 v0, -0x2

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, v0, p2}, Lq43;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, p1}, Lp43;->a(Lq43;)V

    return-void

    :cond_14
    const/4 p2, 0x1

    add-int/2addr p1, p2

    iput p1, p0, Lp43;->f:I

    iget-wide v0, p0, Lp43;->g:J

    shl-long v2, v0, p2

    iput-wide v2, p0, Lp43;->g:J

    new-instance p1, Loi2;

    invoke-direct {p1, p0, v0, v1, p2}, Loi2;-><init>(Ljava/lang/Object;JB)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 5

    invoke-virtual {p0, p2}, Lp43;->d(Lpzh;)Z

    move-result p1

    if-eqz p1, :cond_19

    :try_start_6
    invoke-virtual {p0, p2}, Lp43;->f(Lpzh;)V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_9} :catch_a

    goto :goto_20

    :catch_a
    move-exception p1

    new-instance v0, Lq43;

    const/4 v1, -0x2

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lq43;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v0}, Lp43;->a(Lq43;)V

    goto :goto_20

    :cond_19
    invoke-virtual {p0, p2}, Lp43;->c(Lpzh;)Lq43;

    move-result-object p1

    invoke-virtual {p0, p1}, Lp43;->a(Lq43;)V

    :goto_20
    invoke-virtual {p2}, Lpzh;->close()V

    return-void
.end method
