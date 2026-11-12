.class public final Lwhp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:I = 0x1


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I

.field public final e:Lvhp;


# direct methods
.method public constructor <init>(Ljava/lang/String;IILvhp;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Lwhp;->f:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lwhp;->f:I

    iput v0, p0, Lwhp;->a:I

    iput-object p1, p0, Lwhp;->b:Ljava/lang/String;

    iput p2, p0, Lwhp;->c:I

    iput p3, p0, Lwhp;->d:I

    iput-object p4, p0, Lwhp;->e:Lvhp;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_2b

    const-class v0, Lwhp;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_2b

    check-cast p1, Lwhp;

    iget v0, p0, Lwhp;->c:I

    iget v1, p1, Lwhp;->c:I

    if-ne v0, v1, :cond_2b

    iget v0, p0, Lwhp;->d:I

    iget v1, p1, Lwhp;->d:I

    if-ne v0, v1, :cond_2b

    iget-object v0, p0, Lwhp;->e:Lvhp;

    iget-object v1, p1, Lwhp;->e:Lvhp;

    if-ne v0, v1, :cond_2b

    iget-object p0, p0, Lwhp;->b:Ljava/lang/String;

    iget-object p1, p1, Lwhp;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_2b
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lwhp;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lwhp;->c:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lwhp;->d:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    add-int/lit16 v0, v0, 0x1000

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lwhp;->e:Lvhp;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
