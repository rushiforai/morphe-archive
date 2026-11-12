.class public final Lpmf;
.super Ltc2;
.source "SourceFile"


# instance fields
.field public final b:Z

.field public final c:Lkotlin/jvm/functions/Function0;


# direct methods
.method public constructor <init>(ZLkotlin/jvm/functions/Function0;)V
    .registers 4

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Ltc2;-><init>(Z)V

    iput-boolean p1, p0, Lpmf;->b:Z

    iput-object p2, p0, Lpmf;->c:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lpmf;

    if-eqz v0, :cond_18

    check-cast p1, Lpmf;

    iget-boolean v0, p0, Lpmf;->b:Z

    iget-boolean v1, p1, Lpmf;->b:Z

    if-ne v0, v1, :cond_18

    iget-object p0, p0, Lpmf;->c:Lkotlin/jvm/functions/Function0;

    iget-object p1, p1, Lpmf;->c:Lkotlin/jvm/functions/Function0;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean v0, p0, Lpmf;->b:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lpmf;->c:Lkotlin/jvm/functions/Function0;

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
