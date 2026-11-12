.class public final Lvho;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lw06;

.field public final b:Ljava/util/List;

.field public final c:J

.field public final d:J

.field public final e:Lpqo;

.field public f:Ljava/lang/Integer;

.field public final g:Lfio;

.field public h:I

.field public i:Z


# direct methods
.method public constructor <init>(Lw06;Ljava/util/List;JJLpqo;Lfio;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Lz1m;->b:I

    iput v0, p0, Lvho;->h:I

    iput-object p1, p0, Lvho;->a:Lw06;

    iput-object p2, p0, Lvho;->b:Ljava/util/List;

    iput-wide p3, p0, Lvho;->c:J

    iput-wide p5, p0, Lvho;->d:J

    iput-object p7, p0, Lvho;->e:Lpqo;

    iput-object p8, p0, Lvho;->g:Lfio;

    return-void
.end method


# virtual methods
.method public final a()Llho;
    .registers 2

    iget-object p0, p0, Lvho;->b:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llho;

    return-object p0
.end method

.method public final b()Ljava/lang/Integer;
    .registers 4

    iget-object v0, p0, Lvho;->f:Ljava/lang/Integer;

    if-nez v0, :cond_3b

    iget-object v0, p0, Lvho;->a:Lw06;

    sget-object v1, Lw06;->g:Ln06;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_38

    invoke-virtual {p0}, Lvho;->a()Llho;

    move-result-object v0

    iget-object v0, v0, Llho;->a:Lxho;

    iget-object v0, v0, Lxho;->d:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_38

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lvho;->a()Llho;

    move-result-object v1

    iget-object v1, v1, Llho;->a:Lxho;

    iget-object v1, v1, Lxho;->e:Ljava/lang/String;

    mul-int/lit8 v0, v0, 0x1f

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2f

    const/4 v1, 0x0

    goto :goto_33

    :cond_2f
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_33
    add-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :cond_38
    iput-object v2, p0, Lvho;->f:Ljava/lang/Integer;

    return-object v2

    :cond_3b
    return-object v0
.end method

.method public final c()Z
    .registers 2

    iget-object p0, p0, Lvho;->a:Lw06;

    sget-object v0, Lw06;->u:Lw06;

    if-ne p0, v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method
