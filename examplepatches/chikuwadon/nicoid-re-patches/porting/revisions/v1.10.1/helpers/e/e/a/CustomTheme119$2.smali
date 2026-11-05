.class Le/e/a/CustomTheme119$2;
.super Ljava/lang/Object;
.source "CustomTheme119.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CustomTheme119;->picker(Landroid/app/Activity;Landroid/widget/EditText;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$bars:[Landroid/widget/SeekBar;

.field private final synthetic val$preview:Landroid/widget/EditText;

.field private final synthetic val$values:[Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/EditText;[Landroid/widget/SeekBar;[Landroid/widget/TextView;)V
    .registers 4

    .line 24
    iput-object p1, p0, Le/e/a/CustomTheme119$2;->val$preview:Landroid/widget/EditText;

    iput-object p2, p0, Le/e/a/CustomTheme119$2;->val$bars:[Landroid/widget/SeekBar;

    iput-object p3, p0, Le/e/a/CustomTheme119$2;->val$values:[Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    .line 24
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 24
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 6

    .line 24
    :try_start_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result p1

    iget-object p2, p0, Le/e/a/CustomTheme119$2;->val$preview:Landroid/widget/EditText;

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    iget-object p2, p0, Le/e/a/CustomTheme119$2;->val$preview:Landroid/widget/EditText;

    invoke-static {p1}, Le/e/a/CustomTheme119;->dark(I)Z

    move-result p3

    if-eqz p3, :cond_17

    const/4 p3, -0x1

    goto :goto_19

    :cond_17
    const/high16 p3, -0x1000000

    :goto_19
    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setTextColor(I)V

    const/4 p2, 0x0

    :goto_1d
    const/4 p3, 0x3

    if-lt p2, p3, :cond_21

    goto :goto_60

    :cond_21
    iget-object p3, p0, Le/e/a/CustomTheme119$2;->val$bars:[Landroid/widget/SeekBar;

    aget-object p3, p3, p2

    mul-int/lit8 p4, p2, 0x8

    rsub-int/lit8 p4, p4, 0x10

    shr-int p4, p1, p4

    and-int/lit16 p4, p4, 0xff

    invoke-virtual {p3, p4}, Landroid/widget/SeekBar;->setProgress(I)V

    iget-object p3, p0, Le/e/a/CustomTheme119$2;->val$values:[Landroid/widget/TextView;

    aget-object p3, p3, p2

    new-instance p4, Ljava/lang/StringBuilder;

    const-string v0, "RGB"

    invoke-virtual {v0, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "  "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    iget-object v0, p0, Le/e/a/CustomTheme119$2;->val$bars:[Landroid/widget/SeekBar;

    aget-object v0, v0, p2

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_5c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_5c} :catch_5f

    add-int/lit8 p2, p2, 0x1

    goto :goto_1d

    :catch_5f
    move-exception p1

    :goto_60
    return-void
.end method
