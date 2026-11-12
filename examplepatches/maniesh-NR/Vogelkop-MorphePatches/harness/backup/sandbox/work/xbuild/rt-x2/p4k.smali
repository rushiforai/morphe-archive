.class public final synthetic Lp4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lc5k;


# direct methods
.method public synthetic constructor <init>(Lc5k;B)V
    .registers 3

    iput-byte p2, p0, Lp4k;->a:B

    iput-object p1, p0, Lp4k;->b:Lc5k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lp4k;->a:B

    iget-object p0, p0, Lp4k;->b:Lc5k;

    packed-switch v0, :pswitch_data_5e

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->q(Landroid/content/Context;)I

    move-result v0

    iget-object p0, p0, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    filled-new-array {v0}, [I

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->o:Lvdd;

    iget-object v2, v2, Lvdd;->b:Ludd;

    iput-object v1, v2, Ludd;->j:[I

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ludd;->b(I)V

    invoke-virtual {v2, v3}, Ludd;->b(I)V

    aget v1, v1, v3

    iput v1, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->y:I

    iput v0, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->z:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0402f3

    const v1, 0x7f060f80

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iget-object v0, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->j:Lg05;

    invoke-virtual {v0, p1}, Lg05;->setBackgroundColor(I)V

    iget-object p0, p0, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->o:Lvdd;

    iget-object p0, p0, Lvdd;->b:Ludd;

    iput p1, p0, Ludd;->w:I

    return-void

    :pswitch_42
    iget-object p1, p0, Lc5k;->b0:Lks3;

    iget-object p1, p1, Lks3;->h:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrmn;

    invoke-virtual {p0, p1}, Lc5k;->j(Lrmn;)V

    iget-object p1, p0, Lc5k;->W:Lkze;

    invoke-virtual {p0}, Lc5k;->d()Lvr8;

    move-result-object v0

    invoke-static {p1, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lc5k;->k()V

    return-void

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_42
    .end packed-switch
.end method
