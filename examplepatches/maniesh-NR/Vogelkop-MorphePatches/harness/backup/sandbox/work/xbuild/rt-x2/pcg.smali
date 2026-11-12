.class public final Lpcg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lvd0;

.field public final b:Lop0;


# direct methods
.method public constructor <init>(Lvd0;Lop0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpcg;->a:Lvd0;

    iput-object p2, p0, Lpcg;->b:Lop0;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lpcg;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lpcg;

    iget-object v1, p0, Lpcg;->a:Lvd0;

    iget-object v3, p1, Lpcg;->a:Lvd0;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object p0, p0, Lpcg;->b:Lop0;

    iget-object p1, p1, Lpcg;->b:Lop0;

    if-eq p0, p1, :cond_1a

    return v2

    :cond_1a
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lpcg;->a:Lvd0;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lpcg;->b:Lop0;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
