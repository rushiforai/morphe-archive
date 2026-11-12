.class public final Look;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:B

.field public final e:B

.field public final f:I

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;


# direct methods
.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 16

    .line 22
    const-string v1, ""

    move-object v4, p4

    move v6, p1

    move-object v9, p4

    move-object v0, p0

    move v5, p1

    move v7, p2

    move-object v2, p3

    move-object v3, p4

    move-object v8, p5

    invoke-direct/range {v0 .. v9}, Look;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Look;->h:Ljava/lang/String;

    iput-object p2, p0, Look;->a:Ljava/lang/String;

    iput-object p3, p0, Look;->b:Ljava/lang/String;

    iput-object p4, p0, Look;->c:Ljava/lang/String;

    iput-byte p5, p0, Look;->d:B

    iput-byte p6, p0, Look;->e:B

    iput p7, p0, Look;->f:I

    iput-object p8, p0, Look;->g:Ljava/lang/String;

    iput-object p9, p0, Look;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 3

    iget-byte v0, p0, Look;->e:B

    const/16 v1, 0x9

    if-eq v0, v1, :cond_c

    iget-byte p0, p0, Look;->d:B

    const/16 v0, 0xa

    if-ne p0, v0, :cond_e

    :cond_c
    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    instance-of v0, p1, Look;

    if-eqz v0, :cond_1a

    check-cast p1, Look;

    iget-byte v0, p0, Look;->d:B

    iget-byte v1, p1, Look;->d:B

    if-ne v0, v1, :cond_1a

    iget-object v0, p0, Look;->a:Ljava/lang/String;

    iget-object v1, p1, Look;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    :cond_1a
    const/4 p0, 0x0

    return p0

    :cond_1c
    iget-object p0, p0, Look;->b:Ljava/lang/String;

    iget-object p1, p1, Look;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Look;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Look;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-byte p0, p0, Look;->d:B

    add-int/2addr v0, p0

    return v0
.end method
