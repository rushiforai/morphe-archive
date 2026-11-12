.class public final Lx9g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lw9g;

.field public final b:Lb94;


# direct methods
.method public constructor <init>(Lw9g;Lb94;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx9g;->a:Lw9g;

    iput-object p2, p0, Lx9g;->b:Lb94;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_23

    const-class v2, Lx9g;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_23

    check-cast p1, Lx9g;

    iget-object v2, p0, Lx9g;->a:Lw9g;

    iget-object v3, p1, Lx9g;->a:Lw9g;

    invoke-virtual {v2, v3}, Lw9g;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    iget-object p0, p0, Lx9g;->b:Lb94;

    iget-object p1, p1, Lx9g;->b:Lb94;

    if-eq p0, p1, :cond_22

    return v1

    :cond_22
    return v0

    :cond_23
    return v1
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lx9g;->a:Lw9g;

    iget-object p0, p0, Lx9g;->b:Lb94;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
