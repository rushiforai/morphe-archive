.class public final synthetic Lm85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo85;


# direct methods
.method public synthetic constructor <init>(Lo85;B)V
    .registers 3

    iput-byte p2, p0, Lm85;->a:B

    iput-object p1, p0, Lm85;->b:Lo85;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lm85;->a:B

    iget-object p0, p0, Lm85;->b:Lo85;

    packed-switch p1, :pswitch_data_20

    iget-object p0, p0, Lo85;->b:Lu85;

    iget-object p0, p0, Lu85;->i:Ljava/lang/Object;

    check-cast p0, Lhv3;

    sget-object p1, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1}, Lhv3;->b(Lhbf;)V

    return-void

    :pswitch_13
    iget-object p0, p0, Lo85;->b:Lu85;

    iget-object p0, p0, Lu85;->i:Ljava/lang/Object;

    check-cast p0, Lhv3;

    sget-object p1, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1}, Lhv3;->b(Lhbf;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
