.class public interface abstract Ll/sqq;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public c(Landroid/widget/TextView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V
    .locals 1

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->title:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textColor:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/ynp0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    move-exception v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p3, p2, v0}, Ll/awr;->e(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iget p2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->textSize:I

    .line 28
    .line 29
    int-to-float p2, p2

    .line 30
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0, p3}, Ll/sqq;->d(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)I
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;->contentGravity:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    const/4 v0, 0x0

    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p1, 0x2

    .line 9
    if-ne p0, p1, :cond_1

    .line 10
    .line 11
    return v0

    .line 12
    :cond_1
    const/16 p0, 0x11

    .line 13
    .line 14
    return p0
.end method

.method public abstract g(Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;Ljava/lang/String;Landroid/widget/LinearLayout$LayoutParams;)V
.end method
