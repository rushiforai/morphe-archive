.class public final Laq3;
.super Lmzg;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final synthetic c:Z

.field public final synthetic d:Lt0h;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lt0h;Ljava/lang/Object;ZB)V
    .registers 5

    iput-byte p4, p0, Laq3;->b:B

    iput-object p1, p0, Laq3;->d:Lt0h;

    iput-object p2, p0, Laq3;->e:Ljava/lang/Object;

    iput-boolean p3, p0, Laq3;->c:Z

    invoke-direct {p0}, Lmzg;-><init>()V

    return-void
.end method

.method private final s()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 4

    iget-byte v0, p0, Laq3;->b:B

    iget-boolean v1, p0, Laq3;->c:Z

    iget-object v2, p0, Laq3;->e:Ljava/lang/Object;

    iget-object p0, p0, Laq3;->d:Lt0h;

    packed-switch v0, :pswitch_data_32

    check-cast p0, Lnwf;

    iget-object p0, p0, Lnwf;->b:Lhv3;

    check-cast v2, Landroid/view/View;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v2, v1}, Lcom/opera/android/BrowserActivity;->w1(Landroid/view/View;Z)V

    return-void

    :pswitch_19
    check-cast p0, Lb9g;

    iget-object p0, p0, Lb9g;->a:Lhv3;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2, v1}, Lhv3;->p(Ljava/lang/String;Z)V

    return-void

    :pswitch_23
    check-cast p0, Lbq3;

    iget-object p0, p0, Lbq3;->a:Lhv3;

    check-cast v2, Landroid/view/View;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v2, v1}, Lcom/opera/android/BrowserActivity;->w1(Landroid/view/View;Z)V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_23
        :pswitch_19
    .end packed-switch
.end method

.method public final o()V
    .registers 5

    iget-byte v0, p0, Laq3;->b:B

    sget-object v1, Lph0;->i:Lph0;

    sget-object v2, Lph0;->g:Lph0;

    iget-boolean v3, p0, Laq3;->c:Z

    iget-object p0, p0, Laq3;->d:Lt0h;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lnwf;

    if-eqz v3, :cond_12

    move-object v1, v2

    :cond_12
    invoke-virtual {p0, v1}, Lnwf;->v(Lph0;)V

    :pswitch_15
    return-void

    :pswitch_16
    check-cast p0, Lbq3;

    if-eqz v3, :cond_1b

    move-object v1, v2

    :cond_1b
    invoke-virtual {p0, v1}, Lbq3;->u(Lph0;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
    .end packed-switch
.end method
