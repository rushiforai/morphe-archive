.class public final Leq;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Leq;

.field public static final d:Leq;

.field public static final synthetic e:Leq;

.field public static final f:Ljava/util/List;

.field public static final synthetic g:Ljava/util/Set;


# instance fields
.field public final a:S

.field public final b:S


# direct methods
.method static constructor <clinit>()V
    .registers 11

    new-instance v0, Leq;

    const/16 v1, 0x140

    const/16 v2, 0x32

    invoke-direct {v0, v1, v2}, Leq;-><init>(II)V

    sput-object v0, Leq;->c:Leq;

    move v3, v1

    new-instance v1, Leq;

    const/16 v4, 0x12c

    const/16 v7, 0xfa

    invoke-direct {v1, v4, v7}, Leq;-><init>(II)V

    sput-object v1, Leq;->d:Leq;

    move v5, v2

    new-instance v2, Leq;

    invoke-direct {v2, v4, v5}, Leq;-><init>(II)V

    move v4, v3

    new-instance v3, Leq;

    const/16 v5, 0x64

    invoke-direct {v3, v4, v5}, Leq;-><init>(II)V

    move v5, v4

    new-instance v4, Leq;

    const/16 v6, 0x1e0

    invoke-direct {v4, v5, v6}, Leq;-><init>(II)V

    new-instance v5, Leq;

    const/16 v6, 0x1d4

    const/16 v8, 0x3c

    invoke-direct {v5, v6, v8}, Leq;-><init>(II)V

    new-instance v6, Leq;

    const/16 v8, 0x2d8

    const/16 v9, 0x5a

    invoke-direct {v6, v8, v9}, Leq;-><init>(II)V

    new-instance v8, Leq;

    const/16 v9, 0x2d0

    const/16 v10, 0x438

    invoke-direct {v8, v9, v10}, Leq;-><init>(II)V

    sput-object v8, Leq;->e:Leq;

    filled-new-array/range {v0 .. v6}, [Leq;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Leq;->f:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5d
    :goto_5d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_72

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Leq;

    iget-short v3, v3, Leq;->b:S

    if-lt v3, v7, :cond_5d

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5d

    :cond_72
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Leq;->g:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-short p1, p0, Leq;->a:S

    iput-short p2, p0, Leq;->b:S

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_16

    instance-of v0, p1, Leq;

    if-eqz v0, :cond_14

    check-cast p1, Leq;

    iget-short v0, p0, Leq;->a:S

    iget-short v1, p1, Leq;->a:S

    if-ne v0, v1, :cond_14

    iget-short p0, p0, Leq;->b:S

    iget-short p1, p1, Leq;->b:S

    if-eq p0, p1, :cond_16

    :cond_14
    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-short v0, p0, Leq;->a:S

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-short p0, p0, Leq;->b:S

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AdSize(width="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-short v1, p0, Leq;->a:S

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-short p0, p0, Leq;->b:S

    const/16 v1, 0x29

    invoke-static {v0, p0, v1}, Lfki;->s(Ljava/lang/StringBuilder;IC)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
