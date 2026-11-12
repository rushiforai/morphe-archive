.class public final synthetic Lwfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcgn;


# direct methods
.method public synthetic constructor <init>(Lcgn;B)V
    .registers 3

    iput-byte p2, p0, Lwfn;->a:B

    iput-object p1, p0, Lwfn;->b:Lcgn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lwfn;->a:B

    iget-object p0, p0, Lwfn;->b:Lcgn;

    packed-switch v0, :pswitch_data_1c

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0}, Lcgn;->K0()V

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1a

    iget-object p0, p0, Lcgn;->z:Lc0i;

    invoke-virtual {p0}, Lc0i;->a()V

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
