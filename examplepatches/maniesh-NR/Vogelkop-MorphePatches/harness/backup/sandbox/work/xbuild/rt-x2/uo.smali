.class public final Luo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbz;

.field public final b:Ldl;


# direct methods
.method public constructor <init>(Lbz;Ldl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luo;->a:Lbz;

    iput-object p2, p0, Luo;->b:Ldl;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_22

    if-eqz p1, :cond_24

    const-class v0, Luo;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_24

    check-cast p1, Luo;

    iget-object v0, p1, Luo;->a:Lbz;

    iget-object v1, p0, Luo;->a:Lbz;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object p1, p1, Luo;->b:Ldl;

    iget-object p0, p0, Luo;->b:Ldl;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    :cond_22
    const/4 p0, 0x1

    return p0

    :cond_24
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Luo;->a:Lbz;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object p0, p0, Luo;->b:Ldl;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    xor-int/2addr v0, p0

    return v0
.end method
