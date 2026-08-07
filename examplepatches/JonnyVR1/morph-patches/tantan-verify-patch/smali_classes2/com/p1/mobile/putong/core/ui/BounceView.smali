.class public abstract Lcom/p1/mobile/putong/core/ui/BounceView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/a;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Lcom/p1/mobile/putong/core/ui/a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/a;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/ui/a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/a;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    return-void
.end method


# virtual methods
.method public getBounce()Lcom/p1/mobile/putong/core/ui/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract setLongPressingListener(Lcom/p1/mobile/putong/core/ui/a$d;)V
.end method

.method public abstract setProgress(F)V
.end method
