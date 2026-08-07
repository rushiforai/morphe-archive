.class public Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;
.super Lv/VText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;
    }
.end annotation


# instance fields
.field public i:Ljava/lang/String;

.field public j:I

.field public k:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;

.field public final l:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->i:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->j:I

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l:Ljava/lang/Runnable;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->i:Ljava/lang/String;

    const/4 p1, 0x0

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->j:I

    .line 22
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 23
    invoke-direct {p0, p1, p2, p3}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->i:Ljava/lang/String;

    const/4 p1, 0x0

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->j:I

    .line 26
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->k:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;

    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->j:I

    return p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->i:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->j:I

    return-void
.end method


# virtual methods
.method public setListener(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->k:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setTextAnim(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->i:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-static {p1}, Ll/l51;->o(Ljava/lang/Runnable;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->j:I

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, ""

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x0

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->j:I

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextTypeView;->l:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/l51;->F(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method
