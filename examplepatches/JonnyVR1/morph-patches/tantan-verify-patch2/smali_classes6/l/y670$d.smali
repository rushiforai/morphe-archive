.class public Ll/y670$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y670;->C()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y670;


# direct methods
.method public constructor <init>(Ll/y670;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y670$d;->a:Ll/y670;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/y670$d;->a:Ll/y670;

    .line 2
    .line 3
    iget-object v1, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, v0, Ll/y670;->d:Ll/v670;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/v670;->b1()Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/y670$d;->a:Ll/y670;

    .line 15
    .line 16
    invoke-static {v1}, Ll/y670;->b(Ll/y670;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v1, p0, Ll/y670$d;->a:Ll/y670;

    .line 23
    .line 24
    iget-object v1, v1, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-lez v1, :cond_1

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v1, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-lez v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Ll/y670$d;->a:Ll/y670;

    .line 49
    .line 50
    iget-object v1, v1, Ll/y670;->d:Ll/v670;

    .line 51
    .line 52
    iget-object v2, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v2, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v0, Ljava/lang/Integer;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {v1, v2, v0}, Ll/v670;->I1(II)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/y670$d;->a:Ll/y670;

    .line 72
    .line 73
    iget-object v0, v0, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    :goto_0
    return-void
.end method
