.class public final Lrfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/graphics/drawable/Drawable;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/drawable/Drawable;B)V
    .registers 3

    iput-byte p2, p0, Lrfl;->a:B

    iput-object p1, p0, Lrfl;->b:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lrfl;->a:B

    const/16 v1, 0x30

    iget-object p0, p0, Lrfl;->b:Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    const/16 v3, 0x10

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_5a

    check-cast p1, Lu95;

    iget-wide v5, p1, Lu95;->a:J

    check-cast p2, Lih5;

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p1

    and-int/lit8 p3, p1, 0x11

    if-eq p3, v3, :cond_1e

    move v2, v4

    :cond_1e
    and-int/2addr p1, v4

    check-cast p2, Lvt9;

    invoke-virtual {p2, p1, v2}, Lvt9;->N(IZ)Z

    move-result p1

    if-eqz p1, :cond_2d

    sget-object p1, Lydp;->l:Lydp;

    invoke-virtual {p1, p0, p2, v1}, Lydp;->f(Landroid/graphics/drawable/Drawable;Lih5;I)V

    goto :goto_30

    :cond_2d
    invoke-virtual {p2}, Lvt9;->Q()V

    :goto_30
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_33
    check-cast p1, Lu95;

    iget-wide v5, p1, Lu95;->a:J

    check-cast p2, Lih5;

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    move-result p1

    and-int/lit8 p3, p1, 0x11

    if-eq p3, v3, :cond_44

    move v2, v4

    :cond_44
    and-int/2addr p1, v4

    check-cast p2, Lvt9;

    invoke-virtual {p2, p1, v2}, Lvt9;->N(IZ)Z

    move-result p1

    if-eqz p1, :cond_53

    sget-object p1, Lydp;->l:Lydp;

    invoke-virtual {p1, p0, p2, v1}, Lydp;->f(Landroid/graphics/drawable/Drawable;Lih5;I)V

    goto :goto_56

    :cond_53
    invoke-virtual {p2}, Lvt9;->Q()V

    :goto_56
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_33
    .end packed-switch
.end method
