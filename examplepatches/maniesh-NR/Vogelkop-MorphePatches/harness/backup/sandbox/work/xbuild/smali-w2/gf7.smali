.class public final Lgf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfji;


# instance fields
.field public final a:Lre7;


# direct methods
.method public constructor <init>(Lre7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgf7;->a:Lre7;

    return-void
.end method


# virtual methods
.method public final b()J
    .registers 3

    iget-object p0, p0, Lgf7;->a:Lre7;

    iget-wide v0, p0, Lre7;->j:J

    return-wide v0
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgf7;->a:Lre7;

    iget-object p0, p0, Lre7;->m:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgf7;->a:Lre7;

    iget-object p0, p0, Lre7;->p:Ljava/lang/String;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lgf7;

    if-ne v1, v2, :cond_15

    check-cast p1, Lgf7;

    iget-object p1, p1, Lgf7;->a:Lre7;

    iget-object p0, p0, Lgf7;->a:Lre7;

    if-ne p0, p1, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    return v0
.end method

.method public final getFileName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgf7;->a:Lre7;

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lgf7;->a:Lre7;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final i()Z
    .registers 1

    iget-object p0, p0, Lgf7;->a:Lre7;

    invoke-virtual {p0}, Lre7;->i()Z

    move-result p0

    return p0
.end method
