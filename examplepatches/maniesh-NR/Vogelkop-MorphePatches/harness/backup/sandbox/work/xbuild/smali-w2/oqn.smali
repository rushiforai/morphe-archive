.class public final synthetic Loqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyw;

.field public final synthetic c:Lqqn;


# direct methods
.method public synthetic constructor <init>(Lyw;Lqqn;B)V
    .registers 4

    iput-byte p3, p0, Loqn;->a:B

    iput-object p1, p0, Loqn;->b:Lyw;

    iput-object p2, p0, Loqn;->c:Lqqn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Loqn;->a:B

    iget-object v0, p0, Loqn;->c:Lqqn;

    iget-object p0, p0, Loqn;->b:Lyw;

    packed-switch p1, :pswitch_data_34

    iget-object p0, p0, Lyw;->e:Ljava/lang/Object;

    check-cast p0, Lz4k;

    iget-object p1, v0, Lqqn;->a:Ljava/lang/String;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->p:Lkrn;

    new-instance v0, Lhrn;

    invoke-direct {v0, p1}, Lhrn;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_1e
    iget-object p0, p0, Lyw;->e:Ljava/lang/Object;

    check-cast p0, Lz4k;

    iget-object p1, v0, Lqqn;->a:Ljava/lang/String;

    iget-object p0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast p0, Lmrn;

    iget-object p0, p0, Lmrn;->p:Lkrn;

    new-instance v0, Lgrn;

    invoke-direct {v0, p1}, Lgrn;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Lkrn;->f(Ltc2;)V

    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
