.class public final Ll/yfe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\n\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u000e\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0012\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u001f\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001aJ\u0017\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\r\u0010\u001f\u001a\u00020\n\u00a2\u0006\u0004\u0008\u001f\u0010\u001aJ\u0017\u0010\"\u001a\u00020\n2\u0008\u0010!\u001a\u0004\u0018\u00010 \u00a2\u0006\u0004\u0008\"\u0010#J\u0019\u0010%\u001a\u00020\n2\u0008\u0010$\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008%\u0010\u000cR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008&\u0010\'\u001a\u0004\u0008(\u0010)R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008*\u0010+\u001a\u0004\u0008,\u0010-R\"\u00105\u001a\u00020.8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008/\u00100\u001a\u0004\u00081\u00102\"\u0004\u00083\u00104R\"\u0010=\u001a\u0002068\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00087\u00108\u001a\u0004\u00089\u0010:\"\u0004\u0008;\u0010<R\"\u0010E\u001a\u00020>8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008?\u0010@\u001a\u0004\u0008A\u0010B\"\u0004\u0008C\u0010DR\"\u0010L\u001a\u00020F8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u000b\u0010G\u001a\u0004\u0008H\u0010I\"\u0004\u0008J\u0010KR\"\u0010O\u001a\u00020F8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0017\u0010G\u001a\u0004\u0008M\u0010I\"\u0004\u0008N\u0010KR\"\u0010R\u001a\u00020F8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00081\u0010G\u001a\u0004\u0008P\u0010I\"\u0004\u0008Q\u0010KR\"\u0010U\u001a\u00020F8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008H\u0010G\u001a\u0004\u0008S\u0010I\"\u0004\u0008T\u0010KR\"\u0010\\\u001a\u00020V8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008M\u0010W\u001a\u0004\u0008X\u0010Y\"\u0004\u0008Z\u0010[R\u0016\u0010\u0011\u001a\u00020\u00108\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008P\u0010]R\u0018\u0010^\u001a\u0004\u0018\u00010F8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008S\u0010GR\u0018\u0010!\u001a\u0004\u0018\u00010 8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008X\u0010_\u00a8\u0006`"
    }
    d2 = {
        "Ll/yfe0;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;",
        "homeFrag",
        "Lcom/p1/mobile/putong/data/User;",
        "data",
        "<init>",
        "(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Lcom/p1/mobile/putong/data/User;)V",
        "Landroid/view/View;",
        "view",
        "",
        "f",
        "(Landroid/view/View;)V",
        "user",
        "q",
        "(Lcom/p1/mobile/putong/data/User;)V",
        "Ll/pej0;",
        "dialog",
        "o",
        "(Ll/pej0;)V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "rootView",
        "g",
        "(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Ll/pej0;",
        "t",
        "()V",
        "u",
        "",
        "p",
        "(Landroid/view/View;)Z",
        "s",
        "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
        "swipeDirection",
        "r",
        "(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V",
        "v",
        "onClick",
        "a",
        "Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;",
        "getHomeFrag",
        "()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;",
        "b",
        "Lcom/p1/mobile/putong/data/User;",
        "getData",
        "()Lcom/p1/mobile/putong/data/User;",
        "Lv/VFrame;",
        "c",
        "Lv/VFrame;",
        "h",
        "()Lv/VFrame;",
        "set_bg_view",
        "(Lv/VFrame;)V",
        "_bg_view",
        "Lv/VImage;",
        "d",
        "Lv/VImage;",
        "n",
        "()Lv/VImage;",
        "set_title_icon",
        "(Lv/VImage;)V",
        "_title_icon",
        "Lv/VText;",
        "e",
        "Lv/VText;",
        "get_desc",
        "()Lv/VText;",
        "set_desc",
        "(Lv/VText;)V",
        "_desc",
        "Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;",
        "Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;",
        "i",
        "()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;",
        "set_card_1",
        "(Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;)V",
        "_card_1",
        "j",
        "set_card_2",
        "_card_2",
        "k",
        "set_card_3",
        "_card_3",
        "l",
        "set_card_4",
        "_card_4",
        "Lv/VButton;",
        "Lv/VButton;",
        "m",
        "()Lv/VButton;",
        "set_skip",
        "(Lv/VButton;)V",
        "_skip",
        "Ll/pej0;",
        "choseView",
        "Lcom/p1/mobile/putong/core/data/SwipeDirection;",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/data/User;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Lv/VFrame;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

.field public g:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

.field public h:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

.field public i:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

.field public j:Lv/VButton;

.field public k:Ll/pej0;

.field public l:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/core/data/SwipeDirection;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 11
    .line 12
    iput-object p2, p0, Ll/yfe0;->b:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    return-void
.end method

.method public static a(Ll/yfe0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfe0;->k:Ll/pej0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "dialog"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static b(Ll/yfe0;IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/16 p3, 0x15

    .line 2
    .line 3
    if-ne p1, p3, :cond_2

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eq p2, p1, :cond_1

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eq p2, p1, :cond_1

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->getValue()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-ne p2, p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p1, 0x0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    invoke-static {p2}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->fromValue(I)Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    :goto_1
    invoke-virtual {p0, p1}, Ll/yfe0;->r(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_2
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public static c()V
    .locals 2

    .line 1
    const-string v0, "e_intl_mystery_box_card"

    .line 2
    .line 3
    const-string v1, "p_intl_mystery_box_popup"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static d(Ll/yfe0;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfe0;->k:Ll/pej0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "dialog"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static e(Ll/yfe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yfe0;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zfe0;->a(Ll/yfe0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Ll/pej0;
    .locals 1

    .line 1
    new-instance p0, Ll/pej0;

    .line 2
    .line 3
    sget v0, Ll/agc0;->d:I

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 p2, 0x3

    .line 20
    invoke-virtual {p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance p2, Ll/yfe0$a;

    .line 28
    .line 29
    invoke-direct {p2, p0}, Ll/yfe0$a;-><init>(Ll/pej0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 33
    .line 34
    .line 35
    return-object p0
.end method

.method public final h()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfe0;->c:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_bg_view"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final i()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfe0;->f:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_card_1"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final j()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfe0;->g:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_card_2"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final k()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfe0;->h:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_card_3"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final l()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfe0;->i:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_card_4"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final m()Lv/VButton;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfe0;->j:Lv/VButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_skip"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final n()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yfe0;->d:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_title_icon"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final o(Ll/pej0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yfe0;->i()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yfe0;->j()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yfe0;->k()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/yfe0;->l()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/yfe0;->i()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/xfe0;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/xfe0;-><init>(Ll/yfe0;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_c

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/16 v1, 0xca9

    .line 56
    .line 57
    if-eq v0, v1, :cond_a

    .line 58
    .line 59
    const/16 v1, 0xd25

    .line 60
    .line 61
    if-eq v0, v1, :cond_8

    .line 62
    .line 63
    const/16 v1, 0xd37

    .line 64
    .line 65
    if-eq v0, v1, :cond_6

    .line 66
    .line 67
    const/16 v1, 0xd64

    .line 68
    .line 69
    if-eq v0, v1, :cond_4

    .line 70
    .line 71
    const/16 v1, 0xe74

    .line 72
    .line 73
    if-eq v0, v1, :cond_2

    .line 74
    .line 75
    const/16 v1, 0xf2e

    .line 76
    .line 77
    if-eq v0, v1, :cond_0

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    const-string v0, "zh"

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_c

    .line 87
    .line 88
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const-string v0, "TW"

    .line 97
    .line 98
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_1

    .line 103
    .line 104
    sget p1, Ll/dbc0;->Pb:I

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_1
    sget p1, Ll/dbc0;->Ob:I

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    const-string v0, "th"

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-nez p1, :cond_3

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_3
    sget p1, Ll/dbc0;->Nb:I

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    const-string v0, "ko"

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-nez p1, :cond_5

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_5
    sget p1, Ll/dbc0;->Mb:I

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_6
    const-string v0, "ja"

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-nez p1, :cond_7

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_7
    sget p1, Ll/dbc0;->Lb:I

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_8
    const-string v0, "in"

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-nez p1, :cond_9

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_9
    sget p1, Ll/dbc0;->Kb:I

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_a
    const-string v0, "en"

    .line 159
    .line 160
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-nez p1, :cond_b

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_b
    sget p1, Ll/dbc0;->Jb:I

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_c
    :goto_0
    sget p1, Ll/dbc0;->Jb:I

    .line 171
    .line 172
    :goto_1
    invoke-virtual {p0}, Ll/yfe0;->n()Lv/VImage;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/yfe0;->i()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yfe0;->j()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/yfe0;->k()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/yfe0;->l()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    :cond_0
    const-string v0, "e_intl_mystery_box_card"

    .line 42
    .line 43
    const-string v1, "p_intl_mystery_box_popup"

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/yfe0;->l:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Ll/yfe0;->m:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 59
    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    iget-object v0, p0, Ll/yfe0;->l:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 64
    .line 65
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Ll/yfe0;->m:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 72
    .line 73
    if-nez p1, :cond_2

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    return-void

    .line 77
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const/16 v5, 0x1c

    .line 84
    .line 85
    const/4 v6, 0x0

    .line 86
    const-string v1, ""

    .line 87
    .line 88
    const/4 v2, 0x0

    .line 89
    const/4 v3, 0x0

    .line 90
    const/4 v4, 0x0

    .line 91
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/purchase/c;->E1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/x20;Ljava/lang/Object;ILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_4
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    check-cast p1, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 99
    .line 100
    iput-object p1, p0, Ll/yfe0;->l:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 101
    .line 102
    iget-object p1, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 103
    .line 104
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iget-object v0, p0, Ll/yfe0;->b:Lcom/p1/mobile/putong/data/User;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 111
    .line 112
    const-string v1, "from_see_blind_box"

    .line 113
    .line 114
    const/4 v2, 0x1

    .line 115
    invoke-static {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p0}, Ll/yfe0;->u()V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 123
    .line 124
    new-instance v1, Ll/tfe0;

    .line 125
    .line 126
    invoke-direct {v1, p0}, Ll/tfe0;-><init>(Ll/yfe0;)V

    .line 127
    .line 128
    .line 129
    const/16 v2, 0x15

    .line 130
    .line 131
    invoke-virtual {v0, v2, p1, v1}, Lcom/p1/mobile/android/app/Frag;->u4(ILandroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    sget p1, Ll/x7c0;->y:I

    .line 141
    .line 142
    const/4 v0, 0x0

    .line 143
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final p(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfe0;->l:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final q(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Ll/fsb0;->A0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/SwipeDirection;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/yfe0;->m:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    iget-object v0, p0, Ll/yfe0;->l:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->b()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/yfe0;->t()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/yfe0;->l:Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v1, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/yfe0;->b:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    invoke-virtual {v0, v1, p1, p0}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SwipeDirection;Lcom/p1/mobile/putong/data/User;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final s()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/kec0;->K5:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/yfe0;->f(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/yfe0;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;->Y4()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v1, v0}, Ll/yfe0;->g(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)Ll/pej0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iput-object v1, p0, Ll/yfe0;->k:Ll/pej0;

    .line 38
    .line 39
    const-string v3, "dialog"

    .line 40
    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    move-object v1, v2

    .line 47
    :cond_0
    invoke-virtual {p0, v1}, Ll/yfe0;->o(Ll/pej0;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/yfe0;->k:Ll/pej0;

    .line 51
    .line 52
    if-nez v1, :cond_1

    .line 53
    .line 54
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    move-object v1, v2

    .line 58
    :cond_1
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/yfe0;->k:Ll/pej0;

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    move-object v2, v1

    .line 70
    :goto_0
    invoke-static {}, Ll/fp60;->E()Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v2, v1}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    new-instance v2, Ll/ufe0;

    .line 79
    .line 80
    invoke-direct {v2, p0}, Ll/ufe0;-><init>(Ll/yfe0;)V

    .line 81
    .line 82
    .line 83
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/yfe0;->m()Lv/VButton;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    new-instance v2, Ll/vfe0;

    .line 95
    .line 96
    invoke-direct {v2, p0}, Ll/vfe0;-><init>(Ll/yfe0;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    new-instance v1, Ll/wfe0;

    .line 103
    .line 104
    invoke-direct {v1}, Ll/wfe0;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/yfe0;->b:Lcom/p1/mobile/putong/data/User;

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ll/yfe0;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 113
    .line 114
    .line 115
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/yfe0;->h()Lv/VFrame;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    const-string v1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ik0zQlA0VUhOTUJYU1o3UEpTSFFRNTZTRUNJVDdWTTE0IiwidyI6MTEyNSwiaCI6MTU5MCwiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjE3MzE0OTQ0MTg3NDc3ODc1NzR9.webp"

    .line 122
    .line 123
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yfe0;->i()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/yfe0;->p(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "core_intl_see_blind_box_star_1.svga"

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/yfe0;->i()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->f(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/yfe0;->l()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Ll/yfe0;->p(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/yfe0;->l()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->f(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Ll/yfe0;->j()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/yfe0;->p(Landroid/view/View;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const-string v1, "core_intl_see_blind_box_star_2.svga"

    .line 46
    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/yfe0;->j()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->f(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    invoke-virtual {p0}, Ll/yfe0;->k()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/yfe0;->p(Landroid/view/View;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/yfe0;->k()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->f(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_3
    return-void
.end method

.method public final u()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/yfe0;->i()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->g()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/yfe0;->l()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->g()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yfe0;->j()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->g()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/yfe0;->k()Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seeblindbox/SeeBlindBoxItem;->g()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
