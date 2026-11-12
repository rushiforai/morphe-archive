.class public final Leef;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Laln;

.field public final b:Lg7j;


# direct methods
.method public synthetic constructor <init>(Laln;)V
    .registers 3

    invoke-interface {p1}, Laln;->b()Lg7j;

    move-result-object v0

    if-nez v0, :cond_8

    sget-object v0, Lg7j;->h:Lg7j;

    :cond_8
    invoke-direct {p0, p1, v0}, Leef;-><init>(Laln;Lg7j;)V

    return-void
.end method

.method public constructor <init>(Laln;Lg7j;)V
    .registers 3

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Leef;->a:Laln;

    .line 14
    iput-object p2, p0, Leef;->b:Lg7j;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Leef;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Leef;

    iget-object v1, p0, Leef;->a:Laln;

    iget-object v3, p1, Leef;->a:Laln;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Leef;->b:Lg7j;

    iget-object p1, p1, Leef;->b:Lg7j;

    if-eq p0, p1, :cond_1e

    return v2

    :cond_1e
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Leef;->a:Laln;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Leef;->b:Lg7j;

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
