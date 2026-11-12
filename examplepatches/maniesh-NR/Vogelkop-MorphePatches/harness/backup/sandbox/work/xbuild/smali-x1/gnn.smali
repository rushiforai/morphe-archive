.class public final synthetic Lgnn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lqf;


# direct methods
.method public synthetic constructor <init>(Lqf;B)V
    .registers 3

    iput-byte p2, p0, Lgnn;->a:B

    iput-object p1, p0, Lgnn;->b:Lqf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lgnn;->a:B

    iget-object p0, p0, Lgnn;->b:Lqf;

    packed-switch p1, :pswitch_data_2e

    iget-object p1, p0, Lqf;->d:Ljava/lang/Object;

    check-cast p1, Ljmn;

    sget-object v0, Lkkn;->c:Lkkn;

    invoke-virtual {p1, v0}, Ljmn;->J0(Lkkn;)V

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_14
    iget-object p1, p0, Lqf;->d:Ljava/lang/Object;

    check-cast p1, Ljmn;

    sget-object v0, Lkkn;->b:Lkkn;

    invoke-virtual {p1, v0}, Ljmn;->J0(Lkkn;)V

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_21
    iget-object p1, p0, Lqf;->d:Ljava/lang/Object;

    check-cast p1, Ljmn;

    sget-object v0, Lkkn;->a:Lkkn;

    invoke-virtual {p1, v0}, Ljmn;->J0(Lkkn;)V

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_21
        :pswitch_14
    .end packed-switch
.end method
