.class public Ll/gm70$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/gm70;->A()I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public final synthetic c:Ll/gm70;


# direct methods
.method public constructor <init>(Ll/gm70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gm70$a;->c:Ll/gm70;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p2, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iput p1, p0, Ll/gm70$a;->b:F

    .line 16
    .line 17
    iget p2, p0, Ll/gm70$a;->a:F

    .line 18
    .line 19
    sub-float/2addr p2, p1

    .line 20
    sget p1, Ll/qa00;->h:I

    .line 21
    .line 22
    int-to-float p1, p1

    .line 23
    cmpl-float p1, p2, p1

    .line 24
    .line 25
    if-lez p1, :cond_2

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object p2, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PICKS_GUIDE:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 32
    .line 33
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget-object v1, Lcom/p1/mobile/android/ui/poplevel/PopAction;->USER_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 38
    .line 39
    invoke-virtual {p1, p2, v1}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/gm70$a;->c:Ll/gm70;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/gm70;->K()V

    .line 45
    .line 46
    .line 47
    return v0

    .line 48
    :cond_1
    iput p1, p0, Ll/gm70$a;->a:F

    .line 49
    .line 50
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 51
    return p0
.end method
