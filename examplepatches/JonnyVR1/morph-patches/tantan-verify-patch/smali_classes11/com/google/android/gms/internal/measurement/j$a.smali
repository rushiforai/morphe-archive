.class public final Lcom/google/android/gms/internal/measurement/j$a;
.super Lcom/google/android/gms/internal/measurement/u0$b;
.source "SourceFile"

# interfaces
.implements Ll/v9y0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/measurement/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/measurement/u0$b<",
        "Lcom/google/android/gms/internal/measurement/j;",
        "Lcom/google/android/gms/internal/measurement/j$a;",
        ">;",
        "Ll/v9y0;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/j;->L()Lcom/google/android/gms/internal/measurement/j;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/measurement/u0$b;-><init>(Lcom/google/android/gms/internal/measurement/u0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/jnw0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/google/android/gms/internal/measurement/j$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final A()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/u0$b;->b:Lcom/google/android/gms/internal/measurement/u0;

    .line 2
    .line 3
    check-cast p0, Lcom/google/android/gms/internal/measurement/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/j;->V()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final B()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/measurement/h;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/u0$b;->b:Lcom/google/android/gms/internal/measurement/u0;

    .line 2
    .line 3
    check-cast p0, Lcom/google/android/gms/internal/measurement/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/j;->W()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final v()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/u0$b;->b:Lcom/google/android/gms/internal/measurement/u0;

    .line 2
    .line 3
    check-cast p0, Lcom/google/android/gms/internal/measurement/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/j;->E()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final w(I)Lcom/google/android/gms/internal/measurement/i;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/u0$b;->b:Lcom/google/android/gms/internal/measurement/u0;

    .line 2
    .line 3
    check-cast p0, Lcom/google/android/gms/internal/measurement/j;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/measurement/j;->B(I)Lcom/google/android/gms/internal/measurement/i;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final x(ILcom/google/android/gms/internal/measurement/i$a;)Lcom/google/android/gms/internal/measurement/j$a;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/u0$b;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/u0$b;->b:Lcom/google/android/gms/internal/measurement/u0;

    .line 5
    .line 6
    check-cast v0, Lcom/google/android/gms/internal/measurement/j;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/u0$b;->H()Ll/m9y0;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, Lcom/google/android/gms/internal/measurement/u0;

    .line 13
    .line 14
    check-cast p2, Lcom/google/android/gms/internal/measurement/i;

    .line 15
    .line 16
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/measurement/j;->D(Lcom/google/android/gms/internal/measurement/j;ILcom/google/android/gms/internal/measurement/i;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public final y()Lcom/google/android/gms/internal/measurement/j$a;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/u0$b;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/u0$b;->b:Lcom/google/android/gms/internal/measurement/u0;

    .line 5
    .line 6
    check-cast v0, Lcom/google/android/gms/internal/measurement/j;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/google/android/gms/internal/measurement/j;->C(Lcom/google/android/gms/internal/measurement/j;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final z()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/u0$b;->b:Lcom/google/android/gms/internal/measurement/u0;

    .line 2
    .line 3
    check-cast p0, Lcom/google/android/gms/internal/measurement/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/j;->U()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
