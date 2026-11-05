.class public final Le/e/a/RankingNote195;
.super Ljava/lang/Object;
.source "RankingNote195.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$0(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;)V
    .registers 5

    .line 4
    invoke-static {p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "Official rankings do not include tags, so tags are fetched separately for each candidate video. Loading time depends on the number of candidates and the network connection."

    const-string v0, "\u5b98\u65b9\u6392\u884c\u699c\u4e0d\u5305\u542b\u6a19\u7c64\uff0c\u56e0\u6b64\u9700\u8981\u9010\u4e00\u53d6\u5f97\u5019\u9078\u5f71\u7247\u7684\u6a19\u7c64\u3002\u8f09\u5165\u6642\u9593\u53d6\u6c7a\u65bc\u5019\u9078\u5f71\u7247\u6578\u91cf\u8207\u7db2\u8def\u72c0\u6cc1\u3002"

    const-string v1, "\u516c\u5f0f\u30e9\u30f3\u30ad\u30f3\u30b0\u306b\u30bf\u30b0\u60c5\u5831\u304c\u542b\u307e\u308c\u306a\u3044\u305f\u3081\u3001\u5019\u88dc\u52d5\u753b\u3054\u3068\u306b\u30bf\u30b0\u60c5\u5831\u3092\u8ffd\u52a0\u53d6\u5f97\u3057\u3066\u7d5e\u308a\u8fbc\u307f\u307e\u3059\u3002\u5019\u88dc\u6570\u3084\u901a\u4fe1\u72b6\u6cc1\u306b\u3088\u3063\u3066\u8868\u793a\u307e\u3067\u6642\u9593\u304c\u304b\u304b\u308a\u307e\u3059\u3002"

    invoke-static {p0, v1, p2, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "\u9589\u3058\u308b"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method public static text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;
    .registers 5

    .line 4
    invoke-static {p0, p1, p2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p2

    const-string v0, "\u30bf\u30b0\u6761\u4ef6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "Tag conditions"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "\u6a19\u7c64\u689d\u4ef6"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_68

    :cond_1c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " \u24d8"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u8aac\u660e"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 v0, 0x30

    invoke-static {p0, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    const/16 v0, 0x10

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v0, Le/e/a/RankingNote195$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Le/e/a/RankingNote195$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_68
    return-object p2
.end method
