.class public final synthetic Loii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr9i;


# direct methods
.method public synthetic constructor <init>(Lr9i;B)V
    .registers 3

    iput-byte p2, p0, Loii;->a:B

    iput-object p1, p0, Loii;->b:Lr9i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Loii;->a:B

    iget-object p0, p0, Loii;->b:Lr9i;

    packed-switch p1, :pswitch_data_18

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lkii;

    invoke-virtual {p0}, Lkii;->run()V

    return-void

    :pswitch_f
    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Lkii;

    invoke-virtual {p0}, Lkii;->run()V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
