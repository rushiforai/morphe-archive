.class public final Ll/xnn$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xnn;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0008*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J/\u0010\u000c\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "l/xnn$b",
        "Landroid/widget/AbsListView$OnScrollListener;",
        "Landroid/widget/AbsListView;",
        "view",
        "",
        "scrollState",
        "",
        "onScrollStateChanged",
        "(Landroid/widget/AbsListView;I)V",
        "firstVisibleItem",
        "visibleItemCount",
        "totalItemCount",
        "onScroll",
        "(Landroid/widget/AbsListView;III)V",
        "message_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/xnn;


# direct methods
.method public constructor <init>(Ll/xnn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/xnn;->H()Ll/rvl;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/xnn;->H()Ll/rvl;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-interface {p2}, Ll/rvl;->getTop()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    neg-int p2, p2

    .line 32
    int-to-float p2, p2

    .line 33
    iget-object p0, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xnn;->Q()Lv/VList;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    sub-float/2addr p2, p0

    .line 44
    float-to-int p0, p2

    .line 45
    invoke-virtual {p1, p0}, Ll/xnn;->A(I)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object p0, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 50
    .line 51
    sget p1, Ll/qa00;->S:I

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/xnn;->A(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    if-ne p2, p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/xnn;->J()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/xnn;->G()Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/xnn$b;->a:Ll/xnn;

    .line 25
    .line 26
    invoke-static {p0}, Ll/xnn;->w(Ll/xnn;)Ljava/lang/Runnable;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
