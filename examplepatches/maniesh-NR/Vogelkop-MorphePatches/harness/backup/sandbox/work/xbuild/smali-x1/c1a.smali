.class public final Lc1a;
.super Llim;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ltcc;Lii;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Ll1a;Lqim;Leq9;Lk6l;Lxt3;Lx5f;Lv1a;)V
    .registers 16

    const/4 v0, 0x0

    iput-byte v0, p0, Lc1a;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p5, p0, Lc1a;->b:Ljava/lang/Object;

    iput-object p6, p0, Lc1a;->c:Ljava/lang/Object;

    iput-object p7, p0, Lc1a;->d:Ljava/lang/Object;

    iput-object p8, p0, Lc1a;->e:Ljava/lang/Object;

    iput-object p9, p0, Lc1a;->f:Ljava/lang/Object;

    move-object p7, p3

    new-instance p3, Lks3;

    new-instance p9, Lld9;

    const/16 v1, 0xe

    invoke-direct {p9, p0, v1}, Lld9;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ly0a;

    invoke-direct {v1, p0, v0}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lkze;

    new-instance v3, Lfi7;

    invoke-direct {v3, v0, v0}, Lfi7;-><init>(II)V

    invoke-direct {v2, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, p3, Lks3;->e:Ljava/lang/Object;

    iput-object p2, p3, Lks3;->a:Ljava/lang/Object;

    iput-object p7, p3, Lks3;->b:Ljava/lang/Object;

    iput-object p4, p3, Lks3;->c:Ljava/lang/Object;

    iput-object p6, p3, Lks3;->d:Ljava/lang/Object;

    new-instance p6, Lld9;

    const/16 p7, 0xd

    invoke-direct {p6, p3, p7}, Lld9;-><init>(Ljava/lang/Object;B)V

    iput-object p6, p3, Lks3;->g:Ljava/lang/Object;

    iput-object p9, p3, Lks3;->h:Ljava/lang/Object;

    iput-object v1, p3, Lks3;->i:Ljava/lang/Object;

    iput-object p3, p0, Lc1a;->g:Ljava/lang/Object;

    move-object p6, p4

    new-instance p4, Lea6;

    invoke-virtual {p6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p6

    invoke-virtual {p6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p6

    invoke-direct {p4, p6, p5}, Lea6;-><init>(Landroid/content/Context;Ll1a;)V

    move-object p7, p2

    move-object p2, p1

    new-instance p1, Lb1a;

    invoke-static {p8}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p6, Lz0a;

    invoke-direct {p6, p8, v0}, Lz0a;-><init>(Lk6l;B)V

    move-object p5, p10

    move-object p8, p11

    invoke-direct/range {p1 .. p8}, Lb1a;-><init>(Ltcc;Lks3;Lea6;Lx5f;Lz0a;Lii;Lv1a;)V

    iput-object p1, p0, Lc1a;->h:Ljava/lang/Object;

    invoke-virtual {p2, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public constructor <init>(Ltcc;Lydn;Lslk;Lz77;Lgjm;Lx5f;)V
    .registers 8

    const/4 v0, 0x1

    iput-byte v0, p0, Lc1a;->a:B

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Lc1a;->b:Ljava/lang/Object;

    .line 108
    iput-object p2, p0, Lc1a;->c:Ljava/lang/Object;

    .line 109
    iput-object p3, p0, Lc1a;->d:Ljava/lang/Object;

    .line 110
    iput-object p4, p0, Lc1a;->e:Ljava/lang/Object;

    .line 111
    iput-object p5, p0, Lc1a;->f:Ljava/lang/Object;

    .line 112
    iput-object p6, p0, Lc1a;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final R()Lb23;
    .registers 3

    iget-object v0, p0, Lc1a;->g:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-object v1, p0, Lc1a;->d:Ljava/lang/Object;

    check-cast v1, Lslk;

    iget-object v1, v1, Lslk;->i:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwvg;

    invoke-virtual {v1}, Lwvg;->b()Z

    move-result v1

    if-eqz v1, :cond_20

    new-instance v1, Luug;

    iget-object p0, p0, Lc1a;->f:Ljava/lang/Object;

    check-cast p0, Lgjm;

    invoke-direct {v1, p0, v0}, Luug;-><init>(Lgjm;Lx5f;)V

    return-object v1

    :cond_20
    new-instance v1, Luug;

    iget-object p0, p0, Lc1a;->c:Ljava/lang/Object;

    check-cast p0, Lydn;

    invoke-direct {v1, p0, v0}, Luug;-><init>(Lydn;Lx5f;)V

    return-object v1
.end method

.method public final W(Lndc;)V
    .registers 3

    iget-byte p1, p0, Lc1a;->a:B

    packed-switch p1, :pswitch_data_24

    return-void

    :pswitch_6
    iget-object p1, p0, Lc1a;->c:Ljava/lang/Object;

    check-cast p1, Lqim;

    iget-object v0, p0, Lc1a;->h:Ljava/lang/Object;

    check-cast v0, Lb1a;

    iget-object p1, p1, Lqim;->r:Lh7f;

    invoke-virtual {p1, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p0, Lc1a;->d:Ljava/lang/Object;

    check-cast p1, Leq9;

    invoke-virtual {p1, v0}, Leq9;->a(Liq9;)V

    iget-object p0, p0, Lc1a;->e:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->w:Lxg;

    invoke-virtual {p0, v0}, Lxg;->a(La2l;)V

    return-void

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 4

    iget-byte v0, p0, Lc1a;->a:B

    iget-object v1, p0, Lc1a;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_42

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lc1a;->h:Ljava/lang/Object;

    check-cast p1, Lnlk;

    if-eqz p1, :cond_19

    check-cast v1, Lydn;

    invoke-virtual {v1, p1}, Lydn;->A(Ltdn;)V

    :cond_19
    const/4 p1, 0x0

    iput-object p1, p0, Lc1a;->h:Ljava/lang/Object;

    return-void

    :pswitch_1d
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v1, Lqim;

    iget-object p1, p0, Lc1a;->h:Ljava/lang/Object;

    check-cast p1, Lb1a;

    iget-object v0, v1, Lqim;->r:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lc1a;->d:Ljava/lang/Object;

    check-cast v0, Leq9;

    iget-object v0, v0, Leq9;->c:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lc1a;->e:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->w:Lxg;

    invoke-virtual {p0, p1}, Lxg;->b(La2l;)V

    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
