.class public final synthetic Lmvo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnxo;


# direct methods
.method public synthetic constructor <init>(Lnxo;B)V
    .registers 3

    iput-byte p2, p0, Lmvo;->a:B

    iput-object p1, p0, Lmvo;->b:Lnxo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lmvo;->a:B

    iget-object p0, p0, Lmvo;->b:Lnxo;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    packed-switch v0, :pswitch_data_1a

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnxo;->a(Landroid/content/Context;)V

    return-void

    :pswitch_12
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnxo;->a(Landroid/content/Context;)V

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
