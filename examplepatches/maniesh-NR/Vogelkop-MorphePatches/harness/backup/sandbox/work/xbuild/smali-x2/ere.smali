.class public final Lere;
.super Loqe;
.source "SourceFile"


# instance fields
.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/List;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Lnb8;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lqre;Ljava/util/ArrayList;Lnb8;)V
    .registers 9

    invoke-direct {p0, p1, p5, p6}, Loqe;-><init>(Ljava/lang/String;Ljava/lang/String;Lqre;)V

    iput-object p2, p0, Lere;->e:Ljava/lang/String;

    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lere;->f:Ljava/util/List;

    if-nez p3, :cond_37

    invoke-virtual {p7}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/16 p3, 0x11

    const/4 p5, 0x0

    :goto_14
    if-ge p5, p2, :cond_2c

    invoke-virtual {p7, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p6

    add-int/lit8 p5, p5, 0x1

    check-cast p6, Lmsh;

    mul-int/lit8 p3, p3, 0x1f

    iget-object p6, p6, Lmsh;->v:Lp12;

    iget-object p6, p6, Lp12;->b:Ljava/lang/Object;

    check-cast p6, Ljava/lang/String;

    invoke-virtual {p6}, Ljava/lang/String;->hashCode()I

    move-result p6

    add-int/2addr p3, p6

    goto :goto_14

    :cond_2c
    mul-int/lit8 p3, p3, 0x1f

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    add-int/2addr p1, p3

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    :cond_37
    iput-object p3, p0, Lere;->g:Ljava/lang/String;

    iput-object p4, p0, Lere;->h:Ljava/lang/String;

    iput-object p8, p0, Lere;->i:Lnb8;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lere;

    if-ne v0, v1, :cond_15

    check-cast p1, Lere;

    iget-object p0, p0, Lere;->g:Ljava/lang/String;

    iget-object p1, p1, Lere;->g:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lere;->g:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
