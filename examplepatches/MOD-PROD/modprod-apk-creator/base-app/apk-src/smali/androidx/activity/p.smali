.class public final synthetic Landroidx/activity/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/activity/p;->a:I

    iput-object p2, p0, Landroidx/activity/p;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBackInvoked()V
    .locals 2

    iget v0, p0, Landroidx/activity/p;->a:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Landroidx/activity/p;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_0
    iget-object v0, p0, Landroidx/activity/p;->b:Ljava/lang/Object;

    check-cast v0, Le/B;

    invoke-virtual {v0}, Le/B;->C()Z

    return-void

    :pswitch_1
    iget-object v0, p0, Landroidx/activity/p;->b:Ljava/lang/Object;

    check-cast v0, La0/a;

    const-string v1, "$onBackInvoked"

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v0}, La0/a;->a()Ljava/lang/Object;

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
