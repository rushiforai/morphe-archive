.class public Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->p(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-ge v0, v1, :cond_0

    .line 21
    .line 22
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->r(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->p(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 38
    .line 39
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->q(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Ljava/lang/Runnable;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-wide/16 v1, 0x32

    .line 63
    .line 64
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_0
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->p(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 76
    .line 77
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->r(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;

    .line 93
    .line 94
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;->a()V

    .line 99
    .line 100
    .line 101
    :cond_1
    return-void
.end method
