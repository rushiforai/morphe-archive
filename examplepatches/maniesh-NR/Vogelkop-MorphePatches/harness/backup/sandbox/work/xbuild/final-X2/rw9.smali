.class public final Lrw9;
.super Luik;
.source "SourceFile"


# static fields
.field public static final g:Lbc6;


# instance fields
.field public b:Lbc5;

.field public c:I

.field public d:[B

.field public e:[B

.field public f:Lxj2;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x30

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lrw9;->g:Lbc6;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    const/16 p1, 0x30

    invoke-direct {p0, p1}, Luik;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 7

    sget-object v0, Lrw9;->g:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget-object v0, p0, Lrw9;->b:Lbc5;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lbp;->J(Luik;IZ)V

    iget v0, p0, Lrw9;->c:I

    const/16 v1, 0x10

    invoke-virtual {p1, v0, v1}, Lbp;->y(II)V

    iget-object v0, p0, Lrw9;->d:[B

    const/16 v1, 0x18

    const/4 v3, -0x1

    invoke-virtual {p1, v1, v2, v3, v0}, Lbp;->z(III[B)V

    iget-object v0, p0, Lrw9;->e:[B

    const/16 v1, 0x20

    const/4 v4, 0x1

    invoke-virtual {p1, v1, v4, v3, v0}, Lbp;->z(III[B)V

    iget-object p0, p0, Lrw9;->f:Lxj2;

    const/16 v0, 0x28

    invoke-virtual {p1, p0, v0, v2}, Lbp;->J(Luik;IZ)V

    return-void
.end method
