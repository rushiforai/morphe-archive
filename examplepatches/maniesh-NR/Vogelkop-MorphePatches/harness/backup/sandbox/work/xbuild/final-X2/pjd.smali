.class public Lpjd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final h:Ljava/lang/String;

.field public static final i:Ljava/lang/String;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;

.field public static final m:Ljava/lang/String;

.field public static final n:Ljava/lang/String;


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:I

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Ltym;->a:Ljava/lang/String;

    const-string v0, "0"

    sput-object v0, Lpjd;->h:Ljava/lang/String;

    const-string v0, "1"

    sput-object v0, Lpjd;->i:Ljava/lang/String;

    const-string v0, "2"

    sput-object v0, Lpjd;->j:Ljava/lang/String;

    const-string v0, "3"

    sput-object v0, Lpjd;->k:Ljava/lang/String;

    const-string v0, "4"

    sput-object v0, Lpjd;->l:Ljava/lang/String;

    const-string v0, "5"

    sput-object v0, Lpjd;->m:Ljava/lang/String;

    const-string v0, "6"

    sput-object v0, Lpjd;->n:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lmw7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lmw7;->c:Ljava/lang/Object;

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lpjd;->a:Landroid/net/Uri;

    iget-object v0, p1, Lmw7;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lpjd;->b:Ljava/lang/String;

    iget-object v0, p1, Lmw7;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lpjd;->c:Ljava/lang/String;

    iget v0, p1, Lmw7;->a:I

    iput v0, p0, Lpjd;->d:I

    iget v0, p1, Lmw7;->b:I

    iput v0, p0, Lpjd;->e:I

    iget-object v0, p1, Lmw7;->f:Ljava/io/Serializable;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lpjd;->f:Ljava/lang/String;

    iget-object p1, p1, Lmw7;->g:Ljava/io/Serializable;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lpjd;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lpjd;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lpjd;

    iget-object v1, p0, Lpjd;->a:Landroid/net/Uri;

    iget-object v3, p1, Lpjd;->a:Landroid/net/Uri;

    invoke-virtual {v1, v3}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    iget-object v1, p0, Lpjd;->b:Ljava/lang/String;

    iget-object v3, p1, Lpjd;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    iget-object v1, p0, Lpjd;->c:Ljava/lang/String;

    iget-object v3, p1, Lpjd;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    iget v1, p0, Lpjd;->d:I

    iget v3, p1, Lpjd;->d:I

    if-ne v1, v3, :cond_4b

    iget v1, p0, Lpjd;->e:I

    iget v3, p1, Lpjd;->e:I

    if-ne v1, v3, :cond_4b

    iget-object v1, p0, Lpjd;->f:Ljava/lang/String;

    iget-object v3, p1, Lpjd;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4b

    iget-object p0, p0, Lpjd;->g:Ljava/lang/String;

    iget-object p1, p1, Lpjd;->g:Ljava/lang/String;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4b

    return v0

    :cond_4b
    return v2
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lpjd;->a:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const/4 v1, 0x0

    iget-object v2, p0, Lpjd;->b:Ljava/lang/String;

    if-nez v2, :cond_f

    move v2, v1

    goto :goto_13

    :cond_f
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_13
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lpjd;->c:Ljava/lang/String;

    if-nez v2, :cond_1c

    move v2, v1

    goto :goto_20

    :cond_1c
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_20
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lpjd;->d:I

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lpjd;->e:I

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lpjd;->f:Ljava/lang/String;

    if-nez v2, :cond_33

    move v2, v1

    goto :goto_37

    :cond_33
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_37
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lpjd;->g:Ljava/lang/String;

    if-eqz p0, :cond_42

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_42
    add-int/2addr v0, v1

    return v0
.end method
