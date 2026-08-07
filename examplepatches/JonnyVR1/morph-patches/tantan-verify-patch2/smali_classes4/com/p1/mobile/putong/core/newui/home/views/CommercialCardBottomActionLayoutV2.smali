.class public Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:I

.field public g:Z

.field public h:Ljava/lang/String;

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->f:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->g:Z

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->h:Ljava/lang/String;

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->i:Z

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->f:I

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->g:Z

    .line 20
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->h:Ljava/lang/String;

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->f:I

    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->g:Z

    .line 25
    const-string p2, ""

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->h:Ljava/lang/String;

    .line 26
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->i:Z

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ri5;->a(Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CommercialCardBottomActionLayoutV2;->e:Lv/VText;

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
