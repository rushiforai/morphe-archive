.class public final Ll03;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lqjn;

.field public final b:Lkl5;

.field public final c:Ljzk;


# direct methods
.method public constructor <init>(Lqjn;Lkl5;Ljzk;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll03;->a:Lqjn;

    iput-object p2, p0, Ll03;->b:Lkl5;

    iput-object p3, p0, Ll03;->c:Ljzk;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ll03;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ll03;

    iget-object v1, p0, Ll03;->a:Lqjn;

    iget-object v3, p1, Ll03;->a:Lqjn;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Ll03;->b:Lkl5;

    iget-object v3, p1, Ll03;->b:Lkl5;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Ll03;->c:Ljzk;

    iget-object p1, p1, Ll03;->c:Ljzk;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    return v2

    :cond_2d
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Ll03;->a:Lqjn;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Ll03;->b:Lkl5;

    invoke-virtual {v1}, Lkl5;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Ll03;->c:Ljzk;

    invoke-virtual {p0}, Ljzk;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
