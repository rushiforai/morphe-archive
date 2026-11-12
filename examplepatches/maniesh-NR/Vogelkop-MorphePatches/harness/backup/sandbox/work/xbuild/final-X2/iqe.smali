.class public final Liqe;
.super La7f;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljqe;


# direct methods
.method public constructor <init>(Ljqe;B)V
    .registers 4

    iput-byte p2, p0, Liqe;->c:B

    const/4 v0, 0x0

    packed-switch p2, :pswitch_data_24

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p1, p0, Liqe;->d:Ljqe;

    invoke-direct {p0, p2}, La7f;-><init>(Ljava/lang/Object;)V

    return-void

    :pswitch_10
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p1, p0, Liqe;->d:Ljqe;

    invoke-direct {p0, p2}, La7f;-><init>(Ljava/lang/Object;)V

    return-void

    :pswitch_1a
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p1, p0, Liqe;->d:Ljqe;

    invoke-direct {p0, p2}, La7f;-><init>(Ljava/lang/Object;)V

    return-void

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_10
    .end packed-switch
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Liqe;->c:B

    iget-object p0, p0, Liqe;->d:Ljqe;

    packed-switch v0, :pswitch_data_32

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_15
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_23
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_23
        :pswitch_15
    .end packed-switch
.end method
