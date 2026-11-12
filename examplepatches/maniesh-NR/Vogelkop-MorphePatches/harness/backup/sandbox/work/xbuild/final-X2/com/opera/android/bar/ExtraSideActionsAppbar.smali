.class public Lcom/opera/android/bar/ExtraSideActionsAppbar;
.super Lu43;
.source "SourceFile"


# static fields
.field public static final synthetic f:I


# instance fields
.field public final d:Lbn8;

.field public e:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    new-instance p2, Lbn8;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lbn8;-><init>(Lcom/opera/android/bar/ExtraSideActionsAppbar;Landroid/content/res/Resources;)V

    iput-object p2, p0, Lcom/opera/android/bar/ExtraSideActionsAppbar;->d:Lbn8;

    invoke-virtual {p0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a0793

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/ExtraSideActionsAppbar;->e:Landroid/view/View;

    new-instance v0, Lpc5;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_1c

    invoke-static {v1, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_1c
    invoke-virtual {v0, p0}, Lpc5;->a(Landroid/view/View;)V

    return-void
.end method
