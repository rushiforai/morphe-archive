.class public final synthetic Lmt1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnt1;

.field public final synthetic c:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Lnt1;Landroid/app/Dialog;B)V
    .registers 4

    iput-byte p3, p0, Lmt1;->a:B

    iput-object p1, p0, Lmt1;->b:Lnt1;

    iput-object p2, p0, Lmt1;->c:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lmt1;->a:B

    iget-object v0, p0, Lmt1;->c:Landroid/app/Dialog;

    iget-object p0, p0, Lmt1;->b:Lnt1;

    packed-switch p1, :pswitch_data_1a

    sget-object p1, Lkt1;->b:Lkt1;

    iput-object p1, p0, Lc63;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    return-void

    :pswitch_11
    sget-object p1, Lkt1;->a:Lkt1;

    iput-object p1, p0, Lc63;->c:Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
