.class public final synthetic La0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf0h;


# direct methods
.method public synthetic constructor <init>(Lf0h;B)V
    .registers 3

    iput-byte p2, p0, La0h;->a:B

    iput-object p1, p0, La0h;->b:Lf0h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-byte p1, p0, La0h;->a:B

    iget-object p0, p0, La0h;->b:Lf0h;

    packed-switch p1, :pswitch_data_24

    iget-object p1, p0, Lf0h;->d:Lx5f;

    sget-object v0, Len0;->e:Len0;

    invoke-virtual {p1, v0}, Lx5f;->n0(Len0;)V

    iget-object p0, p0, Lf0h;->b:Lp0h;

    const/4 p1, 0x2

    invoke-virtual {p0, p1, p2}, Lp0h;->b(IZ)V

    return-void

    :pswitch_15
    iget-object p1, p0, Lf0h;->d:Lx5f;

    sget-object v0, Len0;->d:Len0;

    invoke-virtual {p1, v0}, Lx5f;->n0(Len0;)V

    iget-object p0, p0, Lf0h;->b:Lp0h;

    const/4 p1, 0x1

    invoke-virtual {p0, p1, p2}, Lp0h;->b(IZ)V

    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
