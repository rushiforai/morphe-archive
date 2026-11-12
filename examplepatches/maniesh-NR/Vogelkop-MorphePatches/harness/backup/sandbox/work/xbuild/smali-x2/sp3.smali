.class public final synthetic Lsp3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld5o;


# direct methods
.method public synthetic constructor <init>(Ld5o;B)V
    .registers 3

    iput-byte p2, p0, Lsp3;->a:B

    iput-object p1, p0, Lsp3;->b:Ld5o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    iget-byte p1, p0, Lsp3;->a:B

    iget-object p0, p0, Lsp3;->b:Ld5o;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0}, Ld5o;->N()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Ld5o;->N()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
