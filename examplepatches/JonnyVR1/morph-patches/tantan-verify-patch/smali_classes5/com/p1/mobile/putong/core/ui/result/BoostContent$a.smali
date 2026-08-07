.class public Lcom/p1/mobile/putong/core/ui/result/BoostContent$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/result/BoostContent;->d()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/BoostContent;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/result/BoostContent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/BoostContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/BoostContent;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/BoostContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/BoostContent;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/result/BoostContent;->b:Lv/VImage;

    .line 4
    .line 5
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 6
    .line 7
    sget-object v7, Ll/gt0;->c:Landroid/view/animation/Interpolator;

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    new-array v8, v3, [F

    .line 11
    .line 12
    fill-array-data v8, :array_0

    .line 13
    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    const-wide/16 v5, 0xc8

    .line 18
    .line 19
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/result/BoostContent;->a(Lcom/p1/mobile/putong/core/ui/result/BoostContent;Landroid/animation/Animator;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/BoostContent$a;->a:Lcom/p1/mobile/putong/core/ui/result/BoostContent;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    nop

    .line 37
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
