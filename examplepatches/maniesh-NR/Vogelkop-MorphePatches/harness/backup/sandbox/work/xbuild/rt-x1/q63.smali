.class public final synthetic Lq63;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls63;


# direct methods
.method public synthetic constructor <init>(Ls63;B)V
    .registers 3

    iput-byte p2, p0, Lq63;->a:B

    iput-object p1, p0, Lq63;->b:Ls63;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lq63;->a:B

    iget-object p0, p0, Lq63;->b:Ls63;

    packed-switch p1, :pswitch_data_24

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    if-eqz p1, :cond_14

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0}, Ls63;->p0(Landroidx/fragment/app/w;)V

    :cond_14
    return-void

    :pswitch_15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    if-eqz p1, :cond_22

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0}, Ls63;->p0(Landroidx/fragment/app/w;)V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
