.class public final synthetic Lmg7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqg7;


# direct methods
.method public synthetic constructor <init>(Lqg7;B)V
    .registers 3

    iput-byte p2, p0, Lmg7;->a:B

    iput-object p1, p0, Lmg7;->b:Lqg7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lmg7;->a:B

    iget-object p0, p0, Lmg7;->b:Lqg7;

    packed-switch p1, :pswitch_data_16

    const/4 p1, 0x1

    iput p1, p0, Lqg7;->w:I

    iget-object p1, p0, Lqg7;->p:Lre7;

    if-eqz p1, :cond_11

    invoke-virtual {p0, p1}, Lqg7;->m0(Lre7;)V

    :cond_11
    return-void

    :pswitch_12
    invoke-virtual {p0}, Lqg7;->j0()V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
