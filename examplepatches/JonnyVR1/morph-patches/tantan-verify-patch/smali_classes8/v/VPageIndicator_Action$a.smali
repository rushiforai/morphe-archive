.class public Lv/VPageIndicator_Action$a;
.super Ll/kmj$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lv/VPageIndicator_Action;->g(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VPageIndicator_Action;


# direct methods
.method public constructor <init>(Lv/VPageIndicator_Action;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/VPageIndicator_Action$a;->a:Lv/VPageIndicator_Action;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kmj$d;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object p1, p0, Lv/VPageIndicator_Action$a;->a:Lv/VPageIndicator_Action;

    .line 2
    .line 3
    invoke-static {p1}, Lv/VPageIndicator_Action;->d(Lv/VPageIndicator_Action;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lv/VPageIndicator_Action$a;->a:Lv/VPageIndicator_Action;

    .line 8
    .line 9
    invoke-static {v0}, Lv/VPageIndicator_Action;->c(Lv/VPageIndicator_Action;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lv/VPageIndicator_Action$a;->a:Lv/VPageIndicator_Action;

    .line 18
    .line 19
    invoke-static {p1}, Lv/VPageIndicator_Action;->e(Lv/VPageIndicator_Action;)F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 v0, 0x0

    .line 24
    cmpl-float p1, p1, v0

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    iget-object p1, p0, Lv/VPageIndicator_Action$a;->a:Lv/VPageIndicator_Action;

    .line 29
    .line 30
    invoke-static {p1}, Lv/VPageIndicator_Action;->a(Lv/VPageIndicator_Action;)Ll/x20;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lv/VPageIndicator_Action$a;->a:Lv/VPageIndicator_Action;

    .line 37
    .line 38
    invoke-static {p0}, Lv/VPageIndicator_Action;->a(Lv/VPageIndicator_Action;)Ll/x20;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Ll/x20;->call()V

    .line 43
    .line 44
    .line 45
    return v1

    .line 46
    :cond_0
    const/4 p0, 0x0

    .line 47
    return p0
.end method
