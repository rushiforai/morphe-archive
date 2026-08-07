.class public Ll/sua0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sua0;->p(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sua0;


# direct methods
.method public constructor <init>(Ll/sua0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sua0$a;->a:Ll/sua0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/sua0$a;->a:Ll/sua0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/sua0;->d(Ll/sua0;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/sua0$a;->a:Ll/sua0;

    .line 14
    .line 15
    iget-object v1, v0, Ll/sua0;->d:Lv/VEditText;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-static {v0}, Ll/sua0;->d(Ll/sua0;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-interface {p1, v2, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/sua0$a;->a:Ll/sua0;

    .line 30
    .line 31
    iget-object v1, v0, Ll/sua0;->d:Lv/VEditText;

    .line 32
    .line 33
    invoke-static {v0}, Ll/sua0;->d(Ll/sua0;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p0, p0, Ll/sua0$a;->a:Ll/sua0;

    .line 41
    .line 42
    iget-object p0, p0, Ll/sua0;->e:Lv/VImage;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    xor-int/lit8 p1, p1, 0x1

    .line 53
    .line 54
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
