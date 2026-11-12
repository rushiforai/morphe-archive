.class public Lvcb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lvcb;->a:B

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lvcb;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzt3;Landroid/content/Intent;)V
    .registers 3

    const/4 p2, 0x0

    iput-byte p2, p0, Lvcb;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvcb;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public execute()V
    .registers 5

    iget-byte v0, p0, Lvcb;->a:B

    iget-object p0, p0, Lvcb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2e

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void

    :pswitch_b
    check-cast p0, Lzt3;

    iget-object p0, p0, Lzt3;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->o1(I)V

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->q:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljbn;

    sget-object v1, Libn;->a:Libn;

    new-instance v2, Lst3;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lst3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v0, v1, v2}, Ljbn;->f(Libn;Lkotlin/jvm/functions/Function1;)V

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
