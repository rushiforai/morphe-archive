.class public final Lvr8;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final l:Lvr8;


# instance fields
.field public final a:Lcxh;

.field public final b:Llaj;

.field public final c:Lfxh;

.field public final d:Lcxh;

.field public final e:Lcxh;

.field public final f:Lcxh;

.field public final g:Lcxh;

.field public final h:Lcxh;

.field public final i:Lcxh;

.field public final j:Lfxh;

.field public final k:B


# direct methods
.method static constructor <clinit>()V
    .registers 12

    new-instance v0, Lvr8;

    new-instance v1, Ldxh;

    const v2, 0x1010038

    invoke-direct {v1, v2}, Ldxh;-><init>(I)V

    new-instance v3, Lfxh;

    const v2, 0x106000d

    invoke-direct {v3, v2}, Lfxh;-><init>(I)V

    new-instance v4, Ldxh;

    const v2, 0x7f04047f

    invoke-direct {v4, v2}, Ldxh;-><init>(I)V

    new-instance v5, Ldxh;

    const v2, 0x7f04047c

    invoke-direct {v5, v2}, Ldxh;-><init>(I)V

    new-instance v6, Ldxh;

    const v2, 0x1010036

    invoke-direct {v6, v2}, Ldxh;-><init>(I)V

    new-instance v7, Ldxh;

    const v2, 0x7f04084a

    invoke-direct {v7, v2}, Ldxh;-><init>(I)V

    new-instance v8, Ldxh;

    invoke-direct {v8, v2}, Ldxh;-><init>(I)V

    new-instance v9, Ldxh;

    const v2, 0x7f0402c8

    invoke-direct {v9, v2}, Ldxh;-><init>(I)V

    new-instance v10, Lfxh;

    const v2, 0x7f06011a

    invoke-direct {v10, v2}, Lfxh;-><init>(I)V

    const/4 v11, 0x2

    sget-object v2, Llaj;->e:Llaj;

    invoke-direct/range {v0 .. v11}, Lvr8;-><init>(Lcxh;Llaj;Lfxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lfxh;I)V

    sput-object v0, Lvr8;->l:Lvr8;

    return-void
.end method

.method public constructor <init>(Lcxh;Llaj;Lfxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lcxh;Lfxh;I)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvr8;->a:Lcxh;

    iput-object p2, p0, Lvr8;->b:Llaj;

    iput-object p3, p0, Lvr8;->c:Lfxh;

    iput-object p4, p0, Lvr8;->d:Lcxh;

    iput-object p5, p0, Lvr8;->e:Lcxh;

    iput-object p6, p0, Lvr8;->f:Lcxh;

    iput-object p7, p0, Lvr8;->g:Lcxh;

    iput-object p8, p0, Lvr8;->h:Lcxh;

    iput-object p9, p0, Lvr8;->i:Lcxh;

    iput-object p10, p0, Lvr8;->j:Lfxh;

    iput-byte p11, p0, Lvr8;->k:B

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_74

    instance-of v0, p1, Lvr8;

    if-eqz v0, :cond_72

    check-cast p1, Lvr8;

    iget-object v0, p0, Lvr8;->a:Lcxh;

    iget-object v1, p1, Lvr8;->a:Lcxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->b:Llaj;

    iget-object v1, p1, Lvr8;->b:Llaj;

    invoke-virtual {v0, v1}, Llaj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->c:Lfxh;

    iget-object v1, p1, Lvr8;->c:Lfxh;

    invoke-virtual {v0, v1}, Lfxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->d:Lcxh;

    iget-object v1, p1, Lvr8;->d:Lcxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->e:Lcxh;

    iget-object v1, p1, Lvr8;->e:Lcxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->f:Lcxh;

    iget-object v1, p1, Lvr8;->f:Lcxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->g:Lcxh;

    iget-object v1, p1, Lvr8;->g:Lcxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->h:Lcxh;

    iget-object v1, p1, Lvr8;->h:Lcxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->i:Lcxh;

    iget-object v1, p1, Lvr8;->i:Lcxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lvr8;->j:Lfxh;

    iget-object v1, p1, Lvr8;->j:Lfxh;

    invoke-virtual {v0, v1}, Lfxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-byte p0, p0, Lvr8;->k:B

    iget-byte p1, p1, Lvr8;->k:B

    if-eq p0, p1, :cond_74

    :cond_72
    const/4 p0, 0x0

    return p0

    :cond_74
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lvr8;->a:Lcxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lvr8;->b:Llaj;

    invoke-virtual {v2}, Llaj;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lvr8;->c:Lfxh;

    iget v0, v0, Lfxh;->a:I

    invoke-static {v0, v2, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lvr8;->d:Lcxh;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lvr8;->e:Lcxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lvr8;->f:Lcxh;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lvr8;->g:Lcxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lvr8;->h:Lcxh;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lvr8;->i:Lcxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lvr8;->j:Lfxh;

    iget v2, v2, Lfxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-byte p0, p0, Lvr8;->k:B

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
