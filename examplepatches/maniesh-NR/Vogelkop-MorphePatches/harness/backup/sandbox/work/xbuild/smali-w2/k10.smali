.class public final synthetic Lk10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls10;


# direct methods
.method public synthetic constructor <init>(Ls10;B)V
    .registers 3

    iput-byte p2, p0, Lk10;->a:B

    iput-object p1, p0, Lk10;->b:Ls10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lk10;->a:B

    iget-object p0, p0, Lk10;->b:Ls10;

    packed-switch v0, :pswitch_data_24

    check-cast p1, Lrmn;

    invoke-virtual {p0}, Ls10;->f0()V

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p0, p0, Ls10;->f:Lz4n;

    iget-object p0, p0, Lz4n;->a:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p0, p1, v0, p1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
