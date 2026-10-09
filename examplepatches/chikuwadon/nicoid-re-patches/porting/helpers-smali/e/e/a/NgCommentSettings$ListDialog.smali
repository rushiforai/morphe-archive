.class final Le/e/a/NgCommentSettings$ListDialog;
.super Ljava/lang/Object;
.source "NgCommentSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/NgCommentSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ListDialog"
.end annotation


# instance fields
.field final actions:Landroid/widget/LinearLayout;

.field active:Le/e/a/NetworkTask;

.field final activity:Landroid/preference/PreferenceActivity;

.field final add:Landroid/widget/Button;

.field final body:Landroid/widget/LinearLayout;

.field busy:Z

.field choosing:Z

.field final clear:Landroid/widget/Button;

.field final context:Landroid/content/Context;

.field data:Lorg/json/JSONArray;

.field final delete:Landroid/widget/Button;

.field final dialog:Landroid/app/AlertDialog;

.field final online:Z

.field final prefs:Landroid/content/SharedPreferences;

.field final rows:Landroid/widget/LinearLayout;

.field final selected:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final status:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/preference/PreferenceActivity;)V
    .registers 10

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    .line 13
    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->activity:Landroid/preference/PreferenceActivity;

    invoke-static {p1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->prefs:Landroid/content/SharedPreferences;

    invoke-static {p1}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->prefs:Landroid/content/SharedPreferences;

    const-string v0, "nologin"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_35

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object p1

    const-string v2, "user_session="

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_35

    const/4 p1, 0x1

    goto :goto_36

    :cond_35
    const/4 p1, 0x0

    :goto_36
    iput-boolean p1, p0, Le/e/a/NgCommentSettings$ListDialog;->online:Z

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "saveNGList"

    const-string v3, "{}"

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/NgCommentSettings;->items(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->body:Landroid/widget/LinearLayout;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v2, ""

    const/16 v3, 0xd

    invoke-static {p1, v2, v3}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->body:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Landroid/widget/ScrollView;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {p1, v2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    iput-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->rows:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->body:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const/16 v5, 0x190

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    iget-object v5, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    const/4 v6, 0x2

    div-int/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {p1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->actions:Landroid/widget/LinearLayout;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v3, "Add"

    const-string v4, "\u65b0\u589e"

    const-string v5, "\u8ffd\u52a0"

    invoke-static {v2, v5, v3, v4}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->add:Landroid/widget/Button;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v3, "Delete selected"

    const-string v4, "\u522a\u9664\u6240\u9078\u9805\u76ee"

    const-string v5, "\u9078\u629e\u3057\u305f\u9805\u76ee\u3092\u524a\u9664"

    invoke-static {v2, v5, v3, v4}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->delete:Landroid/widget/Button;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v3, "Clear selection"

    const-string v4, "\u53d6\u6d88\u9078\u53d6"

    const-string v5, "\u9078\u629e\u89e3\u9664"

    invoke-static {v2, v5, v3, v4}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->clear:Landroid/widget/Button;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->add:Landroid/widget/Button;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->delete:Landroid/widget/Button;

    iget-object v3, p0, Le/e/a/NgCommentSettings$ListDialog;->clear:Landroid/widget/Button;

    const/4 v4, 0x3

    new-array v5, v4, [Landroid/widget/Button;

    aput-object p1, v5, v1

    aput-object v2, v5, v0

    aput-object v3, v5, v6

    const/4 p1, 0x0

    :goto_f1
    if-lt p1, v4, :cond_157

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->body:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->actions:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v1, "NG comment list"

    const-string v2, "NG \u7559\u8a00\u6e05\u55ae"

    const-string v3, "NG\u30b3\u30e1\u30f3\u30c8\u30ea\u30b9\u30c8"

    invoke-static {v0, v3, v1, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->body:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v1, "Close"

    const-string v2, "\u95dc\u9589"

    const-string v3, "\u9589\u3058\u308b"

    invoke-static {v0, v3, v1, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->dialog:Landroid/app/AlertDialog;

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->dialog:Landroid/app/AlertDialog;

    new-instance v0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda2;-><init>(Le/e/a/NgCommentSettings$ListDialog;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->add:Landroid/widget/Button;

    new-instance v0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda3;-><init>(Le/e/a/NgCommentSettings$ListDialog;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->delete:Landroid/widget/Button;

    new-instance v0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda4;-><init>(Le/e/a/NgCommentSettings$ListDialog;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->clear:Landroid/widget/Button;

    new-instance v0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda5;-><init>(Le/e/a/NgCommentSettings$ListDialog;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_157
    aget-object v0, v5, p1

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->actions:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v3, v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_f1
.end method


# virtual methods
.method add()V
    .registers 10

    .line 20
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    new-instance v5, Landroid/widget/RadioGroup;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {v5, v1}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    const-string v1, "id"

    const-string v2, "command"

    const-string v3, "word"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v4

    const/4 v1, 0x0

    :goto_18
    const/4 v2, 0x3

    if-lt v1, v2, :cond_b7

    const/16 v1, 0xc8

    invoke-virtual {v5, v1}, Landroid/widget/RadioGroup;->check(I)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/EditText;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {v3, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v2, "Word, user ID or command to block"

    const-string v6, "\u5c01\u9396\u6587\u5b57\u3001\u4f7f\u7528\u8005 ID \u6216\u6307\u4ee4"

    const-string v7, "NG\u306b\u3059\u308b\u6587\u5b57\u30fb\u30e6\u30fc\u30b6\u30fcID\u30fb\u30b3\u30de\u30f3\u30c9"

    invoke-static {v1, v7, v2, v6}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v6, "Add NG rule"

    const-string v7, "\u65b0\u589e NG \u898f\u5247"

    const-string v8, "NG\u30b3\u30e1\u30f3\u30c8\u3092\u8ffd\u52a0"

    invoke-static {v2, v8, v6, v7}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v2, "Add"

    const-string v6, "\u65b0\u589e"

    const-string v7, "\u8ffd\u52a0"

    invoke-static {v1, v7, v2, v6}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v6, "Cancel"

    const-string v7, "\u53d6\u6d88"

    const-string v8, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v1, v8, v6, v7}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v6

    invoke-static {v6}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setTextColor(I)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_94

    const v0, -0x48453d

    goto :goto_97

    :cond_94
    const v0, -0x99958d

    :goto_97
    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setHintTextColor(I)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->activity:Landroid/preference/PreferenceActivity;

    invoke-static {v0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v0, -0x1

    invoke-virtual {v6, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v7, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda6;

    move-object v1, v7

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda6;-><init>(Le/e/a/NgCommentSettings$ListDialog;Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/RadioGroup;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_b7
    new-instance v2, Landroid/widget/RadioButton;

    iget-object v3, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    add-int/lit16 v3, v1, 0xc8

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setId(I)V

    iget-object v3, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    aget-object v6, v4, v1

    invoke-static {v3, v6}, Le/e/a/NgCommentSettings;->typeLabel(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v5, v2}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_18
.end method

.method applyPlayer()V
    .registers 7

    .line 17
    :try_start_0
    const-string v0, "e.e.a.g0"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/Boolean;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Le/e/a/NgCommentSettings$ListDialog;->activity:Landroid/preference/PreferenceActivity;

    aput-object v3, v1, v4

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    aput-object v3, v1, v5

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "a"

    new-array v3, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_32} :catch_33

    goto :goto_34

    :catch_33
    move-exception v0

    :goto_34
    return-void
.end method

.method confirm(Ljava/util/Set;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 21
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1d

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Le/e/a/NgCommentSettings$ListDialog;->source(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3e

    :cond_1d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v2, " rules"

    const-string v3, "\u9805"

    const-string v4, "\u4ef6"

    invoke-static {v1, v4, v2, v3}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3e
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v3, "Delete NG rules?"

    const-string v4, "\u522a\u9664 NG \u898f\u5247\uff1f"

    const-string v5, "NG\u8a2d\u5b9a\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {v2, v5, v3, v4}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v2, "Delete"

    const-string v3, "\u522a\u9664"

    const-string v4, "\u524a\u9664"

    invoke-static {v1, v4, v2, v3}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, p1}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda7;-><init>(Le/e/a/NgCommentSettings$ListDialog;Ljava/util/Set;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v1, "Cancel"

    const-string v2, "\u53d6\u6d88"

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v0, v3, v1, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-NgCommentSettings$ListDialog(Landroid/content/DialogInterface;)V
    .registers 2

    .line 13
    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->active:Le/e/a/NetworkTask;

    if-eqz p1, :cond_9

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->active:Le/e/a/NetworkTask;

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_9
    return-void
.end method

.method synthetic lambda$1$e-e-a-NgCommentSettings$ListDialog(Landroid/view/View;)V
    .registers 2

    .line 13
    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->add()V

    return-void
.end method

.method synthetic lambda$10$e-e-a-NgCommentSettings$ListDialog(Ljava/util/Set;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 21
    const/4 p2, 0x0

    invoke-virtual {p0, p2, p1}, Le/e/a/NgCommentSettings$ListDialog;->mutate(Lorg/json/JSONObject;Ljava/util/Set;)V

    return-void
.end method

.method synthetic lambda$11$e-e-a-NgCommentSettings$ListDialog(Lorg/json/JSONObject;Le/e/a/NetworkTask;Ljava/util/Set;)V
    .registers 12

    .line 23
    const-string v0, "source"

    const-string v1, "type"

    const-string v2, "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client"

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz p1, :cond_2b

    :try_start_a
    iget-boolean p3, p0, Le/e/a/NgCommentSettings$ListDialog;->online:Z

    if-eqz p3, :cond_1f

    const-string p3, "POST"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Le/e/a/NgCommentData;->form(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, p3, v3, p2, v0}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;Ljava/lang/String;)Lorg/json/JSONObject;

    :cond_1f
    iget-object p3, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-static {p3, p1}, Le/e/a/NgCommentData;->add(Lorg/json/JSONArray;Lorg/json/JSONObject;)Lorg/json/JSONArray;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->save()V

    goto :goto_43

    :cond_2b
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    :goto_31
    iget-object v6, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lt v5, v6, :cond_80

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-nez p3, :cond_45

    :goto_43
    const/4 v3, 0x0

    goto :goto_99

    :cond_45
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/json/JSONObject;

    invoke-virtual {p2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v5

    if-nez v5, :cond_7a

    iget-boolean v5, p0, Le/e/a/NgCommentSettings$ListDialog;->online:Z

    if-eqz v5, :cond_66

    const-string v5, "DELETE"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Le/e/a/NgCommentData;->form(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v5, v3, p2, v6}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;Ljava/lang/String;)Lorg/json/JSONObject;

    :cond_66
    iget-object v5, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-static {p3}, Le/e/a/NgCommentData;->key(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p3

    invoke-static {v5, p3}, Le/e/a/NgCommentData;->remove(Lorg/json/JSONArray;Ljava/util/Set;)Lorg/json/JSONArray;

    move-result-object p3

    iput-object p3, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->save()V

    goto :goto_3d

    :cond_7a
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1

    :cond_80
    iget-object v6, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {v6, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_95

    invoke-static {v6}, Le/e/a/NgCommentData;->key(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {p3, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_95

    invoke-virtual {p1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_95} :catch_98

    :cond_95
    add-int/lit8 v5, v5, 0x1

    goto :goto_31

    :catch_98
    move-exception p1

    :goto_99
    # getter for: Le/e/a/NgCommentSettings;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/NgCommentSettings;->access$1()Landroid/os/Handler;

    move-result-object p1

    new-instance p3, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda8;

    invoke-direct {p3, p0, p2, v3}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda8;-><init>(Le/e/a/NgCommentSettings$ListDialog;Le/e/a/NetworkTask;Z)V

    invoke-virtual {p1, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$12$e-e-a-NgCommentSettings$ListDialog(Le/e/a/NetworkTask;Z)V
    .registers 6

    .line 23
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->applyPlayer()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Le/e/a/NgCommentSettings$ListDialog;->state(ZZ)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iput-boolean p1, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->render()V

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    if-eqz p2, :cond_2c

    iget-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v0, "Some changes could not be saved. Only successful changes were applied"

    const-string v1, "\u90e8\u5206\u8b8a\u66f4\u7121\u6cd5\u5132\u5b58\uff0c\u50c5\u5957\u7528\u6210\u529f\u7684\u8b8a\u66f4"

    const-string v2, "\u4e00\u90e8\u306e\u5909\u66f4\u3092\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u4fdd\u5b58\u306b\u6210\u529f\u3057\u305f\u5909\u66f4\u306e\u307f\u53cd\u6620\u3057\u307e\u3057\u305f"

    invoke-static {p2, v2, v0, v1}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_31

    :cond_2c
    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_31
    return-void
.end method

.method synthetic lambda$2$e-e-a-NgCommentSettings$ListDialog(Landroid/view/View;)V
    .registers 3

    .line 13
    new-instance p1, Ljava/util/HashSet;

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-direct {p1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, p1}, Le/e/a/NgCommentSettings$ListDialog;->confirm(Ljava/util/Set;)V

    return-void
.end method

.method synthetic lambda$3$e-e-a-NgCommentSettings$ListDialog(Landroid/view/View;)V
    .registers 2

    .line 13
    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->render()V

    return-void
.end method

.method synthetic lambda$4$e-e-a-NgCommentSettings$ListDialog(Ljava/lang/String;Landroid/view/View;)V
    .registers 3

    .line 18
    iget-boolean p2, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    if-eqz p2, :cond_5

    return-void

    :cond_5
    iget-boolean p2, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    if-eqz p2, :cond_1a

    iget-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_16

    iget-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_16
    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->render()V

    goto :goto_21

    :cond_1a
    invoke-static {p1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/NgCommentSettings$ListDialog;->confirm(Ljava/util/Set;)V

    :goto_21
    return-void
.end method

.method synthetic lambda$5$e-e-a-NgCommentSettings$ListDialog(Ljava/lang/String;Landroid/view/View;)Z
    .registers 4

    .line 18
    iget-boolean p2, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    const/4 v0, 0x1

    if-eqz p2, :cond_6

    return v0

    :cond_6
    iput-boolean v0, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    iget-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_15

    iget-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_15
    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->render()V

    return v0
.end method

.method synthetic lambda$6$e-e-a-NgCommentSettings$ListDialog(Le/e/a/NetworkTask;)V
    .registers 6

    .line 19
    const-string v0, "items"

    :try_start_2
    const-string v1, "https://nvapi.nicovideo.jp/v1/users/me/ng-comments/client"

    const-string v2, "GET"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_2a

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    if-eqz v2, :cond_2a

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    # getter for: Le/e/a/NgCommentSettings;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/NgCommentSettings;->access$1()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1, v0}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda0;-><init>(Le/e/a/NgCommentSettings$ListDialog;Le/e/a/NetworkTask;Lorg/json/JSONArray;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3d

    :cond_2a
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_30} :catch_30

    :catch_30
    move-exception v0

    # getter for: Le/e/a/NgCommentSettings;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/NgCommentSettings;->access$1()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda1;-><init>(Le/e/a/NgCommentSettings$ListDialog;Le/e/a/NetworkTask;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_3d
    return-void
.end method

.method synthetic lambda$7$e-e-a-NgCommentSettings$ListDialog(Le/e/a/NetworkTask;Lorg/json/JSONArray;)V
    .registers 3

    .line 19
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    iput-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->save()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Le/e/a/NgCommentSettings$ListDialog;->state(ZZ)V

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->render()V

    return-void
.end method

.method synthetic lambda$8$e-e-a-NgCommentSettings$ListDialog(Le/e/a/NetworkTask;)V
    .registers 6

    .line 19
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-eqz p1, :cond_7

    return-void

    :cond_7
    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Le/e/a/NgCommentSettings$ListDialog;->state(ZZ)V

    iget-object p1, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v1, "Unable to refresh. Showing the saved list"

    const-string v2, "\u7121\u6cd5\u66f4\u65b0\uff0c\u986f\u793a\u5df2\u5132\u5b58\u6e05\u55ae"

    const-string v3, "\u66f4\u65b0\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u4fdd\u5b58\u6e08\u307f\u306e\u30ea\u30b9\u30c8\u3092\u8868\u793a\u3057\u3066\u3044\u307e\u3059"

    invoke-static {v0, v3, v1, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$9$e-e-a-NgCommentSettings$ListDialog(Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/RadioGroup;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 8

    .line 20
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string p3, "Enter a value"

    const-string p4, "\u8acb\u8f38\u5165\u6587\u5b57"

    const-string p5, "\u6587\u5b57\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p2, p5, p3, p4}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_22
    :try_start_22
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "type"

    invoke-virtual {p3}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p3

    add-int/lit16 p3, p3, -0xc8

    aget-object p2, p2, p3

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "source"

    invoke-virtual {p2, p3, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    iget-object p3, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-static {p3, p2}, Le/e/a/NgCommentData;->contains(Lorg/json/JSONArray;Lorg/json/JSONObject;)Z

    move-result p3

    if-eqz p3, :cond_53

    iget-object p2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string p3, "\u3059\u3067\u306b\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u3059"

    const-string p4, "Already registered"

    const-string p5, "\u5df2\u7d93\u767b\u9304"

    invoke-static {p2, p3, p4, p5}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_53
    invoke-virtual {p4}, Landroid/app/AlertDialog;->dismiss()V

    const/4 p1, 0x0

    invoke-virtual {p0, p2, p1}, Le/e/a/NgCommentSettings$ListDialog;->mutate(Lorg/json/JSONObject;Ljava/util/Set;)V
    :try_end_5a
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_5a} :catch_5b

    goto :goto_5c

    :catch_5b
    move-exception p1

    :goto_5c
    return-void
.end method

.method mutate(Lorg/json/JSONObject;Ljava/util/Set;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 23
    iget-boolean v0, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Le/e/a/NgCommentSettings$ListDialog;->state(ZZ)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v2, "Saving\u2026"

    const-string v3, "\u5132\u5b58\u4e2d\u2026"

    const-string v4, "\u4fdd\u5b58\u4e2d\u2026"

    invoke-static {v1, v4, v2, v3}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->active:Le/e/a/NetworkTask;

    # getter for: Le/e/a/NgCommentSettings;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/NgCommentSettings;->access$0()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0, p1, v0, p2}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda9;-><init>(Le/e/a/NgCommentSettings$ListDialog;Lorg/json/JSONObject;Le/e/a/NetworkTask;Ljava/util/Set;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method refresh()V
    .registers 5

    .line 19
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Le/e/a/NgCommentSettings$ListDialog;->state(ZZ)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->status:Landroid/widget/TextView;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v2, "\u66f4\u65b0\u4e2d\u2026"

    const-string v3, "Refreshing\u2026"

    invoke-static {v1, v2, v3, v2}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->active:Le/e/a/NetworkTask;

    # getter for: Le/e/a/NgCommentSettings;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/NgCommentSettings;->access$0()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0, v0}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda10;-><init>(Le/e/a/NgCommentSettings$ListDialog;Le/e/a/NetworkTask;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method render()V
    .registers 8

    .line 18
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->add:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v1, :cond_11

    const/16 v1, 0x8

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->delete:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    if-eqz v1, :cond_1d

    const/4 v1, 0x0

    goto :goto_1f

    :cond_1d
    const/16 v1, 0x8

    :goto_1f
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->clear:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    if-eqz v1, :cond_29

    const/4 v2, 0x0

    :cond_29
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->delete:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    if-nez v1, :cond_3c

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3c

    const/4 v1, 0x1

    goto :goto_3d

    :cond_3c
    const/4 v1, 0x0

    :goto_3d
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_61

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->rows:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v4, "No NG rules"

    const-string v5, "\u5c1a\u7121 NG \u898f\u5247"

    const-string v6, "\u767b\u9332\u3055\u308c\u305fNG\u8a2d\u5b9a\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v2, v6, v4, v5}, Le/e/a/NgCommentSettings;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v4, 0xe

    invoke-static {v1, v2, v4}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_61
    :goto_61
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt v3, v0, :cond_6a

    return-void

    :cond_6a
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_73

    goto :goto_e4

    :cond_73
    invoke-static {v0}, Le/e/a/NgCommentData;->key(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    invoke-static {v2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    iget-object v4, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    new-instance v5, Ljava/lang/StringBuilder;

    iget-boolean v6, p0, Le/e/a/NgCommentSettings$ListDialog;->choosing:Z

    if-eqz v6, :cond_93

    iget-object v6, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {v6, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_90

    const-string v6, "\u2713 "

    goto :goto_95

    :cond_90
    const-string v6, "\u25a1 "

    goto :goto_95

    :cond_93
    const-string v6, ""

    :goto_95
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "source"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v4, v5, v6}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v4, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    iget-object v5, p0, Le/e/a/NgCommentSettings$ListDialog;->context:Landroid/content/Context;

    const-string v6, "type"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Le/e/a/NgCommentSettings;->typeLabel(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v5, 0xc

    invoke-static {v4, v0, v5}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0, v1}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda11;-><init>(Le/e/a/NgCommentSettings$ListDialog;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0, v1}, Le/e/a/NgCommentSettings$ListDialog$$ExternalSyntheticLambda12;-><init>(Le/e/a/NgCommentSettings$ListDialog;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->rows:Landroid/widget/LinearLayout;

    invoke-static {v0}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    :goto_e4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_61
.end method

.method save()V
    .registers 4

    .line 16
    :try_start_0
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "saveNGList"

    iget-object v2, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-static {v2}, Le/e/a/NgCommentData;->stored(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception v0

    :goto_17
    return-void
.end method

.method show()V
    .registers 2

    .line 14
    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->dialog:Landroid/app/AlertDialog;

    invoke-static {v0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->render()V

    iget-boolean v0, p0, Le/e/a/NgCommentSettings$ListDialog;->online:Z

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Le/e/a/NgCommentSettings$ListDialog;->refresh()V

    :cond_f
    return-void
.end method

.method source(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    .line 22
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lt v0, v1, :cond_c

    const-string p1, ""

    return-object p1

    :cond_c
    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->data:Lorg/json/JSONArray;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_25

    invoke-static {v1}, Le/e/a/NgCommentData;->key(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    const-string p1, "source"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method state(ZZ)V
    .registers 7

    .line 15
    iput-boolean p1, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->add:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->clear:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    xor-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->delete:Landroid/widget/Button;

    iget-boolean v1, p0, Le/e/a/NgCommentSettings$ListDialog;->busy:Z

    const/4 v3, 0x0

    if-nez v1, :cond_24

    iget-object v1, p0, Le/e/a/NgCommentSettings$ListDialog;->selected:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_24

    const/4 v1, 0x1

    goto :goto_25

    :cond_24
    const/4 v1, 0x0

    :goto_25
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->dialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_30

    if-eqz p2, :cond_30

    const/4 v1, 0x0

    goto :goto_31

    :cond_30
    const/4 v1, 0x1

    :goto_31
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCancelable(Z)V

    iget-object v0, p0, Le/e/a/NgCommentSettings$ListDialog;->dialog:Landroid/app/AlertDialog;

    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    if-eqz p1, :cond_40

    if-eqz p2, :cond_40

    const/4 v2, 0x0

    :cond_40
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method
