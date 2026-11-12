.class public final Lfe9;
.super Lr43;
.source "SourceFile"


# instance fields
.field public final synthetic i:J

.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Lre9;

.field public final synthetic l:Lle9;


# direct methods
.method public constructor <init>(JLvk2;Lle9;Lre9;Ljava/lang/String;)V
    .registers 7

    iput-wide p1, p0, Lfe9;->i:J

    iput-object p6, p0, Lfe9;->j:Ljava/lang/String;

    iput-object p5, p0, Lfe9;->k:Lre9;

    iput-object p4, p0, Lfe9;->l:Lle9;

    invoke-direct {p0, p4, p3}, Lp43;-><init>(Ls43;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final b()Lokhttp3/internal/connection/RealCall;
    .registers 6

    iget-object v0, p0, Lfe9;->l:Lle9;

    iget-object v1, v0, Ls43;->a:Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lt9f;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "messages/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v3, p0, Lfe9;->i:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    iget-object p0, p0, Lfe9;->j:Ljava/lang/String;

    invoke-virtual {v0, v2, p0, v3}, Ls43;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;

    move-result-object p0

    invoke-static {p0, v1}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0
.end method

.method public final g(Lorb;)V
    .registers 5

    new-instance v0, Lje9;

    invoke-direct {v0, p1}, Lje9;-><init>(Lorb;)V

    new-instance p1, Lcn7;

    const/16 v1, 0x19

    iget-object v2, p0, Lfe9;->k:Lre9;

    invoke-direct {p1, v2, v0, v1}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lp43;->e(Ljava/lang/Runnable;)V

    return-void
.end method
