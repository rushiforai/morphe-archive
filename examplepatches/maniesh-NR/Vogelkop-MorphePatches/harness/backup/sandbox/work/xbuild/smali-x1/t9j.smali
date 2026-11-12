.class public final Lt9j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lg52;

.field public final c:Ljgn;

.field public final d:Lyc6;

.field public final e:Ltj;

.field public final f:Luyl;

.field public final g:Lrxe;

.field public final h:La8d;


# direct methods
.method public constructor <init>(ILg52;Ljgn;Lyc6;Ltj;Luyl;Lrxe;La8d;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lt9j;->a:I

    iput-object p2, p0, Lt9j;->b:Lg52;

    iput-object p3, p0, Lt9j;->c:Ljgn;

    iput-object p4, p0, Lt9j;->d:Lyc6;

    iput-object p5, p0, Lt9j;->e:Ltj;

    iput-object p6, p0, Lt9j;->f:Luyl;

    iput-object p7, p0, Lt9j;->g:Lrxe;

    iput-object p8, p0, Lt9j;->h:La8d;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_56

    instance-of v0, p1, Lt9j;

    if-eqz v0, :cond_54

    check-cast p1, Lt9j;

    iget v0, p0, Lt9j;->a:I

    iget v1, p1, Lt9j;->a:I

    if-ne v0, v1, :cond_54

    iget-object v0, p0, Lt9j;->b:Lg52;

    iget-object v1, p1, Lt9j;->b:Lg52;

    invoke-virtual {v0, v1}, Lg52;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lt9j;->c:Ljgn;

    iget-object v1, p1, Lt9j;->c:Ljgn;

    invoke-virtual {v0, v1}, Ljgn;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lt9j;->d:Lyc6;

    iget-object v1, p1, Lt9j;->d:Lyc6;

    invoke-virtual {v0, v1}, Lyc6;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lt9j;->e:Ltj;

    iget-object v1, p1, Lt9j;->e:Ltj;

    invoke-virtual {v0, v1}, Ltj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lt9j;->f:Luyl;

    iget-object v1, p1, Lt9j;->f:Luyl;

    invoke-virtual {v0, v1}, Luyl;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lt9j;->g:Lrxe;

    iget-object v1, p1, Lt9j;->g:Lrxe;

    invoke-virtual {v0, v1}, Lrxe;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object p0, p0, Lt9j;->h:La8d;

    iget-object p1, p1, Lt9j;->h:La8d;

    invoke-virtual {p0, p1}, La8d;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_56

    :cond_54
    const/4 p0, 0x0

    return p0

    :cond_56
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Lt9j;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lt9j;->b:Lg52;

    invoke-virtual {v1}, Lg52;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lt9j;->c:Ljgn;

    invoke-virtual {v0}, Ljgn;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lt9j;->d:Lyc6;

    invoke-virtual {v1}, Lyc6;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lt9j;->e:Ltj;

    invoke-virtual {v0}, Ltj;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lt9j;->f:Luyl;

    invoke-virtual {v1}, Luyl;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lt9j;->g:Lrxe;

    invoke-virtual {v0}, Lrxe;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lt9j;->h:La8d;

    iget-boolean p0, p0, La8d;->a:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
