.class public final Lr5l;
.super Lgph;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Li7f;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lr5l;->a:Li7f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lg3l;

    iget-object p0, p0, Lr5l;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lg3l;

    iget-object p0, p0, Lr5l;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lr5l;->j()V

    return-void
.end method

.method public final f(II)V
    .registers 3

    invoke-virtual {p0}, Lr5l;->j()V

    return-void
.end method

.method public final h(II)V
    .registers 3

    invoke-virtual {p0}, Lr5l;->j()V

    return-void
.end method

.method public final j()V
    .registers 3

    new-instance v0, Lg7f;

    iget-object p0, p0, Lr5l;->a:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_7
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_3f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lg3l;

    iget-byte v1, p0, Lg3l;->a:B

    packed-switch v1, :pswitch_data_40

    iget-object p0, p0, Lg3l;->b:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object v1, p0, Lr9l;->q:Lebl;

    iget-object v1, v1, Lebl;->p:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p0}, Lr9l;->f()Lz5l;

    move-result-object p0

    iget-object p0, p0, Lz5l;->v:Lx2l;

    iget-object p0, p0, Lx2l;->o:Lo2l;

    iget-object p0, p0, Lo2l;->b:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    if-eqz p0, :cond_32

    const/4 p0, 0x1

    goto :goto_33

    :cond_32
    const/4 p0, 0x0

    :goto_33
    invoke-virtual {v1, p0}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_7

    :pswitch_37
    iget-object p0, p0, Lg3l;->b:Ljava/lang/Object;

    check-cast p0, Lj1c;

    invoke-virtual {p0}, Lj1c;->a()V

    goto :goto_7

    :cond_3f
    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
