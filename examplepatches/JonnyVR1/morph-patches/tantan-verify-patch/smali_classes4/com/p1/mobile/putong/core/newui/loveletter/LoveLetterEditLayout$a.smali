.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->n(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditAct;Ljava/lang/String;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->g(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    rsub-int v2, v2, 0xc8

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ""

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;->a:I

    .line 46
    .line 47
    if-le v0, v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-lez p1, :cond_0

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 64
    .line 65
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->f(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/4 p1, 0x1

    .line 70
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout$a;->b:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;

    .line 75
    .line 76
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;->f(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterEditLayout;)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const/4 p1, 0x0

    .line 81
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
