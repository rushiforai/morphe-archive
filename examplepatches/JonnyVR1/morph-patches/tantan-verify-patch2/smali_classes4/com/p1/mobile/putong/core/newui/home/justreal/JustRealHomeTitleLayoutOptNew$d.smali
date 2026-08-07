.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->n(Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->m:Lv/VImage;

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->m:Lv/VImage;

    .line 16
    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->m:Lv/VImage;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;->b:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
