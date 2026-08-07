.class public Ll/k9n$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k9n;->M3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/k9n;


# direct methods
.method public constructor <init>(Ll/k9n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k9n$a;->a:Ll/k9n;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/k9n$a;->a:Ll/k9n;

    .line 5
    .line 6
    invoke-static {v0}, Ll/k9n;->L3(Ll/k9n;)Landroid/widget/FrameLayout;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/k9n$a;->a:Ll/k9n;

    .line 11
    .line 12
    invoke-static {p0}, Ll/k9n;->K3(Ll/k9n;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
