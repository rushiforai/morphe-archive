.class public final Lxj2;
.super Luik;
.source "SourceFile"


# static fields
.field public static final e:Lbc6;


# instance fields
.field public b:Z

.field public c:Z

.field public d:[Lszm;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x40

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lxj2;->e:Lbc6;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    const/16 p1, 0x40

    invoke-direct {p0, p1}, Luik;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 10

    sget-object v0, Lxj2;->e:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget-boolean v0, p0, Lxj2;->b:Z

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Lbp;->A(IIZ)V

    const/4 v0, 0x1

    invoke-virtual {p1, v1, v0, v2}, Lbp;->A(IIZ)V

    iget-boolean v3, p0, Lxj2;->c:Z

    const/4 v4, 0x2

    invoke-virtual {p1, v1, v4, v3}, Lbp;->A(IIZ)V

    const/4 v3, 0x3

    invoke-virtual {p1, v1, v3, v2}, Lbp;->A(IIZ)V

    const/4 v3, 0x4

    invoke-virtual {p1, v1, v3, v2}, Lbp;->A(IIZ)V

    const/4 v3, 0x5

    invoke-virtual {p1, v1, v3, v2}, Lbp;->A(IIZ)V

    const/4 v3, 0x6

    invoke-virtual {p1, v1, v3, v2}, Lbp;->A(IIZ)V

    const/4 v3, 0x7

    invoke-virtual {p1, v1, v3, v2}, Lbp;->A(IIZ)V

    const/16 v3, 0x9

    invoke-virtual {p1, v3, v2, v2}, Lbp;->A(IIZ)V

    invoke-virtual {p1, v3, v0, v2}, Lbp;->A(IIZ)V

    invoke-virtual {p1, v3, v4, v2}, Lbp;->A(IIZ)V

    iget-object v3, p0, Lxj2;->d:[Lszm;

    const/16 v4, 0x10

    const/4 v5, -0x1

    if-nez v3, :cond_42

    invoke-virtual {p1, v4, v0}, Lbp;->N(IZ)V

    goto :goto_58

    :cond_42
    array-length v3, v3

    invoke-virtual {p1, v1, v3, v4, v5}, Lbp;->O(IIII)Lbp;

    move-result-object v3

    move v4, v2

    :goto_48
    iget-object v6, p0, Lxj2;->d:[Lszm;

    array-length v7, v6

    if-ge v4, v7, :cond_58

    aget-object v6, v6, v4

    shl-int/lit8 v7, v4, 0x3

    add-int/2addr v7, v1

    invoke-virtual {v3, v6, v7, v2}, Lbp;->J(Luik;IZ)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_48

    :cond_58
    :goto_58
    const/16 p0, 0x18

    const/4 v1, 0x0

    invoke-virtual {p1, v1, p0, v0}, Lbp;->J(Luik;IZ)V

    const/16 p0, 0x20

    invoke-virtual {p1, p0, v0, v5, v1}, Lbp;->z(III[B)V

    const/16 p0, 0x28

    invoke-virtual {p1, p0, v0, v5, v1}, Lbp;->z(III[B)V

    const/16 p0, 0x30

    invoke-virtual {p1, v1, p0, v0}, Lbp;->J(Luik;IZ)V

    const/16 p0, 0x38

    invoke-virtual {p1, v1, p0, v0}, Lbp;->J(Luik;IZ)V

    return-void
.end method
