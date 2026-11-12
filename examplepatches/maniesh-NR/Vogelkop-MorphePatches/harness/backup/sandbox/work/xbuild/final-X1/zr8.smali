.class public final synthetic Lzr8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lns8;


# direct methods
.method public synthetic constructor <init>(Lns8;B)V
    .registers 3

    iput-byte p2, p0, Lzr8;->a:B

    iput-object p1, p0, Lzr8;->b:Lns8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lzr8;->a:B

    iget-object p0, p0, Lzr8;->b:Lns8;

    packed-switch v0, :pswitch_data_2a

    check-cast p1, Lpzj;

    iget-boolean v0, p0, Lns8;->A:Z

    invoke-virtual {p0, p1, v0}, Lns8;->Z(Lpzj;Z)V

    return-void

    :pswitch_f
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lns8;->A:Z

    iget-object p1, p0, Lns8;->x:Ltlg;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Ltlg;->i:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lpzj;

    iget-boolean v0, p0, Lns8;->A:Z

    invoke-virtual {p0, p1, v0}, Lns8;->Z(Lpzj;Z)V

    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
