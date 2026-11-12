.class public abstract Lnxc;
.super Lja2;
.source "SourceFile"


# instance fields
.field public final b:Lfdn;


# direct methods
.method public constructor <init>(Lfdn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnxc;->b:Lfdn;

    return-void
.end method

.method public static e(Lfdn;)Lnxc;
    .registers 4

    invoke-virtual {p0}, Lfdn;->b()Z

    move-result v0

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_19

    new-instance v0, Lkxc;

    invoke-direct {v0, p0}, Lnxc;-><init>(Lfdn;)V

    return-object v0

    :cond_19
    new-instance v1, Lixc;

    invoke-direct {v1, p0, v0}, Lixc;-><init>(Lfdn;Ljava/util/List;)V

    return-object v1

    :cond_1f
    iget-object v0, p0, Lfdn;->f:Lfdn;

    new-instance v1, Ljxc;

    invoke-direct {v1, v0, p0}, Ljxc;-><init>(Lfdn;Lfdn;)V

    return-object v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_f

    return v0

    :cond_f
    check-cast p1, Lnxc;

    iget-object p0, p0, Lnxc;->b:Lfdn;

    iget-object p1, p1, Lnxc;->b:Lfdn;

    invoke-virtual {p0, p1}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lnxc;->b:Lfdn;

    invoke-virtual {p0}, Lfdn;->hashCode()I

    move-result p0

    return p0
.end method
