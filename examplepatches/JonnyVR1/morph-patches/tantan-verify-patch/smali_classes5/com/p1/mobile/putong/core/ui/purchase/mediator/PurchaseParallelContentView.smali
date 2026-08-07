.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;
.super Lv/VScroll_Fill_BottomAligned;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00b2\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u0015\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0010H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u000eJ\u000f\u0010\u0015\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u000eJ\u000f\u0010\u0016\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u000eJ\u000f\u0010\u0017\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u000eJ\u001d\u0010\u001a\u001a\u00020\n2\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u0010H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\nH\u0014\u00a2\u0006\u0004\u0008\u001c\u0010\u000eJ1\u0010%\u001a\u00020\n2\u0006\u0010\u001e\u001a\u00020\u001d2\u0006\u0010 \u001a\u00020\u001f2\u0008\u0010\"\u001a\u0004\u0018\u00010!2\u0008\u0010$\u001a\u0004\u0018\u00010#\u00a2\u0006\u0004\u0008%\u0010&J\r\u0010\'\u001a\u00020\u001f\u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010+\u001a\u00020\n2\u0008\u0010*\u001a\u0004\u0018\u00010)\u00a2\u0006\u0004\u0008+\u0010,J\u001d\u00100\u001a\u00020\n2\u000e\u0010/\u001a\n\u0012\u0004\u0012\u00020.\u0018\u00010-\u00a2\u0006\u0004\u00080\u00101J\u001d\u00103\u001a\u00020\n2\u000e\u00102\u001a\n\u0012\u0004\u0012\u00020\u001f\u0018\u00010-\u00a2\u0006\u0004\u00083\u00101J+\u00106\u001a\u00020\n2\u001c\u00105\u001a\u0018\u0012\u0004\u0012\u00020\u001f\u0012\u0004\u0012\u00020\u001d\u0012\u0006\u0012\u0004\u0018\u00010#\u0018\u000104\u00a2\u0006\u0004\u00086\u00107J\u0015\u0010:\u001a\u00020\n2\u0006\u00109\u001a\u000208\u00a2\u0006\u0004\u0008:\u0010;J\u0015\u0010>\u001a\u00020\n2\u0006\u0010=\u001a\u00020<\u00a2\u0006\u0004\u0008>\u0010?J\u0015\u0010B\u001a\u00020\n2\u0006\u0010A\u001a\u00020@\u00a2\u0006\u0004\u0008B\u0010CJ\u000f\u0010D\u001a\u00020\nH\u0014\u00a2\u0006\u0004\u0008D\u0010\u000eJ\r\u0010E\u001a\u00020\n\u00a2\u0006\u0004\u0008E\u0010\u000eJ\r\u0010F\u001a\u00020\n\u00a2\u0006\u0004\u0008F\u0010\u000eJ\r\u0010G\u001a\u00020\n\u00a2\u0006\u0004\u0008G\u0010\u000eJ\r\u0010H\u001a\u00020\n\u00a2\u0006\u0004\u0008H\u0010\u000eJ\r\u0010I\u001a\u00020\n\u00a2\u0006\u0004\u0008I\u0010\u000eR\"\u0010Q\u001a\u00020J8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008K\u0010L\u001a\u0004\u0008M\u0010N\"\u0004\u0008O\u0010PR\u0016\u0010\u001e\u001a\u00020\u001d8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008R\u0010SR\u0016\u0010 \u001a\u00020\u001f8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008T\u0010UR\u0018\u0010$\u001a\u0004\u0018\u00010#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008V\u0010WR\u0018\u0010Z\u001a\u0004\u0018\u00010!8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008X\u0010YR\u0018\u0010]\u001a\u0004\u0018\u00010[8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\\R\u0018\u0010A\u001a\u0004\u0018\u00010@8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008^\u0010_R$\u0010*\u001a\u0004\u0018\u00010)8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008`\u0010a\u001a\u0004\u0008b\u0010c\"\u0004\u0008d\u0010,R\u001c\u0010i\u001a\u0008\u0012\u0004\u0012\u00020f0e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008g\u0010hR\u001e\u0010/\u001a\n\u0012\u0004\u0012\u00020.\u0018\u00010-8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008j\u0010kR,\u00105\u001a\u0018\u0012\u0004\u0012\u00020\u001f\u0012\u0004\u0012\u00020\u001d\u0012\u0006\u0012\u0004\u0018\u00010#\u0018\u0001048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008l\u0010mR\u001e\u00102\u001a\n\u0012\u0004\u0012\u00020\u001f\u0018\u00010-8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008n\u0010kR\u0016\u00109\u001a\u0002088\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010oR\u0014\u0010r\u001a\u00020p8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008+\u0010qR\u001a\u0010s\u001a\u0008\u0012\u0004\u0012\u00020\u00180e8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008H\u0010hR\u0016\u0010u\u001a\u00020<8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008G\u0010tR\u0016\u0010=\u001a\u00020<8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008%\u0010tR\u0018\u0010x\u001a\u0004\u0018\u00010v8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010w\u00a8\u0006y"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;",
        "Lv/VScroll_Fill_BottomAligned;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Landroid/view/View;",
        "view",
        "",
        "k",
        "(Landroid/view/View;)V",
        "A",
        "()V",
        "C",
        "",
        "Ll/a690;",
        "r",
        "()Ljava/util/List;",
        "D",
        "B",
        "z",
        "w",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "sections",
        "F",
        "(Ljava/util/List;)V",
        "onFinishInflate",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "",
        "from",
        "v",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "Ll/ndb0;",
        "mediator",
        "s",
        "(Ll/ndb0;)V",
        "Ll/y20;",
        "",
        "dialogStateAction",
        "setDialogStateAction",
        "(Ll/y20;)V",
        "onNegativeClick",
        "setOnNegativeClick",
        "Ll/a30;",
        "onPaymentSuccess",
        "setOnPaymentSuccess",
        "(Ll/a30;)V",
        "Landroid/view/ViewGroup;",
        "_agreement_root",
        "setAgreementRoot",
        "(Landroid/view/ViewGroup;)V",
        "",
        "isInitSelectTab",
        "setInitSelectTab",
        "(Z)V",
        "Ll/lib0;",
        "purchasePageTrack",
        "setPurchasePageTrack",
        "(Ll/lib0;)V",
        "onDetachedFromWindow",
        "y",
        "x",
        "u",
        "t",
        "E",
        "Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;",
        "f",
        "Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;",
        "get_content",
        "()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;",
        "set_content",
        "(Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;)V",
        "_content",
        "g",
        "Lcom/p1/mobile/android/app/Act;",
        "h",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "i",
        "Ljava/lang/String;",
        "j",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "firstPrivilege",
        "Ll/l3m;",
        "Ll/l3m;",
        "privilegeComponent",
        "l",
        "Ll/lib0;",
        "m",
        "Ll/ndb0;",
        "getMediator",
        "()Ll/ndb0;",
        "setMediator",
        "",
        "Ll/w3m;",
        "n",
        "Ljava/util/List;",
        "purchaseComponentsList",
        "o",
        "Ll/y20;",
        "p",
        "Ll/a30;",
        "q",
        "Landroid/view/ViewGroup;",
        "Ll/l4g0;",
        "Ll/l4g0;",
        "statisticsPageHelper",
        "purchaseSections",
        "Z",
        "isDialogPageShow",
        "Ll/afb0;",
        "Ll/afb0;",
        "paymentNegativeComponent",
        "pay_intlGmsRelease"
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
.field public f:Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public i:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public j:Lcom/p1/mobile/putong/core/data/Privilege;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public k:Ll/l3m;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public l:Ll/lib0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public m:Ll/ndb0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/w3m;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public o:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public p:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public q:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public r:Landroid/view/ViewGroup;

.field public final s:Ll/l4g0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public u:Z

.field public v:Z

.field public w:Ll/afb0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 43
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lv/VScroll_Fill_BottomAligned;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n:Ljava/util/List;

    .line 17
    .line 18
    const-class p1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p2, "p_purchase_page"

    .line 25
    .line 26
    invoke-static {p2, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->s:Ll/l4g0;

    .line 34
    .line 35
    new-instance p1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->t:Ljava/util/List;

    .line 41
    .line 42
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 44
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private final A()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->C()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->D()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->B()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->z()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->w()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->w()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/w3m;

    .line 40
    .line 41
    invoke-interface {v0}, Ll/w3m;->b()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static h(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 5

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x0

    .line 8
    const-string v3, "purchaseType"

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move-object v4, p1

    .line 13
    check-cast v4, Ljava/lang/Iterable;

    .line 14
    .line 15
    invoke-static {v4, v0}, Lkotlin/collections/CollectionsKt;->contains(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->oDiamondSvipExtra:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    if-ne p3, v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object v2, p0

    .line 34
    :goto_0
    invoke-static {v2, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-interface {p2, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    check-cast p1, Ljava/lang/Iterable;

    .line 50
    .line 51
    invoke-static {p1, v0}, Lkotlin/collections/CollectionsKt;->contains(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_3

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 58
    .line 59
    if-ne p3, p1, :cond_3

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 62
    .line 63
    if-nez p0, :cond_2

    .line 64
    .line 65
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    move-object v2, p0

    .line 70
    :goto_1
    invoke-static {v2, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    invoke-interface {p2, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 82
    .line 83
    if-nez p0, :cond_4

    .line 84
    .line 85
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    move-object v2, p0

    .line 90
    :goto_2
    invoke-static {v2, p3}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const-string v2, "purchaseType"

    .line 10
    .line 11
    if-ne p2, v0, :cond_1

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object p0, v1

    .line 19
    :cond_0
    invoke-static {p0, p2}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    const/4 p2, 0x0

    .line 27
    invoke-interface {p1, p2, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    if-nez p0, :cond_2

    .line 32
    .line 33
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    move-object p0, v1

    .line 37
    :cond_2
    invoke-static {p0, p2}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static final synthetic l(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Ll/lib0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->l:Ll/lib0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic m(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->t:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic n(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic o(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic p(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic q(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->F(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final B()V
    .locals 5

    .line 1
    new-instance v0, Ll/afb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const-string v1, "act"

    .line 9
    .line 10
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    move-object v1, v2

    .line 14
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 15
    .line 16
    if-nez v3, :cond_1

    .line 17
    .line 18
    const-string v3, "purchaseType"

    .line 19
    .line 20
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    move-object v2, v3

    .line 25
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 28
    .line 29
    invoke-direct {v0, v1, v2, v3, v4}, Ll/afb0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->get_content()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->get_content()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v2}, Ll/xeb0;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->p:Ll/a30;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/l5;->Q(Ll/a30;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ll/l5;->P(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->o:Ll/y20;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ll/l5;->O(Ll/y20;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->q:Ll/y20;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/afb0;->r0(Ll/y20;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ll/l5;->register()V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->w:Ll/afb0;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final C()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "act"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    const-string v2, "purchaseType"

    .line 17
    .line 18
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    move-object v2, v1

    .line 22
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    const/4 v5, 0x0

    .line 26
    invoke-static {v0, v2, v3, v5, v4}, Ll/pab0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;ZZ)Ll/l3m;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->k:Ll/l3m;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->get_content()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v0, v1, v5}, Ll/l3m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->k:Ll/l3m;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->r()Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-interface {v0, v2}, Ll/l3m;->c(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 54
    .line 55
    const/4 v2, -0x1

    .line 56
    const/4 v3, -0x2

    .line 57
    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->get_content()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final D()V
    .locals 6

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, -0x2

    .line 5
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 9
    .line 10
    const-string v2, "purchaseType"

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object v1, v3

    .line 19
    :cond_0
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {v1}, Ll/txq;->c(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 31
    .line 32
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 33
    .line 34
    :cond_1
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/tab0;->z()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    const-string v4, "act"

    .line 43
    .line 44
    if-eqz v1, :cond_4

    .line 45
    .line 46
    new-instance v1, Ll/hib0;

    .line 47
    .line 48
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->g:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    if-nez v5, :cond_2

    .line 51
    .line 52
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    move-object v5, v3

    .line 56
    :cond_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 57
    .line 58
    if-nez v4, :cond_3

    .line 59
    .line 60
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    move-object v3, v4

    .line 65
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 68
    .line 69
    invoke-direct {v1, v5, v3, v2, v4}, Ll/hib0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 70
    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_4
    new-instance v1, Ll/eib0;

    .line 74
    .line 75
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->g:Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    if-nez v5, :cond_5

    .line 78
    .line 79
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    move-object v5, v3

    .line 83
    :cond_5
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 84
    .line 85
    if-nez v4, :cond_6

    .line 86
    .line 87
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_6
    move-object v3, v4

    .line 92
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 95
    .line 96
    invoke-direct {v1, v5, v3, v2, v4}, Ll/eib0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 97
    .line 98
    .line 99
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->get_content()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->get_content()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-interface {v1, v3}, Ll/w3m;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v2, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    invoke-interface {v1}, Ll/w3m;->register()V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final E()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->t:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->l:Ll/lib0;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->t:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/lib0;->C(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final F(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "purchaseShowFrom"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v2}, Ll/abb0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    const-string v1, "purchaseType"

    .line 22
    .line 23
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-exception p1

    .line 29
    goto/16 :goto_3

    .line 30
    .line 31
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "productType"

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Ll/mib0;->j(Ljava/util/List;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/util/Collection;

    .line 49
    .line 50
    const-string v3, ","

    .line 51
    .line 52
    invoke-static {v2, v3}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const-string v3, "skuGroup"

    .line 57
    .line 58
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    const-string v3, "vip"

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ll/tab0;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    const-string v3, "default_product"

    .line 72
    .line 73
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v2, v1}, Ll/tab0;->p(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const-string v2, "default_duration"

    .line 89
    .line 90
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    .line 92
    .line 93
    check-cast p1, Ljava/util/Collection;

    .line 94
    .line 95
    new-instance v1, Ll/deb0;

    .line 96
    .line 97
    invoke-direct {v1}, Ll/deb0;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    const-string v1, "if_sale"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    const-string v2, "no"

    .line 111
    .line 112
    const-string v3, "yes"

    .line 113
    .line 114
    if-eqz p1, :cond_1

    .line 115
    .line 116
    move-object v4, v3

    .line 117
    goto :goto_1

    .line 118
    :cond_1
    move-object v4, v2

    .line 119
    :goto_1
    :try_start_1
    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    .line 121
    .line 122
    const-string v1, "if_discount"

    .line 123
    .line 124
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    const-string p1, "if_double_tab"

    .line 128
    .line 129
    const/4 v1, 0x1

    .line 130
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 131
    .line 132
    .line 133
    const-string p1, "function_type"

    .line 134
    .line 135
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 136
    .line 137
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v4, v5}, Ll/mib0;->f(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    .line 145
    .line 146
    const-string p1, "tooltips_trigger_mode"

    .line 147
    .line 148
    const-string v4, "active"

    .line 149
    .line 150
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 151
    .line 152
    .line 153
    const-string p1, "tooltips_type_ui"

    .line 154
    .line 155
    const-string v4, "alert_self_definition_business_a"

    .line 156
    .line 157
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    .line 159
    .line 160
    const-string p1, "tooltips_trigger_module"

    .line 161
    .line 162
    const-string v4, "purchase_button"

    .line 163
    .line 164
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    .line 166
    .line 167
    const-string p1, "tooltips_trigger_page"

    .line 168
    .line 169
    const-string v4, "anywhere"

    .line 170
    .line 171
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 172
    .line 173
    .line 174
    const-string p1, "tooltips_type"

    .line 175
    .line 176
    const-string v4, "alert"

    .line 177
    .line 178
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 179
    .line 180
    .line 181
    const-string p1, "tooltips_trigger_reason"

    .line 182
    .line 183
    const-string v4, "purchase"

    .line 184
    .line 185
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 186
    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 197
    .line 198
    .line 199
    move-result p1

    .line 200
    if-eqz p1, :cond_2

    .line 201
    .line 202
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 203
    .line 204
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    if-eqz p1, :cond_2

    .line 211
    .line 212
    move-object v2, v3

    .line 213
    :cond_2
    const-string p1, "no_secret_payment"

    .line 214
    .line 215
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 216
    .line 217
    .line 218
    const-string p1, "user_secret_staus"

    .line 219
    .line 220
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 221
    .line 222
    .line 223
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    invoke-interface {p1}, Ll/r97;->N()Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    if-eqz p1, :cond_4

    .line 236
    .line 237
    const-string p1, "is_fakeunreal"

    .line 238
    .line 239
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 240
    .line 241
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 242
    .line 243
    invoke-virtual {v2}, Ll/dkb;->Z7()Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-eqz v2, :cond_3

    .line 248
    .line 249
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 250
    .line 251
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 252
    .line 253
    invoke-virtual {v2}, Ll/dkb;->W7()Z

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-nez v2, :cond_3

    .line 258
    .line 259
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 260
    .line 261
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 262
    .line 263
    invoke-virtual {v2}, Ll/dkb;->k8()Z

    .line 264
    .line 265
    .line 266
    move-result v2

    .line 267
    if-nez v2, :cond_3

    .line 268
    .line 269
    goto :goto_2

    .line 270
    :cond_3
    const/4 v1, 0x0

    .line 271
    :goto_2
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 272
    .line 273
    .line 274
    goto :goto_4

    .line 275
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 276
    .line 277
    .line 278
    :cond_4
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->s:Ll/l4g0;

    .line 279
    .line 280
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 281
    .line 282
    .line 283
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->s:Ll/l4g0;

    .line 284
    .line 285
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 286
    .line 287
    .line 288
    return-void
.end method

.method public final getMediator()Ll/ndb0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getPurchaseType()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "purchaseType"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    return-object p0
.end method

.method public final get_content()Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->f:Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_content"

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

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/heb0;->a(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->x()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final r()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    const-string v2, "purchaseType"

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    move-object v1, v3

    .line 17
    :cond_0
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Ll/feb0;

    .line 30
    .line 31
    invoke-direct {v2, p0, v0}, Ll/feb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    move-object v1, v3

    .line 46
    :cond_2
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/data/PurchaseType;->getPrivilegeData(Lcom/p1/mobile/putong/data/Gender;)Ljava/util/ArrayList;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    new-instance v2, Ll/geb0;

    .line 62
    .line 63
    invoke-direct {v2, p0, v1, v0}, Ll/geb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;Ljava/util/List;Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    return-object v0

    .line 70
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    if-nez v1, :cond_4

    .line 73
    .line 74
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_4
    move-object v3, v1

    .line 79
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 80
    .line 81
    const/4 v1, 0x0

    .line 82
    invoke-static {v3, p0, v1}, Ll/j690;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    check-cast p0, Ljava/util/Collection;

    .line 90
    .line 91
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    return-object v0
.end method

.method public final s(Ll/ndb0;)V
    .locals 0
    .param p1    # Ll/ndb0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 2
    .line 3
    return-void
.end method

.method public final setAgreementRoot(Landroid/view/ViewGroup;)V
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->r:Landroid/view/ViewGroup;

    .line 5
    .line 6
    return-void
.end method

.method public final setDialogStateAction(Ll/y20;)V
    .locals 0
    .param p1    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->o:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final setInitSelectTab(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->v:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setMediator(Ll/ndb0;)V
    .locals 0
    .param p1    # Ll/ndb0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnNegativeClick(Ll/y20;)V
    .locals 0
    .param p1    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->q:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public final setOnPaymentSuccess(Ll/a30;)V
    .locals 0
    .param p1    # Ll/a30;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->p:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public final setPurchasePageTrack(Ll/lib0;)V
    .locals 0
    .param p1    # Ll/lib0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->l:Ll/lib0;

    .line 5
    .line 6
    return-void
.end method

.method public final set_content(Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->f:Lcom/p1/mobile/putong/newui/view/PreviousTouchLinearLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->k:Ll/l3m;

    .line 2
    .line 3
    instance-of v1, v0, Ll/oud0;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/oud0;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oud0;->l()V

    .line 14
    .line 15
    .line 16
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->u:Z

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->s:Ll/l4g0;

    .line 21
    .line 22
    invoke-static {v0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->u:Z

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->w:Ll/afb0;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/afb0;->s0(Z)V

    .line 33
    .line 34
    .line 35
    :cond_3
    return-void
.end method

.method public final u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->k:Ll/l3m;

    .line 2
    .line 3
    instance-of v1, v0, Ll/oud0;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Ll/oud0;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/oud0;->g()V

    .line 14
    .line 15
    .line 16
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->t:Ljava/util/List;

    .line 17
    .line 18
    check-cast v0, Ljava/util/Collection;

    .line 19
    .line 20
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x1

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->u:Z

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->u:Z

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->t:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->F(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->w:Ll/afb0;

    .line 39
    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0, v1}, Ll/afb0;->s0(Z)V

    .line 43
    .line 44
    .line 45
    :cond_3
    return-void
.end method

.method public final v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->g:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->j:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->J(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$b;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$b;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->I(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$c;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView$c;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->G(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final x()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->K()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->k:Ll/l3m;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {v0}, Ll/l3m;->release()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/w3m;

    .line 32
    .line 33
    invoke-interface {v0}, Ll/w3m;->release()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    return-void
.end method

.method public final y()V
    .locals 3

    .line 1
    new-instance v0, Ll/eeb0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eeb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;)V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->v:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->g:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    const-string p0, "act"

    .line 19
    .line 20
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    :cond_1
    const-wide/16 v1, 0x1f4

    .line 25
    .line 26
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final z()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const-string v1, "purchaseType"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v2

    .line 12
    :cond_0
    invoke-static {v0}, Ll/wib0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_8

    .line 17
    .line 18
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->g:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    const-string v4, "act"

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    new-instance v0, Ll/y8b0;

    .line 33
    .line 34
    if-nez v3, :cond_1

    .line 35
    .line 36
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    move-object v3, v2

    .line 40
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    if-nez v4, :cond_2

    .line 43
    .line 44
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    move-object v4, v2

    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 51
    .line 52
    invoke-direct {v0, v3, v4, v1, v5}, Ll/y8b0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    new-instance v0, Ll/u8b0;

    .line 57
    .line 58
    if-nez v3, :cond_4

    .line 59
    .line 60
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    move-object v3, v2

    .line 64
    :cond_4
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->h:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 65
    .line 66
    if-nez v4, :cond_5

    .line 67
    .line 68
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    move-object v4, v2

    .line 72
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->i:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->m:Ll/ndb0;

    .line 75
    .line 76
    invoke-direct {v0, v3, v4, v1, v5}, Ll/u8b0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->r:Landroid/view/ViewGroup;

    .line 80
    .line 81
    const-string v3, "_agreement_root"

    .line 82
    .line 83
    if-nez v1, :cond_6

    .line 84
    .line 85
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    move-object v1, v2

    .line 89
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->r:Landroid/view/ViewGroup;

    .line 90
    .line 91
    if-nez v4, :cond_7

    .line 92
    .line 93
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_7
    move-object v2, v4

    .line 98
    :goto_1
    invoke-interface {v0, v2}, Ll/w3m;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v0}, Ll/w3m;->register()V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/PurchaseParallelContentView;->n:Ljava/util/List;

    .line 109
    .line 110
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    :cond_8
    return-void
.end method
