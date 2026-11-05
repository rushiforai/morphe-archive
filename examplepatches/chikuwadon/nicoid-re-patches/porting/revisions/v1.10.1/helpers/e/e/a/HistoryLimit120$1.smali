.class Le/e/a/HistoryLimit120$1;
.super Ljava/lang/Object;
.source "HistoryLimit120.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/HistoryLimit120;->settings(Landroid/app/Activity;Landroid/preference/PreferenceGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$value:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/content/Context;)V
    .registers 3

    .line 59
    iput-object p1, p0, Le/e/a/HistoryLimit120$1;->val$value:Landroid/widget/TextView;

    iput-object p2, p0, Le/e/a/HistoryLimit120$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    .line 61
    iget-object p1, p0, Le/e/a/HistoryLimit120$1;->val$value:Landroid/widget/TextView;

    iget-object p3, p0, Le/e/a/HistoryLimit120$1;->val$context:Landroid/content/Context;

    invoke-static {p2}, Le/e/a/HistoryLimit120;->limit(I)I

    move-result p2

    # invokes: Le/e/a/HistoryLimit120;->label(Landroid/content/Context;I)Ljava/lang/String;
    invoke-static {p3, p2}, Le/e/a/HistoryLimit120;->access$0(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 63
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 64
    return-void
.end method
