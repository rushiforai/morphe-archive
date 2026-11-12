.class public final synthetic Lj35;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ll35;


# direct methods
.method public synthetic constructor <init>(Ll35;B)V
    .registers 3

    iput-byte p2, p0, Lj35;->a:B

    iput-object p1, p0, Lj35;->b:Ll35;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lj35;->a:B

    iget-object p0, p0, Lj35;->b:Ll35;

    check-cast p1, Landroid/view/View;

    check-cast p2, Lef;

    packed-switch v0, :pswitch_data_30

    new-instance p2, Ldd;

    iget-object p0, p0, Ll35;->b:Lfd;

    invoke-direct {p2, p0}, Ldd;-><init>(Lfd;)V

    invoke-virtual {p2, p1}, Lo73;->o(Landroid/view/View;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18
    iget-object p1, p0, Ll35;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/BrowserActivity;

    new-instance p2, Lsk;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Lsk;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    const v0, 0x7f140577

    const v1, 0x7f140bbb

    invoke-static {p1, p0, v0, v1, p2}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
