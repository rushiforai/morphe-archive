.class public Ll/qzz$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qzz;->G0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public final synthetic b:Ll/qzz;


# direct methods
.method public constructor <init>(Ll/qzz;[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qzz$b;->b:Ll/qzz;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qzz$b;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/qzz$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qzz$b;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz$b;->b:Ll/qzz;

    .line 2
    .line 3
    invoke-static {p0}, Ll/qzz;->X(Ll/qzz;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qzz$b;->b:Ll/qzz;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qzz$b;->b:Ll/qzz;

    .line 12
    .line 13
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-lez v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/qzz$b;->b:Ll/qzz;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/qzz;->K1()V

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/rzz;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/rzz;-><init>(Ll/qzz$b;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/qzz$b;->b:Ll/qzz;

    .line 39
    .line 40
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 41
    .line 42
    invoke-interface {v0}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object p0, p0, Ll/qzz$b;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    aget-object p0, p0, v1

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
