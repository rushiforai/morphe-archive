.class public final synthetic Le5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh5l;


# direct methods
.method public synthetic constructor <init>(Lh5l;B)V
    .registers 3

    iput-byte p2, p0, Le5l;->a:B

    iput-object p1, p0, Le5l;->b:Lh5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Le5l;->a:B

    iget-object p0, p0, Le5l;->b:Lh5l;

    packed-switch v0, :pswitch_data_2a

    check-cast p1, Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object p0, p0, Ld5l;->j:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Lh5l;->k:Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object p0, p0, Ld5l;->i:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_21
    check-cast p1, Lpg;

    invoke-virtual {p0}, Lh5l;->e0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_21
        :pswitch_13
    .end packed-switch
.end method
