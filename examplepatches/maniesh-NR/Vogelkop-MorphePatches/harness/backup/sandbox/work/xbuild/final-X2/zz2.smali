.class public abstract Lzz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lih4;


# instance fields
.field public a:Z

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lmyk;Lcom/opera/api/Callback;)V
    .registers 3

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p2, p0, Lzz2;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;ILro9;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lzz2;->b:Ljava/lang/Object;

    new-instance p3, Lfv2;

    const/4 v0, 0x4

    invoke-direct {p3, p0, v0}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, p3}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    iput-object v0, p0, Lzz2;->c:Ljava/lang/Object;

    int-to-long v2, p2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const/4 v1, 0x0

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method


# virtual methods
.method public abstract a(Z)V
.end method

.method public abstract b()V
.end method

.method public final c(Ljava/lang/Boolean;)V
    .registers 4

    iget-boolean v0, p0, Lzz2;->a:Z

    if-nez v0, :cond_15

    const/4 v0, 0x0

    iput-object v0, p0, Lzz2;->c:Ljava/lang/Object;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lzz2;->a:Z

    iget-object v1, p0, Lzz2;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    if-eqz v1, :cond_15

    invoke-interface {v1, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    iput-object v0, p0, Lzz2;->b:Ljava/lang/Object;

    :cond_15
    return-void
.end method

.method public final cancel()V
    .registers 3

    iget-boolean v0, p0, Lzz2;->a:Z

    if-nez v0, :cond_15

    const/4 v0, 0x1

    iput-boolean v0, p0, Lzz2;->a:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lzz2;->b:Ljava/lang/Object;

    iget-object v1, p0, Lzz2;->c:Ljava/lang/Object;

    check-cast v1, Lih4;

    if-eqz v1, :cond_15

    invoke-interface {v1}, Lih4;->cancel()V

    iput-object v0, p0, Lzz2;->c:Ljava/lang/Object;

    :cond_15
    return-void
.end method

.method public abstract d(Lcom/opera/android/oauth2/OperaAccessToken;)Lih4;
.end method
