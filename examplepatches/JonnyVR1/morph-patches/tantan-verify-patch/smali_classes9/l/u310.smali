.class public Ll/u310;
.super Ll/s310;
.source "SourceFile"


# instance fields
.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/cf80;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/pwl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/s310;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/u310;->q:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic h0(Ll/u310;Ll/pwl;Ll/cf80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u310;->k0(Ll/pwl;Ll/cf80;)V

    return-void
.end method

.method public static bridge synthetic i0(Ll/u310;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u310;->q:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public c(Ll/pwl;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/s310;->c(Ll/pwl;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/u310;->q:Ljava/util/List;

    .line 5
    .line 6
    new-instance v1, Ll/t310;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Ll/t310;-><init>(Ll/u310;Ll/pwl;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/u310;->q:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super/range {p0 .. p5}, Ll/s310;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0()Ll/u310;
    .locals 1

    .line 1
    new-instance v0, Ll/u310$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/u310$a;-><init>(Ll/u310;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/u310;->r:Ll/pwl;

    .line 7
    .line 8
    invoke-super {p0, v0}, Ll/s310;->c(Ll/pwl;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final synthetic k0(Ll/pwl;Ll/cf80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Ll/u310;->l0(Ll/cf80;Ll/pwl;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l0(Ll/cf80;Ll/pwl;)V
    .locals 0

    .line 1
    iget p0, p1, Ll/cf80;->a:I

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    iget p0, p1, Ll/cf80;->c:F

    .line 8
    .line 9
    invoke-interface {p2, p0}, Ll/pwl;->R1(F)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :pswitch_1
    iget-object p0, p1, Ll/cf80;->e:Ll/fyb;

    .line 14
    .line 15
    invoke-interface {p2, p0}, Ll/pwl;->c0(Ll/fyb;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_2
    invoke-interface {p2}, Ll/pwl;->F1()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_3
    invoke-interface {p2}, Ll/pwl;->q0()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :pswitch_4
    invoke-interface {p2}, Ll/pwl;->D0()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_5
    iget p0, p1, Ll/cf80;->b:I

    .line 32
    .line 33
    invoke-interface {p2, p0}, Ll/pwl;->l0(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :pswitch_6
    invoke-interface {p2}, Ll/pwl;->f2()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :pswitch_7
    invoke-interface {p2}, Ll/pwl;->O()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :pswitch_8
    invoke-interface {p2}, Ll/pwl;->u1()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public reset()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u310;->q:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ll/s310;->reset()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/u310;->r:Ll/pwl;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-super {p0, v0}, Ll/s310;->c(Ll/pwl;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
