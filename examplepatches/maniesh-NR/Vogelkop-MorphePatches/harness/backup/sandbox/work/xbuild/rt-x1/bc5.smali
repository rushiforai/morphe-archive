.class public final Lbc5;
.super Luik;
.source "SourceFile"


# static fields
.field public static final f:Lbc6;


# instance fields
.field public b:Ljava/lang/String;

.field public c:[B

.field public d:[B

.field public e:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x28

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lbc5;->f:Lbc6;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    const/16 p1, 0x28

    invoke-direct {p0, p1}, Luik;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 6

    sget-object v0, Lbc5;->f:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget-object v0, p0, Lbc5;->b:Ljava/lang/String;

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Lbp;->E(ILjava/lang/String;Z)V

    iget-object v0, p0, Lbc5;->c:[B

    const/16 v1, 0x10

    const/4 v3, -0x1

    invoke-virtual {p1, v1, v2, v3, v0}, Lbp;->z(III[B)V

    iget-object v0, p0, Lbc5;->d:[B

    const/16 v1, 0x18

    invoke-virtual {p1, v1, v2, v3, v0}, Lbp;->z(III[B)V

    iget-object p0, p0, Lbc5;->e:[B

    const/16 v0, 0x20

    invoke-virtual {p1, v0, v2, v3, p0}, Lbp;->z(III[B)V

    return-void
.end method
