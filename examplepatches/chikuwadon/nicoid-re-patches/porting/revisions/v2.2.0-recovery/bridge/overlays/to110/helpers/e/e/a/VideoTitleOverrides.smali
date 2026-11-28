.class final Le/e/a/VideoTitleOverrides;
.super Ljava/lang/Object;
.source "VideoTitleOverrides.java"


# static fields
.field private static final ADD_TEMPORARY:I = 0x46e4

.field private static final REMOVE_MYLIST:I = 0x46e0

.field private static final RENAME:I = 0x46e3


# direct methods
.method constructor <init>()V
    .registers 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static actionLabel(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 4

    .line 71
    const/16 v0, 0x8

    if-ne p1, v0, :cond_0

    const-string p1, "Add to mylist"

    const-string/jumbo p2, "\u65b0\u589e\u81f3\u6211\u7684\u6e05\u55ae"

    const-string v0, "\u30de\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    invoke-static {p0, v0, p1, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 72
    :cond_0
    const/16 v0, 0x46e4

    if-ne p1, v0, :cond_1

    const-string p1, "Add to temporary mylist"

    const-string/jumbo p2, "\u65b0\u589e\u81f3\u66ab\u5b58\u6e05\u55ae"

    const-string v0, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    invoke-static {p0, v0, p1, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 74
    :cond_1
    const/16 v0, 0x46e0

    if-ne p1, v0, :cond_2

    const-string p1, "Remove from mylist"

    const-string p2, "\u5f9e\u6211\u7684\u6e05\u55ae\u79fb\u9664"

    const-string v0, "\u30de\u30a4\u30ea\u30b9\u30c8\u304b\u3089\u524a\u9664"

    invoke-static {p0, v0, p1, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 75
    :cond_2
    const/16 v0, 0x46dc

    if-ne p1, v0, :cond_3

    const-string p1, "Play next"

    const-string/jumbo p2, "\u63a5\u8457\u64ad\u653e"

    const-string/jumbo v0, "\u6b21\u306b\u518d\u751f"

    invoke-static {p0, v0, p1, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 76
    :cond_3
    const/16 v0, 0x46dd

    if-ne p1, v0, :cond_4

    const-string p1, "Add to queue"

    const-string p2, "\u52a0\u5165\u5f85\u64ad\u6e05\u55ae"

    const-string v0, "\u30ad\u30e5\u30fc\u306b\u8ffd\u52a0"

    invoke-static {p0, v0, p1, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 77
    :cond_4
    const/16 v0, 0x46b8

    if-ne p1, v0, :cond_5

    const-string p1, "Delete history and cache"

    const-string p2, "\u522a\u9664\u89c0\u770b\u8a18\u9304\u8207\u5feb\u53d6"

    const-string v0, "\u5c65\u6b74\u30fb\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    invoke-static {p0, v0, p1, p2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 78
    :cond_5
    return-object p2
.end method

.method static add(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/Menu;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;)V"
        }
    .end annotation

    .line 122
    const-string v0, "e"

    invoke-static {p1, v0}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 123
    invoke-static {p0, p1}, Le/e/a/VideoTitleOverrides;->supported(Landroid/app/Activity;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    instance-of v0, p2, Le/e/a/x1;

    if-nez v0, :cond_0

    goto :goto_2

    .line 124
    :cond_0
    check-cast p2, Le/e/a/x1;

    .line 125
    const-string v0, "videourl"

    invoke-virtual {p2, v0}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 126
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_1

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 127
    :goto_0
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    .line 128
    :cond_2
    const-string v1, "title"

    invoke-virtual {p2, v1}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    .line 129
    new-instance v1, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, v0, p2}, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 130
    invoke-interface {p3}, Landroid/view/Menu;->size()I

    move-result p1

    invoke-static {p0}, Le/e/a/VideoTitleOverrides;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    const/16 v0, 0x46e3

    invoke-interface {p3, p2, v0, p1, p0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    .line 131
    new-instance p1, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda1;

    invoke-direct {p1, v1}, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 135
    new-instance p1, Le/e/a/ListActions$Action;

    invoke-direct {p1, p0, v1}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    return-void

    .line 127
    :cond_3
    :goto_1
    return-void

    .line 123
    :cond_4
    :goto_2
    return-void
.end method

.method static bindEditorLabel(Landroid/widget/TextView;Landroid/content/Context;ILjava/lang/String;)V
    .registers 6

    .line 35
    const/16 v0, 0x46e3

    if-ne p2, v0, :cond_0

    .line 36
    invoke-static {p1}, Le/e/a/VideoTitleOverrides;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    .line 37
    const-string p3, "Playlists, mylists and cache list only"

    const-string v0, "\u50c5\u9650\u64ad\u653e\u6e05\u55ae\u3001\u6211\u7684\u6e05\u55ae\u53ca\u5feb\u53d6\u6e05\u55ae"

    const-string v1, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3001\u30de\u30a4\u30ea\u30b9\u30c8\u3001\u30ad\u30e3\u30c3\u30b7\u30e5\u30ea\u30b9\u30c8\u306e\u307f"

    invoke-static {p1, v1, p3, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 39
    :cond_0
    const/16 v0, 0x46e0

    if-ne p2, v0, :cond_1

    .line 40
    invoke-static {p1, p2, p3}, Le/e/a/VideoTitleOverrides;->actionLabel(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    .line 41
    const-string p3, "Mylists only"

    const-string v0, "\u50c5\u9650\u6211\u7684\u6e05\u55ae"

    const-string v1, "\u30de\u30a4\u30ea\u30b9\u30c8\u306e\u307f"

    invoke-static {p1, v1, p3, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 46
    :goto_0
    invoke-static {p0, p2, p1}, Le/e/a/VideoTitleOverrides;->setEditorLabel(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    new-instance p3, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda3;

    invoke-direct {p3, p0, p2, p1}, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda3;-><init>(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Landroid/widget/TextView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 50
    return-void

    .line 43
    :cond_1
    invoke-static {p1, p2, p3}, Le/e/a/VideoTitleOverrides;->actionLabel(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    return-void
.end method

.method static display(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 5

    .line 101
    invoke-static {p1, p0}, Le/e/a/VideoTitleOverrides;->supported(Landroid/app/Activity;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    return-object p3

    .line 102
    :cond_0
    invoke-static {p2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 103
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    .line 104
    :cond_1
    invoke-static {p1}, Le/e/a/VideoTitleOverrides;->titles(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    const-string v0, ""

    invoke-interface {p2, p0, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 105
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_2

    return-object p3

    .line 106
    :cond_2
    new-instance p2, Landroid/text/SpannableString;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " \u270e\ufe0e"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 107
    new-instance p3, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p1}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p1

    invoke-direct {p3, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    .line 108
    invoke-virtual {p2}, Landroid/text/SpannableString;->length()I

    move-result p1

    .line 107
    const/16 v0, 0x21

    invoke-virtual {p2, p3, p0, p1, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 109
    return-object p2

    .line 103
    :cond_3
    :goto_0
    return-object p3
.end method

.method private static insertAfter(Ljava/util/List;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .line 87
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    .line 88
    if-ltz p1, :cond_0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    add-int/lit8 p1, p1, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 89
    :cond_0
    return-void
.end method

.method static insertNewOptions(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 82
    const/16 v0, 0x8

    const/16 v1, 0x46e4

    invoke-static {p0, v0, v1}, Le/e/a/VideoTitleOverrides;->insertAfter(Ljava/util/List;II)V

    .line 83
    const/16 v0, 0x46b5

    const/16 v1, 0x46e3

    invoke-static {p0, v0, v1}, Le/e/a/VideoTitleOverrides;->insertAfter(Ljava/util/List;II)V

    .line 84
    return-void
.end method

.method private static label(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 29
    const-string v0, "Rename video title"

    const-string/jumbo v1, "\u8b8a\u66f4\u5f71\u7247\u6a19\u984c"

    const-string v2, "\u30bf\u30a4\u30c8\u30eb\u540d\u306e\u5909\u66f4"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$add$1(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5

    .line 129
    instance-of v0, p3, Ljava/lang/String;

    if-eqz v0, :cond_0

    check-cast p3, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p3, ""

    :goto_0
    invoke-static {p0, p1, p2, p3}, Le/e/a/VideoTitleOverrides;->show(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$add$2(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 132
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 133
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$bindEditorLabel$0(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;IIIIIIII)V
    .registers 12

    .line 48
    sub-int/2addr p6, p4

    sub-int/2addr p10, p8

    if-eq p6, p10, :cond_0

    invoke-static {p0, p1, p2}, Le/e/a/VideoTitleOverrides;->setEditorLabel(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    :cond_0
    return-void
.end method

.method static synthetic lambda$show$3(Landroid/widget/EditText;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .registers 7

    .line 161
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 162
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 163
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p5

    if-eqz p5, :cond_0

    invoke-interface {p1, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 164
    :cond_0
    invoke-interface {p1, p2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 165
    :goto_0
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 166
    instance-of p0, p3, Landroid/widget/BaseAdapter;

    if-eqz p0, :cond_1

    check-cast p3, Landroid/widget/BaseAdapter;

    invoke-virtual {p3}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 167
    :cond_1
    invoke-virtual {p4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ListActions;->findList(Landroid/view/View;)Landroid/widget/AdapterView;

    move-result-object p0

    .line 168
    instance-of p1, p0, Landroid/widget/ListView;

    if-eqz p1, :cond_2

    check-cast p0, Landroid/widget/ListView;

    invoke-virtual {p0}, Landroid/widget/ListView;->invalidateViews()V

    .line 169
    :cond_2
    return-void
.end method

.method static miniOwnsDown(Landroid/app/Activity;Landroid/view/MotionEvent;)Z
    .registers 5

    .line 173
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 174
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const-string v0, "nicoid-retained-mini-player"

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    .line 175
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/4 v2, 0x0

    cmpg-float v0, v0, v2

    if-gtz v0, :cond_1

    goto :goto_0

    .line 176
    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 177
    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p0

    float-to-int p0, p0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {v0, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1

    .line 175
    :cond_3
    :goto_0
    return v1
.end method

.method static refreshRecycled(Ljava/lang/Object;Landroid/view/View;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6

    .line 113
    invoke-static {p2, p0}, Le/e/a/VideoTitleOverrides;->supported(Landroid/app/Activity;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    instance-of v0, p4, Le/e/a/x1;

    if-nez v0, :cond_0

    goto :goto_0

    .line 114
    :cond_0
    const v0, 0x7f0801b4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 115
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 116
    check-cast p4, Le/e/a/x1;

    const-string v0, "title"

    invoke-virtual {p4, v0}, Le/e/a/x1;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    .line 117
    instance-of v0, p4, Ljava/lang/String;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/widget/TextView;

    check-cast p4, Ljava/lang/String;

    invoke-static {p0, p2, p3, p4}, Le/e/a/VideoTitleOverrides;->display(Ljava/lang/Object;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    :cond_1
    return-void

    .line 113
    :cond_2
    :goto_0
    return-void
.end method

.method private static setEditorLabel(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    .line 53
    nop

    .line 54
    new-instance v0, Landroid/text/SpannableString;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    .line 56
    new-instance v1, Landroid/text/style/RelativeSizeSpan;

    const/high16 v2, 0x3f400000    # 0.75f

    invoke-direct {v1, v2}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v3

    const/16 v4, 0x21

    invoke-virtual {v0, v1, p1, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 57
    invoke-virtual {p0}, Landroid/widget/TextView;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingLeft()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundPaddingRight()I

    move-result v3

    sub-int/2addr v1, v3

    .line 58
    const/4 v3, 0x4

    if-le v1, v3, :cond_0

    .line 59
    new-instance v5, Landroid/text/TextPaint;

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    .line 60
    invoke-virtual {v5}, Landroid/text/TextPaint;->getTextSize()F

    move-result v6

    mul-float/2addr v6, v2

    invoke-virtual {v5, v6}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 61
    invoke-virtual {v5, p2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result p2

    .line 62
    sub-int/2addr v1, v3

    int-to-float v1, v1

    cmpl-float v2, p2, v1

    if-lez v2, :cond_0

    .line 63
    new-instance v2, Landroid/text/style/ScaleXSpan;

    div-float/2addr v1, p2

    invoke-direct {v2, v1}, Landroid/text/style/ScaleXSpan;-><init>(F)V

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result p2

    invoke-virtual {v0, v2, p1, p2, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 66
    :cond_0
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 67
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    return-void
.end method

.method private static show(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    .line 139
    invoke-static {p0}, Le/e/a/VideoTitleOverrides;->titles(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 140
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 141
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 142
    invoke-virtual {v1, p3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 143
    const-string p3, ""

    invoke-interface {v2, p2, p3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 144
    invoke-virtual {v1}, Landroid/widget/EditText;->length()I

    move-result p3

    invoke-virtual {v1, p3}, Landroid/widget/EditText;->setSelection(I)V

    .line 145
    new-instance p3, Landroid/widget/LinearLayout;

    invoke-direct {p3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 146
    invoke-virtual {p3, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 147
    const/16 v0, 0x18

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    .line 148
    const/4 v3, 0x4

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p3, v0, v3, v0, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 149
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 150
    const-string v3, "Save an empty title to restore the original."

    const-string v4, "\u5132\u5b58\u7a7a\u767d\u6a19\u984c\u5373\u53ef\u9084\u539f\u539f\u59cb\u6a19\u984c\u3002"

    const-string/jumbo v5, "\u7a7a\u6b04\u3067\u4fdd\u5b58\u3059\u308b\u3068\u5143\u306e\u30bf\u30a4\u30c8\u30eb\u306b\u623b\u308a\u307e\u3059"

    invoke-static {p0, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p3, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 154
    const/16 v3, 0x8

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 155
    invoke-virtual {p3, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 157
    invoke-static {p0}, Le/e/a/VideoTitleOverrides;->label(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 158
    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    .line 159
    const/high16 v0, 0x1040000

    const/4 v3, 0x0

    invoke-virtual {p3, v0, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    new-instance v6, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda2;

    move-object v0, v6

    move-object v3, p2

    move-object v4, p1

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Le/e/a/VideoTitleOverrides$$ExternalSyntheticLambda2;-><init>(Landroid/widget/EditText;Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;Landroid/app/Activity;)V

    .line 160
    const p0, 0x104000a

    invoke-virtual {p3, p0, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 169
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 156
    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 170
    return-void
.end method

.method private static supported(Landroid/app/Activity;Ljava/lang/Object;)Z
    .registers 2

    .line 92
    if-eqz p0, :cond_1

    invoke-static {p1}, Le/e/a/LocalPlaylists;->hasAdapter(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 93
    invoke-static {p0}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {p0}, Le/e/a/AccountRemoval227;->kind(Landroid/app/Activity;)I

    move-result p0

    if-lez p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 92
    :goto_0
    return p0
.end method

.method private static titles(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 97
    const-string v0, "nicoid_video_title_overrides"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method
