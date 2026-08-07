.class public Lcom/p1/mobile/putong/core/ui/report/e$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/report/e;->l(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/report/e;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/report/e;Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->b:Lcom/p1/mobile/putong/core/ui/report/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->a:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->b:Lcom/p1/mobile/putong/core/ui/report/e;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/report/e;->e:Lv/VText;

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, "/100"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->a:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->isGP()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->b:Lcom/p1/mobile/putong/core/ui/report/e;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/core/ui/report/ReportAct;

    .line 44
    .line 45
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/report/ReportAct;->h:Z

    .line 46
    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->b:Lcom/p1/mobile/putong/core/ui/report/e;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/report/e;->b(Lcom/p1/mobile/putong/core/ui/report/e;)Lcom/p1/mobile/putong/core/ui/report/e$c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/report/e$c;->H(Lcom/p1/mobile/putong/core/ui/report/e$c;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/report/e;->i(Ljava/util/List;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->b:Lcom/p1/mobile/putong/core/ui/report/e;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/report/e;->f:Lv/VButton;

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    const/16 v1, 0xa

    .line 76
    .line 77
    if-ge p1, v1, :cond_2

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/e$b;->a:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->isCategorised()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    const/4 p0, 0x0

    .line 89
    goto :goto_1

    .line 90
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 91
    :goto_1
    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 92
    .line 93
    .line 94
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
