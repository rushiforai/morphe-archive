.class public abstract Lhj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    sput-object v0, Lhj;->a:Li7f;

    return-void
.end method

.method public static a(I)Ljava/util/List;
    .registers 1

    invoke-static {p0}, LJ/N;->MFFpbV1Q(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static b(IILjava/lang/String;Z)V
    .registers 7

    invoke-static {p2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3d

    invoke-static {p2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_f

    move v1, v2

    goto :goto_13

    :cond_f
    invoke-static {v1, p3}, LJ/N;->M$NXlYYm(Ljava/lang/Object;Z)I

    move-result v1

    :goto_13
    invoke-static {v0, p0, p1, p3}, LJ/N;->Mfif1WYl(Ljava/lang/Object;IIZ)I

    move-result p0

    invoke-static {p2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_21

    invoke-static {p1, p3}, LJ/N;->M$NXlYYm(Ljava/lang/Object;Z)I

    move-result v2

    :cond_21
    xor-int/2addr v1, v2

    const/4 p1, -0x1

    if-eq p0, p1, :cond_3d

    if-eqz v1, :cond_3d

    sget-object p0, Lhj;->a:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_2d
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3d

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgj;

    invoke-interface {p1, v2, v1, v0}, Lgj;->a(IILjava/lang/String;)V

    goto :goto_2d

    :cond_3d
    return-void
.end method
