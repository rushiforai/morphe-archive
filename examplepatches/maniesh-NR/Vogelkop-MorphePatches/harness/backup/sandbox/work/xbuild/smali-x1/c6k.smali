.class public final Lc6k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/LinkedHashMap;

.field public final b:Ljava/util/ArrayList;

.field public final c:Z


# direct methods
.method public constructor <init>(Ljava/util/LinkedHashMap;Ljava/util/ArrayList;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc6k;->a:Ljava/util/LinkedHashMap;

    iput-object p2, p0, Lc6k;->b:Ljava/util/ArrayList;

    iput-boolean p3, p0, Lc6k;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Lc6k;

    if-eqz v0, :cond_22

    check-cast p1, Lc6k;

    iget-object v0, p0, Lc6k;->a:Ljava/util/LinkedHashMap;

    iget-object v1, p1, Lc6k;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lc6k;->b:Ljava/util/ArrayList;

    iget-object v1, p1, Lc6k;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-boolean p0, p0, Lc6k;->c:Z

    iget-boolean p1, p1, Lc6k;->c:Z

    if-eq p0, p1, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lc6k;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lc6k;->b:Ljava/util/ArrayList;

    invoke-static {v2, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-boolean p0, p0, Lc6k;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
