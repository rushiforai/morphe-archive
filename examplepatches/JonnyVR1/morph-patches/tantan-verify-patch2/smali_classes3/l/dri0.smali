.class public Ll/dri0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/lovebuzz/text/TextBuzzAct;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/text/TextBuzzAct;->c:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/lovebuzz/text/TextBuzzAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/mec0;->C:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/dri0;->a(Lcom/p1/mobile/putong/core/ui/lovebuzz/text/TextBuzzAct;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
