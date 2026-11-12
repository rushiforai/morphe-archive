.class public final synthetic Lm99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ln99;


# direct methods
.method public synthetic constructor <init>(Ln99;B)V
    .registers 3

    iput-byte p2, p0, Lm99;->a:B

    iput-object p1, p0, Lm99;->b:Ln99;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lm99;->a:B

    iget-object p0, p0, Lm99;->b:Ln99;

    packed-switch p1, :pswitch_data_16

    invoke-virtual {p0}, Lryl;->g0()V

    iget-object p0, p0, Ln99;->l:Lbn7;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lbn7;->run()V

    :cond_11
    return-void

    :pswitch_12
    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
