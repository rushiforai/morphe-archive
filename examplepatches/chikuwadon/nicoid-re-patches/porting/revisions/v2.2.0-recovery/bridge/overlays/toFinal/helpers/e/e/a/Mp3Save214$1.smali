.class Le/e/a/Mp3Save214$1;
.super Ljava/lang/Object;
.source "Mp3Save214.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Mp3Save214;->chooseFormat(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$context:Landroid/content/Context;

.field private final synthetic val$detailCaption:Landroid/widget/TextView;

.field private final synthetic val$heights:[Ljava/lang/String;

.field private final synthetic val$quality:Landroid/widget/Spinner;

.field private final synthetic val$rates:[Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/Spinner;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 6

    .line 73
    iput-object p1, p0, Le/e/a/Mp3Save214$1;->val$detailCaption:Landroid/widget/TextView;

    iput-object p2, p0, Le/e/a/Mp3Save214$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/Mp3Save214$1;->val$quality:Landroid/widget/Spinner;

    iput-object p4, p0, Le/e/a/Mp3Save214$1;->val$rates:[Ljava/lang/String;

    iput-object p5, p0, Le/e/a/Mp3Save214$1;->val$heights:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    const/4 p1, 0x1

    if-ne p3, p1, :cond_0

    move p2, p1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 76
    :goto_0
    iget-object p3, p0, Le/e/a/Mp3Save214$1;->val$detailCaption:Landroid/widget/TextView;

    iget-object p4, p0, Le/e/a/Mp3Save214$1;->val$context:Landroid/content/Context;

    if-eqz p2, :cond_1

    const-string p5, "Audio quality (bitrate)"

    const-string/jumbo v0, "\u97f3\u8cea\uff08\u4f4d\u5143\u7387\uff09"

    const-string/jumbo v1, "\u97f3\u8cea\uff08\u30d3\u30c3\u30c8\u30ec\u30fc\u30c8\uff09"

    goto :goto_1

    :cond_1
    const-string p5, "Video quality"

    const-string/jumbo v0, "\u5f71\u7247\u756b\u8cea"

    const-string/jumbo v1, "\u753b\u8cea"

    :goto_1
    invoke-static {p4, v1, p5, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object p3, p0, Le/e/a/Mp3Save214$1;->val$quality:Landroid/widget/Spinner;

    new-instance p4, Landroid/widget/ArrayAdapter;

    iget-object p5, p0, Le/e/a/Mp3Save214$1;->val$context:Landroid/content/Context;

    if-eqz p2, :cond_2

    .line 78
    iget-object v0, p0, Le/e/a/Mp3Save214$1;->val$rates:[Ljava/lang/String;

    goto :goto_2

    :cond_2
    iget-object v0, p0, Le/e/a/Mp3Save214$1;->val$heights:[Ljava/lang/String;

    :goto_2
    const v1, 0x1090009

    invoke-direct {p4, p5, v1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 77
    invoke-virtual {p3, p4}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    if-eqz p2, :cond_3

    .line 79
    iget-object p0, p0, Le/e/a/Mp3Save214$1;->val$quality:Landroid/widget/Spinner;

    invoke-virtual {p0, p1}, Landroid/widget/Spinner;->setSelection(I)V

    :cond_3
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    return-void
.end method
