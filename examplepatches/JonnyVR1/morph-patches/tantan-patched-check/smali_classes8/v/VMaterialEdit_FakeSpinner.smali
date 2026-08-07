.class public Lv/VMaterialEdit_FakeSpinner;
.super Lv/VMaterialEdit;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VMaterialEdit;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lv/VMaterialEdit_FakeSpinner;->J(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VMaterialEdit;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lv/VMaterialEdit_FakeSpinner;->J(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VMaterialEdit;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lv/VMaterialEdit_FakeSpinner;->J(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final J(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/high16 p1, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, v0, v1, p1, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->E(IIII)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public getDefaultEditable()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getDefaultMovementMethod()Landroid/text/method/MovementMethod;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getText()Landroid/text/Editable;
    .locals 0

    .line 6
    invoke-super {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic getText()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VMaterialEdit_FakeSpinner;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
