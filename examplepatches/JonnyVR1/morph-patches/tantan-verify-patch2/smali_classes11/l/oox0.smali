.class public Ll/oox0;
.super Ll/clw0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/play_billing/d0<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Ll/oox0<",
        "TMessageType;TBuilderType;>;>",
        "Ll/clw0<",
        "TMessageType;TBuilderType;>;"
    }
.end annotation


# instance fields
.field public final a:Lcom/google/android/gms/internal/play_billing/d0;

.field public b:Lcom/google/android/gms/internal/play_billing/d0;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/play_billing/d0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/clw0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oox0;->a:Lcom/google/android/gms/internal/play_billing/d0;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/play_billing/d0;->e()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/gms/internal/play_billing/d0;->m()Lcom/google/android/gms/internal/play_billing/d0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "Default instance must be immutable."

    .line 20
    .line 21
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    throw p0
.end method

.method public static e(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gxx0;->a()Ll/gxx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/gxx0;->b(Ljava/lang/Class;)Ll/uxx0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0, p0, p1}, Ll/uxx0;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final bridge synthetic c()Ll/clw0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oox0;->f()Ll/oox0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/oox0;->f()Ll/oox0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final f()Ll/oox0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oox0;->a:Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/play_billing/d0;->h(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/oox0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/oox0;->l()Lcom/google/android/gms/internal/play_billing/d0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iput-object p0, v0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 16
    .line 17
    return-object v0
.end method

.method public final j(Lcom/google/android/gms/internal/play_billing/d0;)Ll/oox0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oox0;->a:Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/play_billing/d0;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->e()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/oox0;->n()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 21
    .line 22
    invoke-static {v0, p1}, Ll/oox0;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-object p0
.end method

.method public final k()Lcom/google/android/gms/internal/play_billing/d0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/oox0;->l()Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/play_billing/d0;->x(Lcom/google/android/gms/internal/play_billing/d0;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/play_billing/zzji;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/play_billing/zzji;-><init>(Ll/yvx0;)V

    .line 16
    .line 17
    .line 18
    throw v0
.end method

.method public l()Lcom/google/android/gms/internal/play_billing/d0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/internal/play_billing/d0;->t()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 16
    .line 17
    return-object p0
.end method

.method public final m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/oox0;->n()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oox0;->a:Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/internal/play_billing/d0;->m()Lcom/google/android/gms/internal/play_billing/d0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/oox0;->e(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic zzh()Ll/yvx0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/oox0;->l()Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final zzl()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/oox0;->b:Lcom/google/android/gms/internal/play_billing/d0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/play_billing/d0;->x(Lcom/google/android/gms/internal/play_billing/d0;Z)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method
