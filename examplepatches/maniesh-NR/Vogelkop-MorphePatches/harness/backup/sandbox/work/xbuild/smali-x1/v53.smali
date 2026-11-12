.class public final synthetic Lv53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly53;


# direct methods
.method public synthetic constructor <init>(Ly53;B)V
    .registers 3

    iput-byte p2, p0, Lv53;->a:B

    iput-object p1, p0, Lv53;->b:Ly53;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lv53;->a:B

    iget-object p0, p0, Lv53;->b:Ly53;

    packed-switch p1, :pswitch_data_26

    invoke-virtual {p0}, Ly53;->V()V

    return-void

    :pswitch_b
    iget-object p1, p0, Ly53;->c:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lrf2;

    iget-object p1, p1, Lrf2;->i:Ljava/lang/Object;

    check-cast p1, Landroidx/cardview/widget/CardView;

    iget-object p0, p0, Ly53;->g:Landroid/content/Context;

    const v0, 0x7f040670

    const v1, 0x7f06063b

    invoke-static {v0, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {p1, p0}, Landroidx/cardview/widget/CardView;->b(I)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
