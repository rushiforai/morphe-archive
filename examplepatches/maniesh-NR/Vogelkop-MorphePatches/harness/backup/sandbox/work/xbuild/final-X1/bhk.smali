.class public final Lbhk;
.super Luik;
.source "SourceFile"


# static fields
.field public static final c:Lbc6;


# instance fields
.field public b:[S


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x10

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lbhk;->c:Lbc6;

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 6

    sget-object v0, Lbhk;->c:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget-object p0, p0, Lbhk;->b:[S

    const/16 v0, 0x8

    if-nez p0, :cond_15

    const/4 p0, 0x0

    invoke-static {p0}, Lwyh;->E(I)Z

    move-result p0

    invoke-virtual {p1, v0, p0}, Lbp;->N(IZ)V

    return-void

    :cond_15
    const/4 v1, 0x2

    array-length v2, p0

    const/4 v3, -0x1

    invoke-virtual {p1, v1, v2, v0, v3}, Lbp;->P(IIII)Lbp;

    move-result-object p1

    iget-object p1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast p1, Lzg;

    iget-object p1, p1, Lzg;->c:Ljava/lang/Object;

    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    return-void
.end method
