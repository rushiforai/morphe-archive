.class public final synthetic Lv9k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly9k;


# direct methods
.method public synthetic constructor <init>(Ly9k;B)V
    .registers 3

    iput-byte p2, p0, Lv9k;->a:B

    iput-object p1, p0, Lv9k;->b:Ly9k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lv9k;->a:B

    iget-object p0, p0, Lv9k;->b:Ly9k;

    packed-switch p1, :pswitch_data_12

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ly9k;->k0(Z)V

    return-void

    :pswitch_c
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ly9k;->k0(Z)V

    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
