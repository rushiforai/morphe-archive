.class public final Llw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final synthetic a:B

.field public b:Ltcc;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ltcc;B)V
    .registers 4

    .line 14
    iput-byte p3, p0, Llw7;->a:B

    iput-object p1, p0, Llw7;->c:Ljava/lang/Object;

    iput-object p2, p0, Llw7;->b:Ltcc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Low7;Ltcc;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Llw7;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llw7;->c:Ljava/lang/Object;

    iput-object p2, p0, Llw7;->b:Ltcc;

    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 3

    iget-byte p1, p0, Llw7;->a:B

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_24

    iget-object p1, p0, Llw7;->b:Ltcc;

    if-eqz p1, :cond_d

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    :cond_d
    iput-object v0, p0, Llw7;->b:Ltcc;

    return-void

    :pswitch_10
    iget-object p1, p0, Llw7;->b:Ltcc;

    if-eqz p1, :cond_17

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    :cond_17
    iput-object v0, p0, Llw7;->b:Ltcc;

    return-void

    :pswitch_1a
    iget-object p1, p0, Llw7;->b:Ltcc;

    if-eqz p1, :cond_23

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iput-object v0, p0, Llw7;->b:Ltcc;

    :cond_23
    return-void

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_10
    .end packed-switch
.end method

.method public final onPause(Lndc;)V
    .registers 2

    iget-byte p1, p0, Llw7;->a:B

    iget-object p0, p0, Llw7;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_32

    check-cast p0, Lcy;

    iget-object p1, p0, Lcy;->d:Ljava/lang/Object;

    check-cast p1, Lxdh;

    invoke-virtual {p1}, Lo63;->i()V

    iget-object p0, p0, Lcy;->c:Ljava/lang/Object;

    check-cast p0, Lqdh;

    iget-object p0, p0, Lqdh;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void

    :pswitch_1a
    check-cast p0, Lnoc;

    iget-object p0, p0, Lnoc;->a:Ljs6;

    iget-object p0, p0, Ljs6;->j:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    return-void

    :pswitch_26
    check-cast p0, Low7;

    iget-boolean p1, p0, Low7;->j:Z

    if-eqz p1, :cond_31

    iget-object p0, p0, Low7;->g:Ljr8;

    invoke-virtual {p0}, Lo63;->i()V

    :cond_31
    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_26
        :pswitch_1a
    .end packed-switch
.end method

.method public final onResume(Lndc;)V
    .registers 2

    iget-byte p1, p0, Llw7;->a:B

    iget-object p0, p0, Llw7;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_2a

    check-cast p0, Lcy;

    iget-object p0, p0, Lcy;->e:Ljava/lang/Object;

    check-cast p0, Lwdh;

    invoke-virtual {p0}, Lwdh;->j()V

    return-void

    :pswitch_11
    check-cast p0, Lnoc;

    iget-object p0, p0, Lnoc;->b:Lcan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void

    :pswitch_19
    check-cast p0, Low7;

    iget-boolean p1, p0, Low7;->j:Z

    if-eqz p1, :cond_28

    if-eqz p1, :cond_28

    iget-object p1, p0, Low7;->g:Ljr8;

    iget-object p0, p0, Low7;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1, p0}, Lh6e;->d(Landroidx/recyclerview/widget/RecyclerView;)V

    :cond_28
    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_19
        :pswitch_11
    .end packed-switch
.end method
