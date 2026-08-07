.class public Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;
.super Landroid/widget/TextView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView$a;
    }
.end annotation


# static fields
.field public static a:F

.field public static b:F

.field public static c:F

.field public static d:F

.field public static e:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->k()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->k()V

    return-void
.end method

.method public static bridge synthetic a()F
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->a:F

    return v0
.end method

.method public static bridge synthetic b()F
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->b:F

    return v0
.end method

.method public static bridge synthetic c()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->e:J

    return-wide v0
.end method

.method public static bridge synthetic d()F
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->c:F

    return v0
.end method

.method public static bridge synthetic e()F
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->d:F

    return v0
.end method

.method public static bridge synthetic f(F)V
    .locals 0

    .line 1
    sput p0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->a:F

    return-void
.end method

.method public static bridge synthetic g(F)V
    .locals 0

    .line 1
    sput p0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->b:F

    return-void
.end method

.method public static bridge synthetic h(J)V
    .locals 0

    .line 1
    sput-wide p0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->e:J

    return-void
.end method

.method public static bridge synthetic i(F)V
    .locals 0

    .line 1
    sput p0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->c:F

    return-void
.end method

.method public static bridge synthetic j(F)V
    .locals 0

    .line 1
    sput p0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->d:F

    return-void
.end method


# virtual methods
.method public final k()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView$a;-><init>(Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
