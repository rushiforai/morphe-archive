.class public final Ldk5;
.super Lek5;
.source "SourceFile"


# instance fields
.field public final a:Luj5;

.field public final b:Lgk5;


# direct methods
.method public constructor <init>(Luj5;Lgk5;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldk5;->a:Luj5;

    iput-object p2, p0, Ldk5;->b:Lgk5;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Ldk5;

    if-eqz v0, :cond_18

    check-cast p1, Ldk5;

    iget-object v0, p0, Ldk5;->a:Luj5;

    iget-object v1, p1, Ldk5;->a:Luj5;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object p0, p0, Ldk5;->b:Lgk5;

    iget-object p1, p1, Ldk5;->b:Lgk5;

    if-eq p0, p1, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Ldk5;->a:Luj5;

    invoke-virtual {v0}, Luj5;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Ldk5;->b:Lgk5;

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
