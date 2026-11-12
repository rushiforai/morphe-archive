.class public final Lyla;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/net/URL;

.field public final b:Ljava/net/URL;

.field public final c:I

.field public final d:Z

.field public final e:Ll0c;


# direct methods
.method public constructor <init>(Ljava/net/URL;Ljava/net/URL;ILl0c;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyla;->a:Ljava/net/URL;

    iput-object p2, p0, Lyla;->b:Ljava/net/URL;

    iput p3, p0, Lyla;->c:I

    iput-object p4, p0, Lyla;->e:Ll0c;

    iput-boolean p5, p0, Lyla;->d:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lyla;

    if-eqz v0, :cond_2a

    check-cast p1, Lyla;

    iget-object v0, p0, Lyla;->a:Ljava/net/URL;

    iget-object v1, p1, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v0, v1}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lyla;->b:Ljava/net/URL;

    iget-object v1, p1, Lyla;->b:Ljava/net/URL;

    invoke-virtual {v0, v1}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget p0, p0, Lyla;->c:I

    invoke-static {p0}, Lo18;->e(I)B

    move-result p0

    iget p1, p1, Lyla;->c:I

    invoke-static {p1}, Lo18;->e(I)B

    move-result p1

    if-ne p0, p1, :cond_2a

    const/4 p0, 0x1

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lyla;->b:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget p0, p0, Lyla;->c:I

    invoke-static {p0}, Lo18;->e(I)B

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method
