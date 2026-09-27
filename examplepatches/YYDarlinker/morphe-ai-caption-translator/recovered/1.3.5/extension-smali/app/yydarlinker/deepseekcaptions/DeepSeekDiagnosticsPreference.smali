.class public final Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;
.super Landroid/preference/Preference;
.source "DeepSeekDiagnosticsPreference.java"


# direct methods
.method public static synthetic $r8$lambda$1BI59hQBNHJtvAuQt8eDXP_0NJM(Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/Button;Landroid/view/View;)V
    .registers 6

    invoke-direct/range {p0 .. p5}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->lambda$onCreateView$11(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/Button;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 9
    invoke-direct {p0, p1}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->init()V

    return-void
.end method

.method private static copyPages(Landroid/content/Context;Ljava/lang/String;)V
    .registers 9

    .line 68
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0xea5f

    add-int/2addr v0, v1

    const v1, 0xea60

    div-int/2addr v0, v1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v3, 0x0

    :goto_f
    if-ge v3, v0, :cond_32

    .line 69
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u590d\u5236\u7b2c "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " / "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " \u90e8\u5206"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    move v3, v5

    goto :goto_f

    .line 70
    :cond_32
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "Android 9 \u53ca\u4ee5\u4e0b\uff1a\u5206\u6bb5\u590d\u5236\u5b8c\u6574\u8bca\u65ad"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;

    invoke-direct {v4, p0, v0, p1, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;-><init>(Landroid/content/Context;ILjava/lang/String;I)V

    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 74
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private init()V
    .registers 2

    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->setPersistent(Z)V

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->setSelectable(Z)V

    return-void
.end method

.method static synthetic lambda$copyPages$12(Landroid/content/Context;ILjava/lang/String;ILandroid/content/DialogInterface;I)V
    .registers 9

    .line 71
    const-string p4, "clipboard"

    invoke-virtual {p0, p4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/content/ClipboardManager;

    if-eqz p4, :cond_38

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Caption diagnostic "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v1, p5, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    mul-int v0, p5, p3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    mul-int/2addr v1, p3

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    invoke-virtual {p2, v0, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p4, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 73
    :cond_38
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "\u5df2\u590d\u5236\u7b2c "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p2, 0x1

    add-int/2addr p5, p2

    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " \u90e8\u5206\uff1b\u518d\u6b21\u4fdd\u5b58\u53ef\u9009\u62e9\u5176\u4f59\u90e8\u5206"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$onCreateView$0()V
    .registers 0

    return-void
.end method

.method static synthetic lambda$onCreateView$1(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/ScrollView;Landroid/view/View;)V
    .registers 4

    .line 25
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->uiText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    invoke-virtual {p2, p0, p0}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method static synthetic lambda$onCreateView$10(Landroid/content/Context;Landroid/widget/TextView;Landroid/view/View;)V
    .registers 6

    .line 36
    const-string p2, "clear_diagnostics"

    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\u6e05\u7a7a\u672c\u5730\u8bca\u65ad\u8bb0\u5f55\uff1f\u4e0d\u4f1a\u6e05\u9664 API \u8bbe\u7f6e\u6216\u7ffb\u8bd1\u7f13\u5b58\u3002"

    .line 37
    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 38
    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v2, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda4;-><init>(Landroid/content/Context;Landroid/widget/TextView;)V

    .line 35
    invoke-static {p0, v0, v1, p2, v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs;->confirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/app/Dialog;

    return-void
.end method

.method private synthetic lambda$onCreateView$11(Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/Button;Landroid/view/View;)V
    .registers 7

    .line 48
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result p5

    const/4 v0, 0x0

    if-eqz p5, :cond_9

    const/4 p5, 0x1

    goto :goto_a

    :cond_9
    move p5, v0

    :goto_a
    if-eqz p5, :cond_13

    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->uiText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_13
    if-eqz p5, :cond_16

    goto :goto_18

    :cond_16
    const/16 v0, 0x8

    :goto_18
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p5, :cond_24

    const-string p2, "\u6536\u8d77"

    goto :goto_26

    :cond_24
    const-string p2, "\u5c55\u5f00"

    :goto_26
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    if-eqz p5, :cond_36

    const-string p1, "\u6536\u8d77\u5b57\u5e55\u8bca\u65ad"

    goto :goto_38

    :cond_36
    const-string p1, "\u5c55\u5f00\u5b57\u5e55\u8bca\u65ad"

    :goto_38
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$onCreateView$2()V
    .registers 0

    return-void
.end method

.method static synthetic lambda$onCreateView$3(Landroid/content/Context;Landroid/widget/TextView;Landroid/view/View;)V
    .registers 4

    .line 26
    const-string p2, "clipboard"

    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/ClipboardManager;

    if-eqz p2, :cond_21

    const-string v0, "AI \u5b57\u5e55\u8bca\u65ad"

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    const-string p1, "\u8bca\u65ad\u5df2\u590d\u5236"

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_21
    return-void
.end method

.method static synthetic lambda$onCreateView$4()V
    .registers 0

    return-void
.end method

.method static synthetic lambda$onCreateView$5(Landroid/widget/Button;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setEnabled(Z)V

    if-nez p1, :cond_a

    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->copyPages(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :cond_a
    invoke-static {p2, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method static synthetic lambda$onCreateView$6(Landroid/content/Context;Landroid/widget/Button;)V
    .registers 6

    .line 30
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->fullText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 31
    :try_start_4
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->saveReport(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_8} :catch_9

    goto :goto_20

    :catch_9
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u4fdd\u5b58\u5931\u8d25\uff1a"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 32
    :goto_20
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda1;

    invoke-direct {v3, p1, v1, p0, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda1;-><init>(Landroid/widget/Button;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$onCreateView$7(Landroid/widget/Button;Landroid/content/Context;Landroid/view/View;)V
    .registers 4

    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p2}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance p2, Ljava/lang/Thread;

    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;Landroid/widget/Button;)V

    const-string p0, "caption-export"

    invoke-direct {p2, v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 33
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static synthetic lambda$onCreateView$8()V
    .registers 0

    return-void
.end method

.method static synthetic lambda$onCreateView$9(Landroid/content/Context;Landroid/widget/TextView;)V
    .registers 2

    .line 39
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->clear(Landroid/content/Context;)V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnostics;->uiText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static saveReport(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    const/4 v2, 0x0

    if-ge v0, v1, :cond_8

    return-object v2

    .line 52
    :cond_8
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "caption-diagnostics-1.3.5-"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMdd-HHmmss"

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v3, v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".txt"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 54
    const-string v3, "_display_name"

    invoke-virtual {v0, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const-string v3, "mime_type"

    const-string v4, "text/plain"

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string v3, "relative_path"

    sget-object v4, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x1

    .line 57
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "is_pending"

    invoke-virtual {v0, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 58
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    .line 59
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_b8

    .line 62
    :try_start_5d
    invoke-virtual {p0, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v6
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_61} :catch_ae

    if-eqz v6, :cond_9b

    :try_start_63
    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v7}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v6, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_6c
    .catchall {:try_start_63 .. :try_end_6c} :catchall_99

    if-eqz v6, :cond_71

    :try_start_6e
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V

    .line 63
    :cond_71
    invoke-virtual {v0}, Landroid/content/ContentValues;->clear()V

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p0, v4, v0, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1
    :try_end_80
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_80} :catch_ae

    if-ne p1, v3, :cond_91

    .line 65
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "\u5df2\u4fdd\u5b58\u5230 Download/"

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 63
    :cond_91
    :try_start_91
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Download was not published"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_91 .. :try_end_99} :catch_ae

    :catchall_99
    move-exception p1

    goto :goto_a3

    .line 62
    :cond_9b
    :try_start_9b
    new-instance p1, Ljava/io/IOException;

    const-string v0, "No output stream"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_a3
    .catchall {:try_start_9b .. :try_end_a3} :catchall_99

    :goto_a3
    if-eqz v6, :cond_ad

    :try_start_a5
    invoke-virtual {v6}, Ljava/io/OutputStream;->close()V
    :try_end_a8
    .catchall {:try_start_a5 .. :try_end_a8} :catchall_a9

    goto :goto_ad

    :catchall_a9
    move-exception v0

    :try_start_aa
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_ad
    :goto_ad
    throw p1
    :try_end_ae
    .catch Ljava/lang/Exception; {:try_start_aa .. :try_end_ae} :catch_ae

    :catch_ae
    move-exception p1

    .line 64
    invoke-virtual {p0, v4, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw p0

    .line 60
    :cond_b8
    new-instance p0, Ljava/io/IOException;

    const-string p1, "No download destination"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method protected onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 16

    .line 15
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->getContext()Landroid/content/Context;

    move-result-object v4

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->row(Landroid/view/View;)V

    .line 16
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 17
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v5, "\u5b57\u5e55\u8bca\u65ad"

    invoke-static {v3, v5}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->title(Landroid/widget/TextView;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x0

    const/4 v6, -0x2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v3, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move v2, v5

    .line 18
    new-instance v5, Landroid/widget/Button;

    const/4 v3, 0x0

    const v8, 0x101032b

    invoke-direct {v5, v4, v3, v8}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->button(Landroid/widget/Button;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v8, "\u5c55\u5f00"

    invoke-static {v3, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v3, "ai_diagnostics_toggle"

    invoke-virtual {v5, v3}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 19
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v8, "\u957f\u65f6\u95f4\u6d4b\u8bd5\u8bf7\u5f00\u542f\u663e\u793a\u6587\u672c\u8c03\u8bd5\uff1b\u4fdd\u5b58\u5b8c\u6574\u8bca\u65ad\u53ef\u5bfc\u51fa\u6700\u8fd1 24 \u5c0f\u65f6\u8bb0\u5f55\uff08\u5bb9\u91cf\u4e0a\u9650 16 MiB\uff09\u3002\u4e0b\u65b9\u4ec5\u663e\u793a\u6700\u8fd1\u6458\u8981\u3002"

    invoke-static {v3, v8}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move v1, v2

    .line 20
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 21
    new-instance v3, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;

    invoke-direct {v3, v4}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;-><init>(Landroid/content/Context;)V

    move-object v8, v3

    .line 22
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v9, "ai_diagnostics_body"

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->caption(Landroid/widget/TextView;)V

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    const/high16 v9, 0x41400000    # 12.0f

    invoke-static {v4, v9}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v10

    const/high16 v11, 0x41200000    # 10.0f

    invoke-static {v4, v11}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-static {v4, v9}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v9

    invoke-static {v4, v11}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v11

    invoke-virtual {v3, v10, v12, v9, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 23
    new-instance v9, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$1;

    invoke-direct {v9, p0, v4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$1;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;Landroid/content/Context;)V

    .line 24
    const-string v10, "ai_diagnostics_scroll"

    invoke-virtual {v9, v10}, Landroid/widget/ScrollView;->setTag(Ljava/lang/Object;)V

    invoke-static {v4, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->surface(Landroid/content/Context;Z)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/ScrollView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v9, v1}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    invoke-virtual {v9, v0}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, -0x1

    invoke-direct {v10, v11, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v3, v10}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    const-string v10, "\u5237\u65b0"

    invoke-static {v4, v10}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    new-instance v12, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda5;

    invoke-direct {v12}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda5;-><init>()V

    invoke-static {v4, v10, v1, v1, v12}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->action(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v10

    const-string v12, "ai_diagnostics_refresh"

    invoke-virtual {v10, v12}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    new-instance v12, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;

    invoke-direct {v12, v3, v4, v9}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;-><init>(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/ScrollView;)V

    invoke-virtual {v10, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v10, v12}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    const-string v10, "\u590d\u5236"

    invoke-static {v4, v10}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->localize(Landroid/content/Context;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    new-instance v12, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda7;

    invoke-direct {v12}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda7;-><init>()V

    invoke-static {v4, v10, v1, v1, v12}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->action(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v10

    const-string v12, "ai_diagnostics_copy"

    invoke-virtual {v10, v12}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    new-instance v12, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda8;

    invoke-direct {v12, v4, v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda8;-><init>(Landroid/content/Context;Landroid/widget/TextView;)V

    invoke-virtual {v10, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v10, v12}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    new-instance v10, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;

    invoke-direct {v10, v4}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;-><init>(Landroid/content/Context;)V

    .line 28
    new-instance v12, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda9;

    invoke-direct {v12}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda9;-><init>()V

    const-string v13, "\u4fdd\u5b58\u5b8c\u6574\u8bca\u65ad"

    invoke-static {v4, v13, v1, v1, v12}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->action(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v12

    const-string v13, "ai_diagnostics_save"

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v13, v1, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v12, v13}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    new-instance v7, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda10;

    invoke-direct {v7, v12, v4}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda10;-><init>(Landroid/widget/Button;Landroid/content/Context;)V

    invoke-virtual {v12, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    const-string v7, "clear_diagnostics"

    invoke-static {v4, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionStrings;->settings(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v12, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda11;

    invoke-direct {v12}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda11;-><init>()V

    invoke-static {v4, v7, v1, v0, v12}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->action(Landroid/content/Context;Ljava/lang/String;ZZLjava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    const-string v7, "ai_diagnostics_clear"

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 35
    new-instance v7, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda12;

    invoke-direct {v7, v4, v3}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda12;-><init>(Landroid/content/Context;Landroid/widget/TextView;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    sget-object v7, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 41
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x43700000    # 240.0f

    invoke-static {v4, v12}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v12

    invoke-direct {v7, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v9, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v7, 0x41000000    # 8.0f

    .line 42
    invoke-static {v4, v7}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v7

    .line 43
    invoke-virtual {v8, v1, v7, v1, v1}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->setPadding(IIII)V

    invoke-virtual {v10, v1, v7, v1, v1}, Lapp/yydarlinker/deepseekcaptions/ProfileActionStrip;->setPadding(IIII)V

    .line 44
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v11, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v11, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v10, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v11, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v7, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 47
    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 48
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda13;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda13;-><init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;Landroid/widget/LinearLayout;Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/Button;)V

    invoke-virtual {v5, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method
