.class public final synthetic Lu53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly53;


# direct methods
.method public synthetic constructor <init>(Ly53;B)V
    .registers 3

    iput-byte p2, p0, Lu53;->a:B

    iput-object p1, p0, Lu53;->b:Ly53;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lu53;->a:B

    iget-object p0, p0, Lu53;->b:Ly53;

    packed-switch v0, :pswitch_data_2c

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Ly53;->c:Lor2;

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lrf2;

    iget-object p0, p0, Lrf2;->k:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaChip;

    if-eqz p1, :cond_1b

    const/4 p1, 0x0

    goto :goto_1d

    :cond_1b
    const/16 p1, 0x8

    :goto_1d
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_21
    check-cast p1, Ldpf;

    iget-object v0, p0, Ly53;->n:Livg;

    invoke-virtual {p1, v0}, Ldpf;->a(Lhpf;)V

    invoke-virtual {p1, p0}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
