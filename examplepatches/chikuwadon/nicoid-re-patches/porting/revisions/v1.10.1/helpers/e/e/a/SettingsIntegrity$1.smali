.class Le/e/a/SettingsIntegrity$1;
.super Ljava/lang/Object;
.source "SettingsIntegrity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SettingsIntegrity;->comments(Landroid/preference/PreferenceActivity;Landroid/preference/PreferenceGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$label:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .registers 2

    .line 31
    iput-object p1, p0, Le/e/a/SettingsIntegrity$1;->val$label:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    .line 31
    iget-object p1, p0, Le/e/a/SettingsIntegrity$1;->val$label:Landroid/widget/TextView;

    mul-int/lit16 p2, p2, 0x1f4

    # invokes: Le/e/a/SettingsIntegrity;->limitValue(I)Ljava/lang/String;
    invoke-static {p2}, Le/e/a/SettingsIntegrity;->access$0(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 31
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 31
    return-void
.end method
