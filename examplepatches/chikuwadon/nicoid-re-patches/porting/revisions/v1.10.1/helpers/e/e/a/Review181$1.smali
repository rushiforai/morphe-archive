.class Le/e/a/Review181$1;
.super Ljava/lang/Object;
.source "Review181.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Review181;->seekSlider(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$c:Landroid/content/Context;

.field private final synthetic val$label:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/content/Context;)V
    .registers 3

    .line 47
    iput-object p1, p0, Le/e/a/Review181$1;->val$label:Landroid/widget/TextView;

    iput-object p2, p0, Le/e/a/Review181$1;->val$c:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    .line 47
    iget-object p1, p0, Le/e/a/Review181$1;->val$label:Landroid/widget/TextView;

    iget-object p3, p0, Le/e/a/Review181$1;->val$c:Landroid/content/Context;

    invoke-static {p2}, Le/e/a/SeekRules;->seconds(I)I

    move-result p2

    # invokes: Le/e/a/Review181;->seekLabel(Landroid/content/Context;I)Ljava/lang/String;
    invoke-static {p3, p2}, Le/e/a/Review181;->access$0(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 47
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 47
    return-void
.end method
