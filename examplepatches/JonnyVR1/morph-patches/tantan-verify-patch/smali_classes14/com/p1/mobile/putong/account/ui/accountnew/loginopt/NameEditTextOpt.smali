.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;
.super Lv/VEditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;

.field public e:Z

.field public f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VEditText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->e:Z

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->f:I

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->n()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lv/VEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->e:Z

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->f:I

    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->n()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lv/VEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->e:Z

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->f:I

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->n()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->m()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->q(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private m()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->f:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v2, 0x3

    .line 21
    if-le v1, v2, :cond_1

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    iput-boolean v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->e:Z

    .line 25
    .line 26
    :cond_1
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->f:I

    .line 27
    .line 28
    return-void
.end method

.method private n()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->o()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->p()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->m()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private o()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->f:I

    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private p()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;-><init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->f:I

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public h()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/kyh0;->c(Landroid/widget/EditText;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public i(Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/kyh0;->c(Landroid/widget/EditText;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final q(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\ud83e\udc00-\ud83e\udfff]|[\u2100-\u32ff]|[0-\u007f][\u20d0-\u20ff]|[\u0080-\u00ff]"

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public setNameWatcher(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->d:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;

    .line 2
    .line 3
    return-void
.end method
