.class public final Lnwc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnph;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroidx/appcompat/widget/SearchView;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/SearchView;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lnwc;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnwc;->b:Landroidx/appcompat/widget/SearchView;

    return-void
.end method

.method public constructor <init>(Lndn;Landroidx/appcompat/widget/SearchView;)V
    .registers 3

    const/4 p1, 0x1

    iput-byte p1, p0, Lnwc;->a:B

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lnwc;->b:Landroidx/appcompat/widget/SearchView;

    return-void
.end method

.method private final a(Z)V
    .registers 2

    return-void
.end method

.method private final e(Z)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method

.method private final g(Landroid/view/MotionEvent;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final b(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .registers 3

    iget-byte p1, p0, Lnwc;->a:B

    const/4 p2, 0x0

    iget-object p0, p0, Lnwc;->b:Landroidx/appcompat/widget/SearchView;

    packed-switch p1, :pswitch_data_22

    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    move-result p1

    if-eqz p1, :cond_14

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    :cond_14
    return p2

    :pswitch_15
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    move-result p1

    if-eqz p1, :cond_21

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    :cond_21
    return p2

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final c(Z)V
    .registers 2

    iget-byte p0, p0, Lnwc;->a:B

    return-void
.end method

.method public final d(Landroid/view/MotionEvent;)V
    .registers 2

    iget-byte p0, p0, Lnwc;->a:B

    return-void
.end method
