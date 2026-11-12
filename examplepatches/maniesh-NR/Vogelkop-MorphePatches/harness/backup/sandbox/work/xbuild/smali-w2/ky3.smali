.class public final Lky3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrm5;

.field public final b:I

.field public final c:Lq7j;

.field public final d:Liwk;

.field public final e:Lk1c;

.field public final f:Luup;

.field public final g:Lcgh;


# direct methods
.method public constructor <init>(Lrm5;ILq7j;Liwk;Lk1c;Luup;Lcgh;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lky3;->a:Lrm5;

    iput p2, p0, Lky3;->b:I

    iput-object p3, p0, Lky3;->c:Lq7j;

    iput-object p4, p0, Lky3;->d:Liwk;

    iput-object p5, p0, Lky3;->e:Lk1c;

    iput-object p6, p0, Lky3;->f:Luup;

    iput-object p7, p0, Lky3;->g:Lcgh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_48

    instance-of v0, p1, Lky3;

    if-eqz v0, :cond_46

    check-cast p1, Lky3;

    iget-object v0, p0, Lky3;->a:Lrm5;

    iget-object v1, p1, Lky3;->a:Lrm5;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget v0, p0, Lky3;->b:I

    iget v1, p1, Lky3;->b:I

    if-ne v0, v1, :cond_46

    iget-object v0, p0, Lky3;->c:Lq7j;

    iget-object v1, p1, Lky3;->c:Lq7j;

    if-ne v0, v1, :cond_46

    iget-object v0, p0, Lky3;->d:Liwk;

    iget-object v1, p1, Lky3;->d:Liwk;

    invoke-virtual {v0, v1}, Liwk;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lky3;->e:Lk1c;

    iget-object v1, p1, Lky3;->e:Lk1c;

    invoke-virtual {v0, v1}, Lk1c;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lky3;->f:Luup;

    iget-object v1, p1, Lky3;->f:Luup;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object p0, p0, Lky3;->g:Lcgh;

    iget-object p1, p1, Lky3;->g:Lcgh;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    :cond_46
    const/4 p0, 0x0

    return p0

    :cond_48
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lky3;->a:Lrm5;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget v2, p0, Lky3;->b:I

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lky3;->c:Lq7j;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lky3;->d:Liwk;

    iget-boolean v2, v2, Liwk;->a:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Lky3;->e:Lk1c;

    invoke-virtual {v2}, Lk1c;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lky3;->f:Luup;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lky3;->g:Lcgh;

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
