.class public final Lyp3;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Lbq3;

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lbq3;Landroid/view/View;B)V
    .registers 4

    iput-byte p3, p0, Lyp3;->b:B

    iput-object p1, p0, Lyp3;->c:Lbq3;

    iput-object p2, p0, Lyp3;->d:Landroid/view/View;

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 4

    iget-byte v0, p0, Lyp3;->b:B

    iget-object v1, p0, Lyp3;->c:Lbq3;

    packed-switch v0, :pswitch_data_2c

    iget-object v0, v1, Lbq3;->a:Lhv3;

    iget-object v0, v0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lyp3;->d:Landroid/view/View;

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v1, v2}, Lcom/opera/android/BrowserActivity;->s1(Landroid/view/View;IZ)V

    return-void

    :pswitch_15
    iget-object p0, v1, Lbq3;->a:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->g1(Lp6l;)V

    return-void

    :pswitch_1e
    iget-object p0, v1, Lbq3;->a:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->m0()Z

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->v1()V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_15
    .end packed-switch
.end method

.method public final o()V
    .registers 2

    iget-byte v0, p0, Lyp3;->b:B

    iget-object p0, p0, Lyp3;->c:Lbq3;

    packed-switch v0, :pswitch_data_1a

    sget-object v0, Lph0;->n:Lph0;

    invoke-virtual {p0, v0}, Lbq3;->u(Lph0;)V

    return-void

    :pswitch_d
    sget-object v0, Lph0;->m:Lph0;

    invoke-virtual {p0, v0}, Lbq3;->u(Lph0;)V

    return-void

    :pswitch_13
    sget-object v0, Lph0;->b:Lph0;

    invoke-virtual {p0, v0}, Lbq3;->u(Lph0;)V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
