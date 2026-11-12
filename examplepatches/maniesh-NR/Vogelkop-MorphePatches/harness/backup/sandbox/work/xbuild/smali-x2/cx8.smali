.class public final synthetic Lcx8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldx8;


# direct methods
.method public synthetic constructor <init>(Ldx8;B)V
    .registers 3

    iput-byte p2, p0, Lcx8;->a:B

    iput-object p1, p0, Lcx8;->b:Ldx8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lcx8;->a:B

    iget-object p0, p0, Lcx8;->b:Ldx8;

    packed-switch p1, :pswitch_data_10

    invoke-virtual {p0}, Ldx8;->f0()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Ldx8;->e0()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
