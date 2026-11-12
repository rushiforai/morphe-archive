.class public final synthetic Lbd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcd9;


# direct methods
.method public synthetic constructor <init>(Lcd9;B)V
    .registers 3

    iput-byte p2, p0, Lbd9;->a:B

    iput-object p1, p0, Lbd9;->b:Lcd9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lbd9;->a:B

    iget-object p0, p0, Lbd9;->b:Lcd9;

    packed-switch v0, :pswitch_data_2a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-static {v0}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v0

    new-instance v1, Lim6;

    sget-object v2, Ltc9;->c:Ltc9;

    filled-new-array {v2}, [Ltc9;

    move-result-object v2

    const/4 v3, 0x3

    invoke-direct {v1, p0, v2, p1, v3}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_24
    iget-object p0, p0, Lcd9;->p:Lrma;

    invoke-virtual {p0}, Lrma;->l()V

    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
