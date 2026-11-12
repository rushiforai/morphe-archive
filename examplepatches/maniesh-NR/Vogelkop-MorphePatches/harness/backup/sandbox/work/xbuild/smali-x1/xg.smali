.class public final Lxg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Iterable;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x2

    iput-byte v0, p0, Lxg;->a:B

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lxg;->c:Ljava/lang/Object;

    .line 53
    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lxg;->b:Ljava/lang/Iterable;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lk6l;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lxg;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lgj9;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lgj9;-><init>(Z)V

    iput-object v0, p0, Lxg;->c:Ljava/lang/Object;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lxg;->b:Ljava/lang/Iterable;

    sget-object v0, Lfj9;->a:Ljava/util/List;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const-string v0, "android.software.picture_in_picture"

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2c

    new-instance p1, Lqz;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lk6l;->a(La2l;)Lf6l;

    :cond_2c
    return-void
.end method

.method public constructor <init>(Lk6l;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lxg;->a:B

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxg;->c:Ljava/lang/Object;

    .line 46
    new-instance v0, Lh7f;

    .line 47
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object v0, p0, Lxg;->b:Ljava/lang/Iterable;

    .line 49
    new-instance v0, Lwg;

    invoke-direct {v0, p0}, Lwg;-><init>(Lxg;)V

    .line 50
    invoke-virtual {p1, v0}, Lk6l;->c(Lj6l;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lxg;->a:B

    iget-object v1, p0, Lxg;->b:Ljava/lang/Iterable;

    packed-switch v0, :pswitch_data_36

    check-cast p1, Lfj3;

    check-cast v1, Li7f;

    invoke-virtual {v1, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Lxg;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltch;

    invoke-virtual {p1, v0}, Lfj3;->a(Ltch;)V

    goto :goto_16

    :cond_26
    return-void

    :pswitch_27
    check-cast p1, Lpbf;

    check-cast v1, Lh7f;

    invoke-virtual {v1, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void

    :pswitch_2f
    check-cast p1, La2l;

    invoke-virtual {p0, p1}, Lxg;->a(La2l;)V

    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_27
    .end packed-switch
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lxg;->a:B

    iget-object v1, p0, Lxg;->b:Ljava/lang/Iterable;

    packed-switch v0, :pswitch_data_1e

    check-cast p1, Lfj3;

    check-cast v1, Li7f;

    invoke-virtual {v1, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void

    :pswitch_f
    check-cast p1, Lpbf;

    check-cast v1, Lh7f;

    invoke-virtual {v1, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void

    :pswitch_17
    check-cast p1, La2l;

    invoke-virtual {p0, p1}, Lxg;->b(La2l;)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final a(La2l;)V
    .registers 3

    iget-object v0, p0, Lxg;->b:Ljava/lang/Iterable;

    check-cast v0, Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Lxg;->c:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_14

    check-cast p0, Ld7l;

    invoke-virtual {p0, p1}, Ld7l;->e0(La2l;)V

    :cond_14
    return-void
.end method

.method public final b(La2l;)V
    .registers 3

    iget-object v0, p0, Lxg;->b:Ljava/lang/Iterable;

    check-cast v0, Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lxg;->c:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_14

    check-cast p0, Ld7l;

    invoke-virtual {p0, p1}, Ld7l;->s0(La2l;)V

    :cond_14
    return-void
.end method

.method public final c(Z)V
    .registers 6

    iget-object v0, p0, Lxg;->c:Ljava/lang/Object;

    check-cast v0, Lgj9;

    iget-boolean v0, v0, Lgj9;->a:Z

    if-eq p1, v0, :cond_33

    new-instance v0, Lgj9;

    invoke-direct {v0, p1}, Lgj9;-><init>(Z)V

    iput-object v0, p0, Lxg;->c:Ljava/lang/Object;

    iget-object p0, p0, Lxg;->b:Ljava/lang/Iterable;

    check-cast p0, Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_17
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_33

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lpbf;

    iget-object p1, p1, Lpbf;->a:Lvbf;

    invoke-virtual {p1}, Lvbf;->q()V

    const-wide/16 v1, 0x4000

    iget-boolean v3, v0, Lgj9;->a:Z

    invoke-virtual {p1, v1, v2, v3}, Lvbf;->r(JZ)V

    invoke-virtual {p1}, Lvbf;->u()V

    goto :goto_17

    :cond_33
    return-void
.end method
