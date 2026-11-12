.class public final Lykd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Luh0;

.field public final b:Lrh0;

.field public final c:Lsh0;

.field public final d:Lqh0;

.field public final e:Z


# direct methods
.method public constructor <init>(Luh0;Lrh0;Lsh0;Lqh0;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lykd;->a:Luh0;

    iput-object p2, p0, Lykd;->b:Lrh0;

    iput-object p3, p0, Lykd;->c:Lsh0;

    iput-object p4, p0, Lykd;->d:Lqh0;

    iput-boolean p5, p0, Lykd;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2c

    if-eqz p1, :cond_2e

    const-class v0, Lykd;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_2e

    check-cast p1, Lykd;

    iget-boolean v0, p0, Lykd;->e:Z

    iget-boolean v1, p1, Lykd;->e:Z

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Lykd;->a:Luh0;

    iget-object v1, p1, Lykd;->a:Luh0;

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Lykd;->b:Lrh0;

    iget-object v1, p1, Lykd;->b:Lrh0;

    if-ne v0, v1, :cond_2e

    iget-object v0, p0, Lykd;->c:Lsh0;

    iget-object v1, p1, Lykd;->c:Lsh0;

    if-ne v0, v1, :cond_2e

    iget-object p0, p0, Lykd;->d:Lqh0;

    iget-object p1, p1, Lykd;->d:Lqh0;

    if-ne p0, p1, :cond_2e

    :cond_2c
    const/4 p0, 0x1

    return p0

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-boolean v0, p0, Lykd;->e:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Lykd;->a:Luh0;

    iget-object v2, p0, Lykd;->b:Lrh0;

    iget-object v3, p0, Lykd;->c:Lsh0;

    iget-object p0, p0, Lykd;->d:Lqh0;

    filled-new-array {v1, v2, v3, p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
