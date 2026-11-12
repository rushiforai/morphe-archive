.class public final Lmd;
.super Lfe;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lvr0;

.field public final c:Llxh;

.field public final d:Lrxh;


# direct methods
.method public constructor <init>(ZLvr0;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lmd;->a:Z

    iput-object p2, p0, Lmd;->b:Lvr0;

    new-instance p1, Llxh;

    const p2, 0x7f080522

    invoke-direct {p1, p2}, Llxh;-><init>(I)V

    iput-object p1, p0, Lmd;->c:Llxh;

    new-instance p1, Lrxh;

    const p2, 0x7f14044b

    invoke-direct {p1, p2}, Lrxh;-><init>(I)V

    iput-object p1, p0, Lmd;->d:Lrxh;

    return-void
.end method


# virtual methods
.method public final a()Lb8h;
    .registers 1

    iget-object p0, p0, Lmd;->c:Llxh;

    return-object p0
.end method

.method public final b()Lpxh;
    .registers 1

    iget-object p0, p0, Lmd;->d:Lrxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lmd;

    const/4 v2, 0x0

    if-eqz v1, :cond_11

    check-cast p1, Lmd;

    iget-boolean v1, p0, Lmd;->a:Z

    iget-boolean v3, p1, Lmd;->a:Z

    if-eq v1, v3, :cond_12

    :cond_11
    return v2

    :cond_12
    iget-object p0, p0, Lmd;->b:Lvr0;

    iget-object p1, p1, Lmd;->b:Lvr0;

    if-eq p0, p1, :cond_19

    return v2

    :cond_19
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean v0, p0, Lmd;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lmd;->b:Lvr0;

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
