.class public final Ltmc;
.super Lv0g;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Z

.field public final f:Z

.field public final g:Lumc;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLumc;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltmc;->a:Ljava/lang/String;

    iput-object p2, p0, Ltmc;->b:Ljava/lang/String;

    iput-object p3, p0, Ltmc;->c:Ljava/lang/String;

    iput-object p4, p0, Ltmc;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ltmc;->e:Z

    iput-boolean p6, p0, Ltmc;->f:Z

    iput-object p7, p0, Ltmc;->g:Lumc;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_44

    instance-of v0, p1, Ltmc;

    if-eqz v0, :cond_42

    check-cast p1, Ltmc;

    iget-object v0, p0, Ltmc;->a:Ljava/lang/String;

    iget-object v1, p1, Ltmc;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    iget-object v0, p0, Ltmc;->b:Ljava/lang/String;

    iget-object v1, p1, Ltmc;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    iget-object v0, p0, Ltmc;->c:Ljava/lang/String;

    iget-object v1, p1, Ltmc;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    iget-object v0, p0, Ltmc;->d:Ljava/lang/String;

    iget-object v1, p1, Ltmc;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    iget-boolean v0, p0, Ltmc;->e:Z

    iget-boolean v1, p1, Ltmc;->e:Z

    if-ne v0, v1, :cond_42

    iget-boolean v0, p0, Ltmc;->f:Z

    iget-boolean v1, p1, Ltmc;->f:Z

    if-ne v0, v1, :cond_42

    iget-object p0, p0, Ltmc;->g:Lumc;

    iget-object p1, p1, Ltmc;->g:Lumc;

    if-eq p0, p1, :cond_44

    :cond_42
    const/4 p0, 0x0

    return p0

    :cond_44
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Ltmc;->a:Ljava/lang/String;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_b
    const/16 v2, 0x1f

    mul-int/2addr v1, v2

    iget-object v3, p0, Ltmc;->b:Ljava/lang/String;

    if-nez v3, :cond_14

    move v3, v0

    goto :goto_18

    :cond_14
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_18
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object v3, p0, Ltmc;->c:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lz1m;->f(IILjava/lang/String;)I

    move-result v1

    iget-object v3, p0, Ltmc;->d:Ljava/lang/String;

    if-nez v3, :cond_26

    move v3, v0

    goto :goto_2a

    :cond_26
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2a
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-boolean v3, p0, Ltmc;->e:Z

    invoke-static {v1, v2, v3}, Lfki;->k(IIZ)I

    move-result v1

    iget-boolean v3, p0, Ltmc;->f:Z

    invoke-static {v1, v2, v3}, Lfki;->k(IIZ)I

    move-result v1

    iget-object p0, p0, Ltmc;->g:Lumc;

    if-eqz p0, :cond_40

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_40
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
