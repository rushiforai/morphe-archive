.class public final Lkj2;
.super Lsj2;
.source "SourceFile"


# instance fields
.field public final synthetic f:B

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILzy9;Ljava/lang/Runnable;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lkj2;->f:B

    const v0, 0x7f1401b7

    .line 16
    invoke-direct {p0, p1, v0, p2, p3}, Lsj2;-><init>(Landroid/content/Context;IILrj2;)V

    .line 17
    iput-object p4, p0, Lkj2;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcd9;Landroid/content/Context;Ls6h;Lode;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lkj2;->f:B

    iput-object p4, p0, Lkj2;->g:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    const p4, 0x7f14131d

    invoke-direct {p0, p2, p1, p4, p3}, Lsj2;-><init>(Landroid/content/Context;IILrj2;)V

    return-void
.end method

.method public constructor <init>(Lvj2;Landroid/app/Activity;ILeme;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lkj2;->f:B

    .line 18
    iput-object p1, p0, Lkj2;->g:Ljava/lang/Object;

    const p1, 0x7f1401b7

    invoke-direct {p0, p2, p1, p3, p4}, Lsj2;-><init>(Landroid/content/Context;IILrj2;)V

    return-void
.end method


# virtual methods
.method public final i()V
    .registers 2

    iget-byte v0, p0, Lkj2;->f:B

    iget-object p0, p0, Lkj2;->g:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    check-cast p0, Lode;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_f
    check-cast p0, Lvj2;

    iget-object p0, p0, Lvj2;->e:Ljava/util/ArrayDeque;

    :goto_13
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_27

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_13

    :cond_27
    return-void

    :pswitch_28
    check-cast p0, Ljava/lang/Runnable;

    if-eqz p0, :cond_2f

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_2f
    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_28
        :pswitch_f
    .end packed-switch
.end method
