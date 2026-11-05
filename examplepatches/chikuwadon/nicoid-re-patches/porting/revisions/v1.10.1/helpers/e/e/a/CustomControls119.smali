.class public final Le/e/a/CustomControls119;
.super Ljava/lang/Object;
.source "CustomControls119.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/view/View;)V
    .registers 4

    .line 3
    if-eqz p0, :cond_5d

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CustomTheme119;->enabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_5d

    :cond_d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    instance-of v1, p0, Landroid/widget/CompoundButton;

    if-eqz v1, :cond_23

    move-object v1, p0

    check-cast v1, Landroid/widget/CompoundButton;

    invoke-virtual {v1, v0}, Landroid/widget/CompoundButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    :cond_23
    instance-of v1, p0, Landroid/widget/ProgressBar;

    if-eqz v1, :cond_30

    move-object v1, p0

    check-cast v1, Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    :cond_30
    instance-of v1, p0, Landroid/widget/SeekBar;

    if-eqz v1, :cond_3a

    move-object v1, p0

    check-cast v1, Landroid/widget/SeekBar;

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setThumbTintList(Landroid/content/res/ColorStateList;)V

    :cond_3a
    instance-of v1, p0, Landroid/widget/EditText;

    if-eqz v1, :cond_5d

    check-cast p0, Landroid/widget/EditText;

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_5d

    invoke-virtual {p0}, Landroid/widget/EditText;->getTextCursorDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_5d

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setTextCursorDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_5d
    :goto_5d
    return-void
.end method
