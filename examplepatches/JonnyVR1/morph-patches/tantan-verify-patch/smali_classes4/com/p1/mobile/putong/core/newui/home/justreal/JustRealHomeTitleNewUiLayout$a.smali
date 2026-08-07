.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->q(Ljava/lang/String;IZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;ZLjava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->b:Lv/VImage;

    .line 4
    .line 5
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->c:I

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->b:Lv/VImage;

    .line 13
    .line 14
    const/high16 p2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->f()Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->b:Lv/VImage;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout$a;->d:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleNewUiLayout;->f()Z

    .line 19
    .line 20
    .line 21
    return-void
.end method
