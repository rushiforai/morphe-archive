.class public final Ln3l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ln3l;

.field public static final e:Ln3l;


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ln3l;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v1, v2}, Ln3l;-><init>(ZZLjava/lang/Integer;)V

    sput-object v0, Ln3l;->d:Ln3l;

    new-instance v0, Ln3l;

    const/4 v3, 0x1

    invoke-direct {v0, v3, v1, v2}, Ln3l;-><init>(ZZLjava/lang/Integer;)V

    sput-object v0, Ln3l;->e:Ln3l;

    return-void
.end method

.method public constructor <init>(ZZLjava/lang/Integer;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ln3l;->a:Z

    iput-boolean p2, p0, Ln3l;->b:Z

    iput-object p3, p0, Ln3l;->c:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Ln3l;

    if-eqz v0, :cond_1e

    check-cast p1, Ln3l;

    iget-boolean v0, p0, Ln3l;->a:Z

    iget-boolean v1, p1, Ln3l;->a:Z

    if-ne v0, v1, :cond_1e

    iget-boolean v0, p0, Ln3l;->b:Z

    iget-boolean v1, p1, Ln3l;->b:Z

    if-ne v0, v1, :cond_1e

    iget-object p0, p0, Ln3l;->c:Ljava/lang/Integer;

    iget-object p1, p1, Ln3l;->c:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Ln3l;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Ln3l;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Ln3l;->c:Ljava/lang/Integer;

    if-nez p0, :cond_15

    const/4 p0, 0x0

    goto :goto_19

    :cond_15
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_19
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
