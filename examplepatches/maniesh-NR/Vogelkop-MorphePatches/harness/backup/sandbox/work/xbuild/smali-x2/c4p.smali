.class public final Lc4p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:La4p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final u:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final a:La5p;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/List;

.field public final d:Ljava/util/List;

.field public final e:Ljava/util/List;

.field public final f:Lzyk;

.field public final g:Lzyk;

.field public final h:Lzyk;

.field public final i:Lzyk;

.field public final j:Lzyk;

.field public final k:Lzyk;

.field public final l:Lzyk;

.field public final m:Lzyk;

.field public final n:Lzyk;

.field public final o:Lzyk;

.field public final p:Lzyk;

.field public final q:Lzyk;

.field public final r:Lzyk;

.field public final s:Lzyk;

.field public final t:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, La4p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lc4p;->Companion:La4p;

    new-instance v0, Lk72;

    sget-object v1, Lg4p;->c:Lg4p;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v1, Lk72;

    sget-object v3, Lv4p;->a:Lv4p;

    invoke-direct {v1, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v3, Lk72;

    sget-object v4, Lxhk;->a:Lxhk;

    invoke-direct {v3, v4, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/4 v4, 0x5

    new-array v4, v4, [Lkotlinx/serialization/KSerializer;

    const/4 v5, 0x0

    aput-object v5, v4, v2

    const/4 v2, 0x1

    aput-object v5, v4, v2

    const/4 v2, 0x2

    aput-object v0, v4, v2

    const/4 v0, 0x3

    aput-object v1, v4, v0

    const/4 v0, 0x4

    aput-object v3, v4, v0

    sput-object v4, Lc4p;->u:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILa5p;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .registers 14

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v2, v0, :cond_f2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lc4p;->a:La5p;

    and-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_12

    iput-object v1, p0, Lc4p;->b:Ljava/lang/String;

    goto :goto_14

    :cond_12
    iput-object p3, p0, Lc4p;->b:Ljava/lang/String;

    :goto_14
    and-int/lit8 p3, p1, 0x4

    if-nez p3, :cond_1b

    iput-object v1, p0, Lc4p;->c:Ljava/util/List;

    goto :goto_1d

    :cond_1b
    iput-object p4, p0, Lc4p;->c:Ljava/util/List;

    :goto_1d
    and-int/lit8 p3, p1, 0x8

    if-nez p3, :cond_24

    iput-object v1, p0, Lc4p;->d:Ljava/util/List;

    goto :goto_26

    :cond_24
    iput-object p5, p0, Lc4p;->d:Ljava/util/List;

    :goto_26
    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_2d

    iput-object v1, p0, Lc4p;->e:Ljava/util/List;

    goto :goto_2f

    :cond_2d
    iput-object p6, p0, Lc4p;->e:Ljava/util/List;

    :goto_2f
    new-instance p1, Le7p;

    const/4 p3, 0x5

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->f:Lzyk;

    new-instance p1, Le7p;

    const/4 p3, 0x6

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->g:Lzyk;

    new-instance p1, Le7p;

    const/4 p3, 0x7

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->h:Lzyk;

    new-instance p1, Le7p;

    const/16 p3, 0x8

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->i:Lzyk;

    new-instance p1, Le7p;

    const/16 p3, 0x9

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->j:Lzyk;

    new-instance p1, Le7p;

    const/16 p3, 0xa

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->k:Lzyk;

    new-instance p1, Le7p;

    const/16 p3, 0xb

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->l:Lzyk;

    new-instance p1, Le7p;

    const/16 p3, 0xc

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->m:Lzyk;

    new-instance p1, Le7p;

    const/16 p3, 0xd

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->n:Lzyk;

    new-instance p1, Le7p;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->o:Lzyk;

    new-instance p1, Le7p;

    invoke-direct {p1, p0, v2}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->p:Lzyk;

    new-instance p1, Le7p;

    const/4 p3, 0x2

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->q:Lzyk;

    new-instance p1, Le7p;

    const/4 p3, 0x3

    invoke-direct {p1, p0, p3}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->r:Lzyk;

    new-instance v0, Lpw3;

    const/4 v5, 0x0

    const/16 v6, 0x13

    const-class v2, La5p;

    const-string v3, "landingUrl"

    const-string v4, "getLandingUrl()Ljava/lang/String;"

    move-object v1, p2

    invoke-direct/range {v0 .. v6}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->s:Lzyk;

    new-instance p1, Le7p;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Le7p;-><init>(Lc4p;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lc4p;->t:Lzyk;

    return-void

    :cond_f2
    sget-object p0, Lz3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public static a(Ljava/util/List;Lu4p;)Ljava/util/List;
    .registers 6

    if-eqz p0, :cond_4b

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_b
    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lx4p;

    iget-object v3, v2, Lx4p;->c:Ljava/lang/String;

    invoke-static {v3}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    iget v2, v2, Lx4p;->a:I

    iget-byte v3, p1, Lu4p;->a:B

    if-ne v2, v3, :cond_b

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    :cond_2a
    new-instance p0, Ljava/util/ArrayList;

    const/16 p1, 0xa

    invoke-static {v0, p1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p1

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    :goto_3a
    if-ge v1, p1, :cond_4a

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lx4p;

    iget-object v2, v2, Lx4p;->c:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_4a
    return-object p0

    :cond_4b
    sget-object p0, Ll08;->a:Ll08;

    return-object p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lc4p;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lc4p;

    iget-object v1, p0, Lc4p;->a:La5p;

    iget-object v3, p1, Lc4p;->a:La5p;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lc4p;->b:Ljava/lang/String;

    iget-object v3, p1, Lc4p;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lc4p;->c:Ljava/util/List;

    iget-object v3, p1, Lc4p;->c:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lc4p;->d:Ljava/util/List;

    iget-object v3, p1, Lc4p;->d:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object p0, p0, Lc4p;->e:Ljava/util/List;

    iget-object p1, p1, Lc4p;->e:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_43

    return v2

    :cond_43
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lc4p;->a:La5p;

    invoke-virtual {v0}, La5p;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Lc4p;->b:Ljava/lang/String;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lc4p;->c:Ljava/util/List;

    if-nez v2, :cond_1c

    move v2, v1

    goto :goto_20

    :cond_1c
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_20
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lc4p;->d:Ljava/util/List;

    if-nez v2, :cond_29

    move v2, v1

    goto :goto_2d

    :cond_29
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_2d
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lc4p;->e:Ljava/util/List;

    if-eqz p0, :cond_38

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_38
    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AdMarkup(link="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lc4p;->a:La5p;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", ver="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc4p;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", assets="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc4p;->c:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", impressionTrackers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc4p;->d:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", legacyImpressionTrackers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lc4p;->e:Ljava/util/List;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
