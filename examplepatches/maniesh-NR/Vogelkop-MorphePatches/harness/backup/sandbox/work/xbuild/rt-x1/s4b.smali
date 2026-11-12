.class public final Ls4b;
.super Lv5k;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Landroidx/recyclerview/widget/RecyclerView;

.field public final f:Lagm;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public final i:Lk6k;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lgjm;Lijc;Lpde;)V
    .registers 9

    const/4 v0, 0x0

    iput-byte v0, p0, Ls4b;->d:B

    .line 43
    sget-object v1, Le6k;->l:Le6k;

    const v2, 0x7f0d021b

    .line 44
    const-class v3, Lr4b;

    invoke-direct {p0, v3, p3, v1, v2}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    .line 45
    iput-object p1, p0, Ls4b;->e:Landroidx/recyclerview/widget/RecyclerView;

    .line 46
    iput-object p2, p0, Ls4b;->g:Ljava/lang/Object;

    .line 47
    iput-object p4, p0, Ls4b;->h:Ljava/lang/Object;

    .line 48
    new-instance p1, Lo4b;

    const/4 p2, 0x1

    invoke-direct {p1, p0, v1, p2}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, Ls4b;->i:Lk6k;

    .line 49
    new-instance p1, Lagm;

    new-instance p2, Lq4b;

    invoke-direct {p2, p0, v0}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Ls4b;->f:Lagm;

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Lijc;Lt8k;Ltsd;Lhv3;)V
    .registers 9

    const/4 v0, 0x1

    iput-byte v0, p0, Ls4b;->d:B

    sget-object v0, Le6k;->d:Le6k;

    const v1, 0x7f0d03c4

    const-class v2, Ll8k;

    invoke-direct {p0, v2, p2, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p1, p0, Ls4b;->e:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Ls4b;->g:Ljava/lang/Object;

    iput-object p5, p0, Ls4b;->h:Ljava/lang/Object;

    new-instance p1, Lo4b;

    const/16 p2, 0xc

    invoke-direct {p1, p0, v0, p2}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p1, p0, Ls4b;->i:Lk6k;

    new-instance p1, Lagm;

    new-instance p2, Ls4f;

    const/16 p3, 0x1c

    invoke-direct {p2, p0, p4, p3}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, p2}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p1, p0, Ls4b;->f:Lagm;

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-byte p1, p0, Ls4b;->d:B

    packed-switch p1, :pswitch_data_14

    iget-object p0, p0, Ls4b;->f:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0

    :pswitch_c
    iget-object p0, p0, Ls4b;->f:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final t()Lja2;
    .registers 2

    iget-byte p0, p0, Ls4b;->d:B

    packed-switch p0, :pswitch_data_14

    new-instance p0, Ll8k;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0

    :pswitch_c
    new-instance p0, Lr4b;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final u()Lk6k;
    .registers 2

    iget-byte v0, p0, Ls4b;->d:B

    packed-switch v0, :pswitch_data_10

    iget-object p0, p0, Ls4b;->i:Lk6k;

    check-cast p0, Lo4b;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Ls4b;->i:Lk6k;

    check-cast p0, Lo4b;

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final z()Z
    .registers 1

    iget-byte p0, p0, Ls4b;->d:B

    packed-switch p0, :pswitch_data_a

    const/4 p0, 0x0

    throw p0

    :pswitch_7
    const/4 p0, 0x0

    throw p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method
