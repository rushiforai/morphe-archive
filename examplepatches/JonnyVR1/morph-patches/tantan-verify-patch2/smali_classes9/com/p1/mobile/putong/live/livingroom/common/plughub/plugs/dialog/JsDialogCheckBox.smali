.class public Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;
.super Lv/VText;
.source "SourceFile"

# interfaces
.implements Ll/sqq;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;->o(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Landroid/view/View;)V

    return-void
.end method

.method private setChecked(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V
    .locals 1

    .line 1
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/obc0;->o3:I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget p1, Ll/obc0;->n3:I

    .line 9
    .line 10
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, p1, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 0

    .line 1
    invoke-interface {p0, p0, p2, p1}, Ll/sqq;->c(Landroid/widget/TextView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 2
    .line 3
    .line 4
    const/high16 p2, 0x40c00000    # 6.0f

    .line 5
    .line 6
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;->setChecked(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 14
    .line 15
    .line 16
    const/16 p2, 0x11

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/sqq;->d(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iput p2, p3, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 26
    .line 27
    new-instance p2, Ll/lqq;

    .line 28
    .line 29
    invoke-direct {p2, p0, p1}, Ll/lqq;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;->p(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->actionListener:Ll/z20;

    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->callback:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const-string p1, "1"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p1, "0"

    .line 18
    .line 19
    :goto_0
    invoke-interface {p0, p2, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->checked:Z

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogCheckBox;->setChecked(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
