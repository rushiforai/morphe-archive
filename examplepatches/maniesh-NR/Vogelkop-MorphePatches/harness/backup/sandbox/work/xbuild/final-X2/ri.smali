.class public final Lri;
.super Lxz;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lwz;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1}, Lxz;-><init>(Lwz;)V

    iput-object p2, p0, Lri;->b:Ljava/lang/String;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p2, "a"

    invoke-virtual {p1, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lri;->c:Ljava/lang/String;

    const-string p2, "m"

    invoke-virtual {p1, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lri;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lri;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lri;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final c()V
    .registers 3

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    iget-object p0, p0, Lri;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lfvh;->h(Ljava/lang/String;)V

    new-instance p0, Lkvh;

    invoke-direct {p0, v0}, Lkvh;-><init>(Lfvh;)V

    sget-object v0, Lxne;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    invoke-virtual {v0, p0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    new-instance v0, Lydp;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lydp;-><init>(B)V

    invoke-interface {p0, v0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method
