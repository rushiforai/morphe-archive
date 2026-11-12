.class public final Ln3b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ln3b;


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ln3b;

    const/4 v1, 0x1

    invoke-direct {v0, v1, v1, v1}, Ln3b;-><init>(ZZZ)V

    sput-object v0, Ln3b;->d:Ln3b;

    return-void
.end method

.method public constructor <init>(ZZZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ln3b;->a:Z

    iput-boolean p2, p0, Ln3b;->b:Z

    iput-boolean p3, p0, Ln3b;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1c

    instance-of v0, p1, Ln3b;

    if-eqz v0, :cond_1a

    check-cast p1, Ln3b;

    iget-boolean v0, p0, Ln3b;->a:Z

    iget-boolean v1, p1, Ln3b;->a:Z

    if-ne v0, v1, :cond_1a

    iget-boolean v0, p0, Ln3b;->b:Z

    iget-boolean v1, p1, Ln3b;->b:Z

    if-ne v0, v1, :cond_1a

    iget-boolean p0, p0, Ln3b;->c:Z

    iget-boolean p1, p1, Ln3b;->c:Z

    if-eq p0, p1, :cond_1c

    :cond_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Ln3b;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Ln3b;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Ln3b;->c:Z

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
