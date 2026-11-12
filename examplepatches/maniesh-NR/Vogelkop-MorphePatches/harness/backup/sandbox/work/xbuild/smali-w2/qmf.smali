.class public final Lqmf;
.super Lja2;
.source "SourceFile"


# instance fields
.field public final b:Lfdn;


# direct methods
.method public constructor <init>(Lfdn;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqmf;->b:Lfdn;

    return-void
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

    const-class v2, Lqmf;

    if-eq v1, v2, :cond_d

    return v0

    :cond_d
    check-cast p1, Lqmf;

    iget-object p0, p0, Lqmf;->b:Lfdn;

    iget-object p1, p1, Lqmf;->b:Lfdn;

    invoke-virtual {p0, p1}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lqmf;->b:Lfdn;

    invoke-virtual {p0}, Lfdn;->hashCode()I

    move-result p0

    return p0
.end method
