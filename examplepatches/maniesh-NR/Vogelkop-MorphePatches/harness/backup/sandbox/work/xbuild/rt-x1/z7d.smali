.class public final Lz7d;
.super Luik;
.source "SourceFile"


# static fields
.field public static final k:Lbc6;


# instance fields
.field public b:Lbc5;

.field public c:I

.field public d:[B

.field public e:[I

.field public f:[B

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x50

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lz7d;->k:Lbc6;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    const/16 p1, 0x50

    invoke-direct {p0, p1}, Luik;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 9

    sget-object v0, Lz7d;->k:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget-object v0, p0, Lz7d;->b:Lbc5;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lbp;->J(Luik;IZ)V

    iget v0, p0, Lz7d;->c:I

    const/16 v1, 0x10

    invoke-virtual {p1, v0, v1}, Lbp;->y(II)V

    const/16 v0, 0x14

    invoke-virtual {p1, v0, v2, v2}, Lbp;->A(IIZ)V

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lbp;->A(IIZ)V

    const/4 v3, 0x2

    invoke-virtual {p1, v0, v3, v2}, Lbp;->A(IIZ)V

    const/4 v4, 0x3

    invoke-virtual {p1, v0, v4, v2}, Lbp;->A(IIZ)V

    const/4 v5, 0x4

    invoke-virtual {p1, v0, v5, v2}, Lbp;->A(IIZ)V

    const/4 v5, 0x5

    invoke-virtual {p1, v0, v5, v2}, Lbp;->A(IIZ)V

    iget-boolean v5, p0, Lz7d;->h:Z

    const/4 v6, 0x6

    invoke-virtual {p1, v0, v6, v5}, Lbp;->A(IIZ)V

    iget-boolean v5, p0, Lz7d;->i:Z

    const/4 v6, 0x7

    invoke-virtual {p1, v0, v6, v5}, Lbp;->A(IIZ)V

    iget-boolean v0, p0, Lz7d;->j:Z

    const/16 v5, 0x15

    invoke-virtual {p1, v5, v2, v0}, Lbp;->A(IIZ)V

    invoke-virtual {p1, v5, v1, v2}, Lbp;->A(IIZ)V

    invoke-virtual {p1, v5, v3, v2}, Lbp;->A(IIZ)V

    invoke-virtual {p1, v5, v4, v2}, Lbp;->A(IIZ)V

    iget-object v0, p0, Lz7d;->d:[B

    const/16 v3, 0x18

    const/4 v4, -0x1

    invoke-virtual {p1, v3, v2, v4, v0}, Lbp;->z(III[B)V

    iget-object v0, p0, Lz7d;->e:[I

    const/16 v3, 0x20

    invoke-virtual {p1, v3, v2, v0}, Lbp;->C(II[I)V

    const/16 v0, 0x28

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0, v1}, Lbp;->J(Luik;IZ)V

    iget-object v0, p0, Lz7d;->f:[B

    const/16 v3, 0x30

    invoke-virtual {p1, v3, v1, v4, v0}, Lbp;->z(III[B)V

    iget p0, p0, Lz7d;->g:I

    const/16 v0, 0x38

    invoke-virtual {p1, p0, v0}, Lbp;->y(II)V

    const/16 p0, 0x40

    invoke-virtual {p1, v2, p0, v1}, Lbp;->J(Luik;IZ)V

    const/16 p0, 0x48

    invoke-virtual {p1, v2, p0, v1}, Lbp;->J(Luik;IZ)V

    return-void
.end method
