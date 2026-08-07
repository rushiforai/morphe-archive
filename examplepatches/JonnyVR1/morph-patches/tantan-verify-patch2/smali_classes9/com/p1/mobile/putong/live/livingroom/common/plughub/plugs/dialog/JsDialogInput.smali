.class public Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;
.super Lv/VEditText;
.source "SourceFile"

# interfaces
.implements Ll/sqq;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1}, Lv/VEditText;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;->k(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p0, p2, p1}, Ll/sqq;->c(Landroid/widget/TextView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 5
    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->bgColor:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/4 v0, 0x6

    .line 18
    invoke-static {p2, v0}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    const/high16 p2, 0x41100000    # 9.0f

    .line 26
    .line 27
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    const/high16 v0, 0x41200000    # 10.0f

    .line 32
    .line 33
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p0, v0, p2, v0, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 38
    .line 39
    .line 40
    const/high16 p2, 0x41c00000    # 24.0f

    .line 41
    .line 42
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    iput p2, p3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 47
    .line 48
    iput p2, p3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 49
    .line 50
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput$a;

    .line 51
    .line 52
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 56
    .line 57
    .line 58
    new-instance p1, Ll/rqq;

    .line 59
    .line 60
    invoke-direct {p1, p0}, Ll/rqq;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogInput;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic k(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method
