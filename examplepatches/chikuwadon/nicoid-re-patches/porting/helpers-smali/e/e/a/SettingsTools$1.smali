.class Le/e/a/SettingsTools$1;
.super Ljava/lang/Object;
.source "SettingsTools.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SettingsTools;->lambda$0(Landroid/preference/PreferenceActivity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$snapshot:Le/e/a/SettingsTools$Node;


# direct methods
.method constructor <init>(Le/e/a/SettingsTools$Node;)V
    .registers 2

    .line 5
    iput-object p1, p0, Le/e/a/SettingsTools$1;->val$snapshot:Le/e/a/SettingsTools$Node;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    .line 5
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 5
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 5
    iget-object p2, p0, Le/e/a/SettingsTools$1;->val$snapshot:Le/e/a/SettingsTools$Node;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    sget-object p3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p2, p1, p3}, Le/e/a/SettingsTools$Node;->restore(Ljava/lang/String;Z)Z

    return-void
.end method
