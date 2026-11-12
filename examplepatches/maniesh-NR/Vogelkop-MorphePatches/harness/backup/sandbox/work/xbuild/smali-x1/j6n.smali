.class public final synthetic Lj6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:La7n;


# direct methods
.method public synthetic constructor <init>(La7n;B)V
    .registers 3

    iput-byte p2, p0, Lj6n;->a:B

    iput-object p1, p0, Lj6n;->b:La7n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lj6n;->a:B

    iget-object p0, p0, Lj6n;->b:La7n;

    packed-switch v0, :pswitch_data_30

    check-cast p1, Lf6k;

    if-eqz p1, :cond_26

    iget-object p1, p1, Lf6k;->a:Lzch;

    instance-of v0, p1, Lg6k;

    if-eqz v0, :cond_1b

    iget-object p0, p0, La7n;->d:Landroid/view/ViewGroup;

    check-cast p1, Lg6k;

    iget p1, p1, Lg6k;->a:I

    invoke-static {p1, p0}, Lp37;->l0(ILandroid/view/View;)V

    goto :goto_26

    :cond_1b
    sget-object p0, Lh6k;->a:Lh6k;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    invoke-static {}, Lh9o;->p()V

    :cond_26
    :goto_26
    return-void

    :pswitch_27
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, La7n;->b0()V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
