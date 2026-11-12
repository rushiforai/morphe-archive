.class public final synthetic Lanh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkol;


# direct methods
.method public synthetic constructor <init>(Lkol;B)V
    .registers 3

    iput-byte p2, p0, Lanh;->a:B

    iput-object p1, p0, Lanh;->b:Lkol;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lanh;->a:B

    iget-object p0, p0, Lanh;->b:Lkol;

    packed-switch p1, :pswitch_data_14

    invoke-virtual {p0}, Lkol;->h()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Lkol;->h()V

    return-void

    :pswitch_f
    invoke-virtual {p0}, Lkol;->h()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_f
        :pswitch_b
    .end packed-switch
.end method
