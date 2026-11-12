.class public final Lwvg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final k:Lwvg;

.field public static final l:Lwvg;

.field public static final m:Lwvg;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:I

.field public final f:La0f;

.field public final g:Lck8;

.field public final h:Ljmk;

.field public final i:Lo9g;

.field public final j:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lwvg;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-string v1, "loading"

    const-wide/16 v2, -0x1

    const-wide/16 v4, -0x1

    const-wide/16 v6, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v0 .. v13}, Lwvg;-><init>(Ljava/lang/String;JJJILa0f;Lck8;Ljmk;Lo9g;Ljava/lang/String;)V

    sput-object v0, Lwvg;->k:Lwvg;

    new-instance v1, Lwvg;

    const/4 v14, 0x0

    const-string v2, "none"

    const-wide/16 v3, -0x1

    const-wide/16 v5, -0x1

    const-wide/16 v7, -0x1

    const/4 v9, 0x1

    invoke-direct/range {v1 .. v14}, Lwvg;-><init>(Ljava/lang/String;JJJILa0f;Lck8;Ljmk;Lo9g;Ljava/lang/String;)V

    sput-object v1, Lwvg;->l:Lwvg;

    new-instance v2, Lwvg;

    const/4 v15, 0x0

    const-string v3, "pending"

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, -0x1

    const/4 v10, 0x2

    invoke-direct/range {v2 .. v15}, Lwvg;-><init>(Ljava/lang/String;JJJILa0f;Lck8;Ljmk;Lo9g;Ljava/lang/String;)V

    sput-object v2, Lwvg;->m:Lwvg;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJJILa0f;Lck8;Ljmk;Lo9g;Ljava/lang/String;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwvg;->a:Ljava/lang/String;

    iput-wide p2, p0, Lwvg;->b:J

    iput-wide p4, p0, Lwvg;->c:J

    iput-wide p6, p0, Lwvg;->d:J

    iput p8, p0, Lwvg;->e:I

    iput-object p9, p0, Lwvg;->f:La0f;

    iput-object p10, p0, Lwvg;->g:Lck8;

    iput-object p11, p0, Lwvg;->h:Ljmk;

    iput-object p12, p0, Lwvg;->i:Lo9g;

    iput-object p13, p0, Lwvg;->j:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    const/4 v0, 0x3

    iget p0, p0, Lwvg;->e:I

    if-eq p0, v0, :cond_a

    const/4 v0, 0x4

    if-eq p0, v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    const/4 p0, 0x1

    return p0
.end method

.method public final b()Z
    .registers 2

    iget-object p0, p0, Lwvg;->h:Ljmk;

    if-eqz p0, :cond_10

    const-string v0, "ofa_free_trial"

    iget-object p0, p0, Ljmk;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 7

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 v0, 0x0

    if-eqz p1, :cond_68

    const-class v1, Lwvg;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_68

    check-cast p1, Lwvg;

    iget-wide v1, p0, Lwvg;->b:J

    iget-wide v3, p1, Lwvg;->b:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1a

    return v0

    :cond_1a
    iget-wide v1, p0, Lwvg;->c:J

    iget-wide v3, p1, Lwvg;->c:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_23

    return v0

    :cond_23
    iget-wide v1, p0, Lwvg;->d:J

    iget-wide v3, p1, Lwvg;->d:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2c

    return v0

    :cond_2c
    iget v1, p0, Lwvg;->e:I

    iget v2, p1, Lwvg;->e:I

    if-eq v1, v2, :cond_33

    return v0

    :cond_33
    iget-object v1, p0, Lwvg;->f:La0f;

    iget-object v2, p1, Lwvg;->f:La0f;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3e

    return v0

    :cond_3e
    iget-object v1, p0, Lwvg;->g:Lck8;

    iget-object v2, p1, Lwvg;->g:Lck8;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_49

    return v0

    :cond_49
    iget-object v1, p0, Lwvg;->h:Ljmk;

    iget-object v2, p1, Lwvg;->h:Ljmk;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_54

    return v0

    :cond_54
    iget-object v1, p0, Lwvg;->i:Lo9g;

    iget-object v2, p1, Lwvg;->i:Lo9g;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5f

    return v0

    :cond_5f
    iget-object p0, p0, Lwvg;->j:Ljava/lang/String;

    iget-object p1, p1, Lwvg;->j:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_68
    return v0
.end method

.method public final hashCode()I
    .registers 8

    iget-wide v0, p0, Lwvg;->b:J

    const/16 v2, 0x20

    ushr-long v3, v0, v2

    xor-long/2addr v0, v3

    long-to-int v0, v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v3, p0, Lwvg;->c:J

    ushr-long v5, v3, v2

    xor-long/2addr v3, v5

    long-to-int v1, v3

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v3, p0, Lwvg;->d:J

    ushr-long v1, v3, v2

    xor-long/2addr v3, v1

    long-to-int v1, v3

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lwvg;->e:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lwvg;->f:La0f;

    invoke-static {v1}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lwvg;->g:Lck8;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lwvg;->h:Ljmk;

    invoke-static {v1}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lwvg;->i:Lo9g;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lwvg;->j:Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
