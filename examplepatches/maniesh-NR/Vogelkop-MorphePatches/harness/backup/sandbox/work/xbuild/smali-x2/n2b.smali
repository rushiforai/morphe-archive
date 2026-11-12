.class public final synthetic Ln2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo2b;


# direct methods
.method public synthetic constructor <init>(Lo2b;B)V
    .registers 3

    iput-byte p2, p0, Ln2b;->a:B

    iput-object p1, p0, Ln2b;->b:Lo2b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 6

    iget-byte p1, p0, Ln2b;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object p0, p0, Ln2b;->b:Lo2b;

    packed-switch p1, :pswitch_data_4e

    iget-object p0, p0, Lo2b;->t:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq2b;

    iget-object p1, p0, Lq2b;->c:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ln3b;

    iget-boolean p1, p1, Ln3b;->a:Z

    iget-object p0, p0, Lq2b;->c:Lpde;

    new-instance v2, Ln3b;

    if-nez p1, :cond_24

    if-nez p2, :cond_24

    move v0, v1

    :cond_24
    invoke-direct {v2, p1, p2, v0}, Ln3b;-><init>(ZZZ)V

    invoke-virtual {p0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_2b
    iget-object p0, p0, Lo2b;->t:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq2b;

    iget-object p1, p0, Lq2b;->c:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ln3b;

    iget-boolean p1, p1, Ln3b;->b:Z

    iget-object p0, p0, Lq2b;->c:Lpde;

    new-instance v2, Ln3b;

    if-nez p2, :cond_46

    if-nez p1, :cond_46

    move v0, v1

    :cond_46
    invoke-direct {v2, p2, p1, v0}, Ln3b;-><init>(ZZZ)V

    invoke-virtual {p0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
