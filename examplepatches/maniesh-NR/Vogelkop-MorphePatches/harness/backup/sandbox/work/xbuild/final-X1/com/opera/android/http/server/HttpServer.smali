.class public final Lcom/opera/android/http/server/HttpServer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/HashMap;

.field public b:J

.field public c:I

.field public d:Lsu;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/opera/android/http/server/HttpServer;->a:Ljava/util/HashMap;

    invoke-static {p0}, LJ/N;->Mrh$3rRC(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/http/server/HttpServer;->b:J

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 4

    iget-wide v0, p0, Lcom/opera/android/http/server/HttpServer;->b:J

    invoke-static {v0, v1, p1}, LJ/N;->MermPfhq(JLjava/lang/Object;)V

    iget-object p0, p0, Lcom/opera/android/http/server/HttpServer;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final onBind(I)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/http/server/HttpServer;->d:Lsu;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/opera/android/http/server/HttpServer;->d:Lsu;

    if-lez p1, :cond_b

    iput p1, p0, Lcom/opera/android/http/server/HttpServer;->c:I

    const/4 p0, 0x1

    goto :goto_c

    :cond_b
    const/4 p0, 0x0

    :goto_c
    if-eqz v0, :cond_15

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Lsu;->run(Ljava/lang/Object;)V

    :cond_15
    return-void
.end method

.method public final onLoaded(Ljava/lang/String;Z)V
    .registers 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/http/server/HttpServer;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/api/Callback;

    if-eqz p0, :cond_11

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_11
    return-void
.end method
