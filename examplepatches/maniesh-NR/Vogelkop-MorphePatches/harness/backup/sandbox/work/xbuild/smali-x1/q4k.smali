.class public final synthetic Lq4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lc5k;


# direct methods
.method public synthetic constructor <init>(Lc5k;B)V
    .registers 3

    iput-byte p2, p0, Lq4k;->a:B

    iput-object p1, p0, Lq4k;->b:Lc5k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lq4k;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lq4k;->b:Lc5k;

    packed-switch v0, :pswitch_data_42

    iget-object p0, p0, Lc5k;->e:Lt8k;

    iget-object p0, p0, Lt8k;->c:Ls8k;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_1e

    if-eq p0, v1, :cond_1f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1f

    new-instance p0, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_1e
    const/4 v1, 0x0

    :cond_1f
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_24
    iget-object v0, p0, Lc5k;->f0:Lpde;

    iget-object p0, p0, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {p0, v1}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_36
    iget-object p0, p0, Lo8k;->c:Lcom/opera/android/browser/OperaPageRootView;

    const v0, 0x7f0a023c

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewStub;

    return-object p0

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_36
        :pswitch_24
    .end packed-switch
.end method
