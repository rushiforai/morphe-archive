.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public d:I

.field public e:[Ljava/lang/String;

.field public f:Ljava/lang/Runnable;

.field public g:Lv/VText;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->d:I

    .line 6
    .line 7
    new-array p1, p1, [Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->e:[Ljava/lang/String;

    .line 10
    .line 11
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->f:Ljava/lang/Runnable;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->init()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->d:I

    .line 24
    new-array p1, p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->e:[Ljava/lang/String;

    .line 25
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->f:Ljava/lang/Runnable;

    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->d:I

    .line 29
    new-array p1, p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->e:[Ljava/lang/String;

    .line 30
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->f:Ljava/lang/Runnable;

    .line 31
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->init()V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->d:I

    return p0
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->e:[Ljava/lang/String;

    return-object p0
.end method

.method private init()V
    .locals 5

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [Ljava/lang/String;

    .line 3
    .line 4
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->e:[Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    :goto_0
    if-ge v2, v0, :cond_0

    .line 13
    .line 14
    const-string v3, "."

    .line 15
    .line 16
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->e:[Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    aput-object v4, v3, v2

    .line 26
    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public static bridge synthetic j0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->g:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic k0(Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->d:I

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->f:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->f:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->O4:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VText;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChatHelperInputting;->g:Lv/VText;

    .line 13
    .line 14
    return-void
.end method
