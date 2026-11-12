.class public final synthetic Lbv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lev2;


# direct methods
.method public synthetic constructor <init>(Lev2;B)V
    .registers 3

    iput-byte p2, p0, Lbv2;->a:B

    iput-object p1, p0, Lbv2;->b:Lev2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lbv2;->a:B

    iget-object p0, p0, Lbv2;->b:Lev2;

    packed-switch p1, :pswitch_data_1e

    const/4 p1, -0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lev2;->z:Ljava/lang/Integer;

    invoke-virtual {p0}, Lzp1;->dismiss()V

    return-void

    :pswitch_12
    const/4 p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lev2;->z:Ljava/lang/Integer;

    invoke-virtual {p0}, Lzp1;->dismiss()V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
