.class public final Lykf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzcf;


# instance fields
.field public final synthetic a:Lqhf;

.field public final synthetic b:Lzkf;

.field public final synthetic c:Lc37;


# direct methods
.method public constructor <init>(Lc37;Lqhf;Lzkf;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lykf;->c:Lc37;

    iput-object p2, p0, Lykf;->a:Lqhf;

    iput-object p3, p0, Lykf;->b:Lzkf;

    return-void
.end method


# virtual methods
.method public final a(Lcm;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "initialize: onError, error="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lykf;->c:Lc37;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p0, Lykf;->a:Lqhf;

    invoke-static {v2, v0}, Lc37;->y(Lqhf;Ljava/lang/String;)V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v0, v1, Lc37;->a:Ljava/lang/Object;

    iget v0, p1, Lcm;->b:I

    iget-object p1, p1, Lcm;->c:Ljava/lang/String;

    invoke-static {v0, p1}, Lrm5;->q(ILjava/lang/String;)Lcom/google/android/gms/ads/AdError;

    move-result-object p1

    iput-object p1, v1, Lc37;->b:Ljava/lang/Object;

    iget-object p0, p0, Lykf;->b:Lzkf;

    invoke-interface {p0, p1}, Lzkf;->d(Lcom/google/android/gms/ads/AdError;)V

    return-void
.end method

.method public final onSuccess()V
    .registers 4

    iget-object v0, p0, Lykf;->c:Lc37;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, p0, Lykf;->a:Lqhf;

    const-string v2, "initialize: onSuccess"

    invoke-static {v1, v2}, Lc37;->y(Lqhf;Ljava/lang/String;)V

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v1, v0, Lc37;->a:Ljava/lang/Object;

    iget-object p0, p0, Lykf;->b:Lzkf;

    invoke-interface {p0}, Lzkf;->e()V

    return-void
.end method
