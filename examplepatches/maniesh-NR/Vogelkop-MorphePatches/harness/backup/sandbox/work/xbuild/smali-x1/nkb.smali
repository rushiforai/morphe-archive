.class public final synthetic Lnkb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrkb;


# direct methods
.method public synthetic constructor <init>(Lrkb;B)V
    .registers 3

    iput-byte p2, p0, Lnkb;->a:B

    iput-object p1, p0, Lnkb;->b:Lrkb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lnkb;->a:B

    iget-object p0, p0, Lnkb;->b:Lrkb;

    packed-switch v0, :pswitch_data_18

    check-cast p1, Ly2c;

    iget-object p0, p0, Lrkb;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_12
    check-cast p1, Leyj;

    invoke-virtual {p0}, Lrkb;->e()V

    return-void

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
