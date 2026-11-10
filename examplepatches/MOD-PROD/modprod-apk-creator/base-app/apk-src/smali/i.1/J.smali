.class public final Li/J;
.super Li/w0;
.source "SourceFile"


# instance fields
.field public final synthetic j:Li/O;

.field public final synthetic k:Li/S;


# direct methods
.method public constructor <init>(Li/S;Li/S;Li/O;)V
    .locals 0

    iput-object p1, p0, Li/J;->k:Li/S;

    iput-object p3, p0, Li/J;->j:Li/O;

    invoke-direct {p0, p2}, Li/w0;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b()Lh/D;
    .locals 1

    iget-object v0, p0, Li/J;->j:Li/O;

    return-object v0
.end method

.method public final c()Z
    .locals 3

    iget-object v0, p0, Li/J;->k:Li/S;

    invoke-virtual {v0}, Li/S;->getInternalPopup()Li/Q;

    move-result-object v1

    invoke-interface {v1}, Li/Q;->a()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getTextDirection()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getTextAlignment()I

    move-result v2

    iget-object v0, v0, Li/S;->f:Li/Q;

    invoke-interface {v0, v1, v2}, Li/Q;->e(II)V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method
