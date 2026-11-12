.class public abstract Lh83;
.super Li83;
.source "SourceFile"


# instance fields
.field public final z:Lnvg;


# direct methods
.method public constructor <init>(Lnvg;II)V
    .registers 6

    const v0, 0x7f140183

    const v1, 0x7f0d0345

    invoke-direct {p0, v0, p2, v1, p3}, Li83;-><init>(IIII)V

    iput-object p1, p0, Lh83;->z:Lnvg;

    return-void
.end method


# virtual methods
.method public final h0(Landroidx/fragment/app/w;)V
    .registers 2

    const/4 p1, 0x1

    iget-object p0, p0, Lh83;->z:Lnvg;

    invoke-virtual {p0, p1}, Lnvg;->a(I)V

    return-void
.end method
