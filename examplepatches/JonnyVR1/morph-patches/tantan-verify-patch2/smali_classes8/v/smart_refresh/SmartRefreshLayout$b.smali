.class public Lv/smart_refresh/SmartRefreshLayout$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/smart_refresh/SmartRefreshLayout;->setStateLoading(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lv/smart_refresh/SmartRefreshLayout;


# direct methods
.method public constructor <init>(Lv/smart_refresh/SmartRefreshLayout;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$b;->b:Lv/smart_refresh/SmartRefreshLayout;

    .line 2
    .line 3
    iput-boolean p2, p0, Lv/smart_refresh/SmartRefreshLayout$b;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/Animator;->getDuration()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long p1, v0, v2

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p1, p0, Lv/smart_refresh/SmartRefreshLayout$b;->b:Lv/smart_refresh/SmartRefreshLayout;

    .line 15
    .line 16
    iget-boolean p0, p0, Lv/smart_refresh/SmartRefreshLayout$b;->a:Z

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Lv/smart_refresh/SmartRefreshLayout;->setStateDirectLoading(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
