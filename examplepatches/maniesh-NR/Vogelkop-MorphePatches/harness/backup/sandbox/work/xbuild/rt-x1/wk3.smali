.class public final Lwk3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lodb;


# instance fields
.field public final a:Lx5f;

.field public b:Z


# direct methods
.method public constructor <init>(Lx5f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwk3;->a:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 4

    iget-boolean p1, p0, Lwk3;->b:Z

    if-nez p1, :cond_d

    const/4 p1, 0x1

    iput-boolean p1, p0, Lwk3;->b:Z

    iget-object p0, p0, Lwk3;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-nez p1, :cond_e

    :cond_d
    return-void

    :cond_e
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfi0;->x(Lzpa;)Lm80;

    move-result-object p1

    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Ljf0;->e(I)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final b(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 4

    iget-object p0, p0, Lwk3;->a:Lx5f;

    iget-boolean p1, p0, Lx5f;->h:Z

    if-nez p1, :cond_7

    return-void

    :cond_7
    iget-object p1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfi0;->x(Lzpa;)Lm80;

    move-result-object p1

    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Ljf0;->e(I)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final reset()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lwk3;->b:Z

    return-void
.end method
