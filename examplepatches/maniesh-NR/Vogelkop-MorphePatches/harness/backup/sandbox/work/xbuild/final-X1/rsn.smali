.class public final Lrsn;
.super Lzm9;
.source "SourceFile"


# static fields
.field public static final f:Lrsn;


# direct methods
.method static constructor <clinit>()V
    .registers 13

    new-instance v0, Lrsn;

    new-instance v2, Lrxh;

    const v1, 0x7f140110

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    new-instance v3, Ldxh;

    const v1, 0x7f0402ed

    invoke-direct {v3, v1}, Ldxh;-><init>(I)V

    new-instance v4, Lpsn;

    sget-object v6, Losn;->a:Losn;

    invoke-direct {v4, v6, v6, v6}, Lpsn;-><init>(Losn;Losn;Losn;)V

    new-instance v5, Lssn;

    move-object v7, v6

    move-object v8, v6

    move-object v9, v6

    move-object v10, v6

    move-object v11, v6

    move-object v12, v6

    invoke-direct/range {v5 .. v12}, Lssn;-><init>(Losn;Losn;Losn;Losn;Losn;Losn;Losn;)V

    const/4 v1, 0x1

    invoke-direct/range {v0 .. v5}, Lzm9;-><init>(ZLpxh;Ldxh;Lpsn;Lssn;)V

    sput-object v0, Lrsn;->f:Lrsn;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lrsn;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x3419afa4

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
