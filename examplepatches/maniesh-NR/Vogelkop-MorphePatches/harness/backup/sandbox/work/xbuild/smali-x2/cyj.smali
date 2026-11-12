.class public final Lcyj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljsc;

.field public final b:Ly7h;

.field public final c:Ly7h;

.field public final d:Lrxj;

.field public final e:Lzxj;

.field public final f:Luxj;

.field public final g:Lqxj;

.field public final h:Lpxj;


# direct methods
.method public constructor <init>(Ljsc;Ly7h;Lhxh;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;I)V
    .registers 23

    move/from16 v0, p9

    and-int/lit8 v1, v0, 0x2

    const v2, 0x7f040940

    if-eqz v1, :cond_e

    new-instance p2, Lhxh;

    invoke-direct {p2, v2}, Lhxh;-><init>(I)V

    :cond_e
    move-object v5, p2

    and-int/lit8 p2, v0, 0x4

    if-eqz p2, :cond_1a

    new-instance p2, Lhxh;

    invoke-direct {p2, v2}, Lhxh;-><init>(I)V

    move-object v6, p2

    goto :goto_1c

    :cond_1a
    move-object/from16 v6, p3

    :goto_1c
    and-int/lit8 p2, v0, 0x10

    if-eqz p2, :cond_44

    new-instance p2, Lzxj;

    new-instance v7, Layj;

    new-instance v8, Lixh;

    const/high16 v1, 0x42800000    # 64.0f

    invoke-direct {v8, v1}, Lixh;-><init>(F)V

    new-instance v9, Lixh;

    const/high16 v1, 0x42400000    # 48.0f

    invoke-direct {v9, v1}, Lixh;-><init>(F)V

    new-instance v10, Lixh;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-direct {v10, v1}, Lixh;-><init>(F)V

    sget-object v11, Lumj;->a:Lumj;

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v12}, Layj;-><init>(Lixh;Lixh;Lixh;Lumj;Z)V

    invoke-direct {p2, v7}, Lzxj;-><init>(Ly7h;)V

    move-object v8, p2

    goto :goto_46

    :cond_44
    move-object/from16 v8, p5

    :goto_46
    and-int/lit8 p2, v0, 0x20

    const/4 v1, 0x0

    if-eqz p2, :cond_54

    new-instance p2, Luxj;

    const/16 v2, 0x7f

    invoke-direct {p2, v1, v2}, Luxj;-><init>(Lixh;I)V

    move-object v9, p2

    goto :goto_56

    :cond_54
    move-object/from16 v9, p6

    :goto_56
    and-int/lit8 p2, v0, 0x40

    if-eqz p2, :cond_63

    new-instance p2, Lqxj;

    const/16 v2, 0xff

    invoke-direct {p2, v1, v1, v1, v2}, Lqxj;-><init>(Llxh;Lgxh;Lcxh;I)V

    move-object v10, p2

    goto :goto_65

    :cond_63
    move-object/from16 v10, p7

    :goto_65
    and-int/lit16 p2, v0, 0x80

    if-eqz p2, :cond_77

    new-instance p2, Lpxj;

    const/4 v0, 0x0

    const/16 v2, 0x3f

    invoke-direct {p2, v0, v1, v1, v2}, Lpxj;-><init>(ILixh;Lkxh;I)V

    move-object v11, p2

    :goto_72
    move-object v3, p0

    move-object v4, p1

    move-object/from16 v7, p4

    goto :goto_7a

    :cond_77
    move-object/from16 v11, p8

    goto :goto_72

    :goto_7a
    invoke-direct/range {v3 .. v11}, Lcyj;-><init>(Ljsc;Ly7h;Ly7h;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;)V

    return-void
.end method

.method public constructor <init>(Ljsc;Ly7h;Ly7h;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;)V
    .registers 9

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lcyj;->a:Ljsc;

    .line 128
    iput-object p2, p0, Lcyj;->b:Ly7h;

    .line 129
    iput-object p3, p0, Lcyj;->c:Ly7h;

    .line 130
    iput-object p4, p0, Lcyj;->d:Lrxj;

    .line 131
    iput-object p5, p0, Lcyj;->e:Lzxj;

    .line 132
    iput-object p6, p0, Lcyj;->f:Luxj;

    .line 133
    iput-object p7, p0, Lcyj;->g:Lqxj;

    .line 134
    iput-object p8, p0, Lcyj;->h:Lpxj;

    return-void
.end method

.method public static a(Lcyj;Ljsc;Ly7h;Lixh;Lrxj;Lqxj;Lpxj;I)Lcyj;
    .registers 17

    move/from16 v0, p7

    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_8

    iget-object p1, p0, Lcyj;->a:Ljsc;

    :cond_8
    move-object v1, p1

    and-int/lit8 p1, v0, 0x4

    if-eqz p1, :cond_f

    iget-object p3, p0, Lcyj;->c:Ly7h;

    :cond_f
    move-object v3, p3

    iget-object v5, p0, Lcyj;->e:Lzxj;

    iget-object v6, p0, Lcyj;->f:Luxj;

    and-int/lit16 p1, v0, 0x80

    if-eqz p1, :cond_1c

    iget-object p1, p0, Lcyj;->h:Lpxj;

    move-object v8, p1

    goto :goto_1d

    :cond_1c
    move-object v8, p6

    :goto_1d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcyj;

    move-object v2, p2

    move-object v4, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v8}, Lcyj;-><init>(Ljsc;Ly7h;Ly7h;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;)V

    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lcyj;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lcyj;

    iget-object v1, p0, Lcyj;->a:Ljsc;

    iget-object v3, p1, Lcyj;->a:Ljsc;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lcyj;->b:Ly7h;

    iget-object v3, p1, Lcyj;->b:Ly7h;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lcyj;->c:Ly7h;

    iget-object v3, p1, Lcyj;->c:Ly7h;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lcyj;->d:Lrxj;

    iget-object v3, p1, Lcyj;->d:Lrxj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Lcyj;->e:Lzxj;

    iget-object v3, p1, Lcyj;->e:Lzxj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget-object v1, p0, Lcyj;->f:Luxj;

    iget-object v3, p1, Lcyj;->f:Luxj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4e

    return v2

    :cond_4e
    iget-object v1, p0, Lcyj;->g:Lqxj;

    iget-object v3, p1, Lcyj;->g:Lqxj;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_59

    return v2

    :cond_59
    iget-object p0, p0, Lcyj;->h:Lpxj;

    iget-object p1, p1, Lcyj;->h:Lpxj;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_64

    return v2

    :cond_64
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lcyj;->a:Ljsc;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcyj;->b:Ly7h;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcyj;->c:Ly7h;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcyj;->d:Lrxj;

    invoke-virtual {v1}, Lrxj;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcyj;->e:Lzxj;

    invoke-virtual {v0}, Lzxj;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcyj;->f:Luxj;

    invoke-virtual {v1}, Luxj;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lcyj;->g:Lqxj;

    invoke-virtual {v0}, Lqxj;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcyj;->h:Lpxj;

    invoke-virtual {p0}, Lpxj;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
