.class public final Luah;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lh1b;

.field public final f:Z

.field public final g:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh1b;ZJ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luah;->a:Ljava/lang/String;

    iput-object p2, p0, Luah;->b:Ljava/lang/String;

    iput-object p3, p0, Luah;->c:Ljava/lang/String;

    iput-object p4, p0, Luah;->d:Ljava/lang/String;

    iput-object p5, p0, Luah;->e:Lh1b;

    iput-boolean p6, p0, Luah;->f:Z

    iput-wide p7, p0, Luah;->g:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 7

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 v0, 0x0

    if-eqz p1, :cond_56

    const-class v1, Luah;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_56

    check-cast p1, Luah;

    iget-object v1, p0, Luah;->a:Ljava/lang/String;

    iget-object v2, p1, Luah;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    return v0

    :cond_1c
    iget-object v1, p0, Luah;->b:Ljava/lang/String;

    iget-object v2, p1, Luah;->b:Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_27

    return v0

    :cond_27
    iget-object v1, p0, Luah;->c:Ljava/lang/String;

    iget-object v2, p1, Luah;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_32

    return v0

    :cond_32
    iget-object v1, p0, Luah;->d:Ljava/lang/String;

    iget-object v2, p1, Luah;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3d

    return v0

    :cond_3d
    iget-boolean v1, p0, Luah;->f:Z

    iget-boolean v2, p1, Luah;->f:Z

    if-eq v1, v2, :cond_44

    return v0

    :cond_44
    iget-wide v1, p0, Luah;->g:J

    iget-wide v3, p1, Luah;->g:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_4d

    return v0

    :cond_4d
    iget-object p0, p0, Luah;->e:Lh1b;

    iget-object p1, p1, Luah;->e:Lh1b;

    invoke-virtual {p0, p1}, Lh1b;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_56
    return v0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Luah;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
