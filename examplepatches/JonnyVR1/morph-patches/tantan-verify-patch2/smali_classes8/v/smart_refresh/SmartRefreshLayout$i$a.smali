.class public Lv/smart_refresh/SmartRefreshLayout$i$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/smart_refresh/SmartRefreshLayout$i;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/smart_refresh/SmartRefreshLayout$i;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout$i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$i$a;->a:Lv/smart_refresh/SmartRefreshLayout$i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$i$a;->a:Lv/smart_refresh/SmartRefreshLayout$i;

    .line 2
    .line 3
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout$i;->d:Lv/smart_refresh/SmartRefreshLayout;

    .line 4
    .line 5
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->p1:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lv/smart_refresh/SmartRefreshLayout;->X0:Ll/gvc0;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lv/smart_refresh/SmartRefreshLayout;->c1:Ll/lvc0;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-interface {p0, p1, v0}, Ll/lvc0;->e(IZ)Ll/lvc0;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
