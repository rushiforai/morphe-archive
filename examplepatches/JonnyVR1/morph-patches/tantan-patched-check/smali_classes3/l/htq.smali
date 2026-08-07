.class public Ll/htq;
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

.method public static a(Ll/gtq;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 9
    .line 10
    iput-object v0, p0, Ll/gtq;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealAvatarRootLayout;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 18
    .line 19
    iput-object v0, p0, Ll/gtq;->b:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 20
    .line 21
    const/4 v0, 0x2

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 27
    .line 28
    iput-object p1, p0, Ll/gtq;->c:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 29
    .line 30
    return-void
.end method
