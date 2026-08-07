.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00b6\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001:\u0001;B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0010J\u000f\u0010\u0015\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0010J\u001d\u0010\u0019\u001a\u00020\u000c2\u000c\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0016H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0019\u0010\u001d\u001a\u00020\u000c2\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u001bH\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0017\u0010!\u001a\u00020\u000c2\u0006\u0010 \u001a\u00020\u001fH\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\r\u0010#\u001a\u00020\u000c\u00a2\u0006\u0004\u0008#\u0010\u0010J\r\u0010$\u001a\u00020\u000c\u00a2\u0006\u0004\u0008$\u0010\u0010J\u0015\u0010&\u001a\u00020\u000c2\u0006\u0010%\u001a\u00020\u001f\u00a2\u0006\u0004\u0008&\u0010\"J\u001d\u0010)\u001a\u00020\u000c2\u000e\u0010(\u001a\n\u0012\u0004\u0012\u00020\'\u0018\u00010\u0016\u00a2\u0006\u0004\u0008)\u0010\u001aJ\u0017\u0010+\u001a\u00020\u000c2\u0008\u0010*\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008+\u0010,J\u0017\u0010/\u001a\u00020\u000c2\u0008\u0010.\u001a\u0004\u0018\u00010-\u00a2\u0006\u0004\u0008/\u00100J\u0017\u00102\u001a\u00020\u000c2\u0008\u00101\u001a\u0004\u0018\u00010-\u00a2\u0006\u0004\u00082\u00100J\u0017\u00104\u001a\u00020\u000c2\u0008\u00103\u001a\u0004\u0018\u00010-\u00a2\u0006\u0004\u00084\u00100J+\u00107\u001a\u00020\u000c2\u001c\u00106\u001a\u0018\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u000105\u00a2\u0006\u0004\u00087\u00108J\u0017\u0010:\u001a\u00020\u000c2\u0008\u00109\u001a\u0004\u0018\u00010-\u00a2\u0006\u0004\u0008:\u00100R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008;\u0010<R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008=\u0010>R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008?\u0010@R\"\u0010H\u001a\u00020A8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008B\u0010C\u001a\u0004\u0008D\u0010E\"\u0004\u0008F\u0010GR\"\u0010P\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008J\u0010K\u001a\u0004\u0008L\u0010M\"\u0004\u0008N\u0010OR\"\u0010T\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008Q\u0010K\u001a\u0004\u0008R\u0010M\"\u0004\u0008S\u0010OR\"\u0010X\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008U\u0010K\u001a\u0004\u0008V\u0010M\"\u0004\u0008W\u0010OR\"\u0010_\u001a\u00020Y8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\r\u0010Z\u001a\u0004\u0008[\u0010\\\"\u0004\u0008]\u0010^R\"\u0010c\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008`\u0010K\u001a\u0004\u0008a\u0010M\"\u0004\u0008b\u0010OR\u0018\u0010g\u001a\u0004\u0018\u00010d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008e\u0010fR\u0018\u0010k\u001a\u0004\u0018\u00010h8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008i\u0010jR\u001c\u0010p\u001a\u0008\u0012\u0004\u0012\u00020m0l8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008n\u0010oR\u0016\u0010s\u001a\u00020\u001f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008q\u0010rR\u0018\u0010v\u001a\u0004\u0018\u00010t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010uR\u0014\u0010y\u001a\u00020w8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010xR\u0016\u0010%\u001a\u00020\u001f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010rR\u001e\u0010(\u001a\n\u0012\u0004\u0012\u00020\'\u0018\u00010\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010oR\u0018\u0010\u001c\u001a\u0004\u0018\u00010\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008a\u0010zR\u0018\u0010*\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008[\u0010@R\u0018\u0010|\u001a\u0004\u0018\u00010-8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008D\u0010{R\u0018\u0010}\u001a\u0004\u0018\u00010-8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008V\u0010{R\u0018\u00103\u001a\u0004\u0018\u00010-8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008L\u0010{R,\u00106\u001a\u0018\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u0001058\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008R\u0010~R\u0018\u0010\u007f\u001a\u0004\u0018\u00010-8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010{R\u001b\u0010\u0082\u0001\u001a\u0005\u0018\u00010\u0080\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u0015\u0010\u0081\u0001R\u0017\u0010\u0083\u0001\u001a\u00020\u001f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010rR(\u0010\u0088\u0001\u001a\u0014\u0012\u000f\u0012\r \u0086\u0001*\u0005\u0018\u00010\u0085\u00010\u0085\u00010\u0084\u00018\u0002X\u0082\u0004\u00a2\u0006\u0007\n\u0005\u0008\u001d\u0010\u0087\u0001\u00a8\u0006\u0089\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;",
        "",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V",
        "Landroid/view/View;",
        "view",
        "",
        "h",
        "(Landroid/view/View;)V",
        "n",
        "()V",
        "z",
        "o",
        "()Landroid/view/View;",
        "x",
        "y",
        "",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "sections",
        "p",
        "(Ljava/util/List;)V",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "firstPrivilege",
        "A",
        "(Lcom/p1/mobile/putong/core/data/Privilege;)V",
        "",
        "dismissCallback",
        "J",
        "(Z)V",
        "K",
        "q",
        "renew",
        "I",
        "Ll/a690;",
        "privilegeDescriptions",
        "H",
        "otherUser",
        "G",
        "(Ljava/lang/String;)V",
        "Ll/x20;",
        "onCloseCallback",
        "B",
        "(Ll/x20;)V",
        "touchOutsideListener",
        "F",
        "onKeyBackCallback",
        "D",
        "Ll/a30;",
        "onPaymentSuccess",
        "E",
        "(Ll/a30;)V",
        "dismiss",
        "C",
        "a",
        "Lcom/p1/mobile/android/app/Act;",
        "b",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "c",
        "Ljava/lang/String;",
        "Lv/VScroll_Fill_BottomAligned;",
        "d",
        "Lv/VScroll_Fill_BottomAligned;",
        "t",
        "()Lv/VScroll_Fill_BottomAligned;",
        "set_content",
        "(Lv/VScroll_Fill_BottomAligned;)V",
        "_content",
        "Landroid/widget/FrameLayout;",
        "e",
        "Landroid/widget/FrameLayout;",
        "v",
        "()Landroid/widget/FrameLayout;",
        "set_privilege",
        "(Landroid/widget/FrameLayout;)V",
        "_privilege",
        "f",
        "w",
        "set_showcase",
        "_showcase",
        "g",
        "u",
        "set_payment",
        "_payment",
        "Lv/VImage;",
        "Lv/VImage;",
        "s",
        "()Lv/VImage;",
        "set_close",
        "(Lv/VImage;)V",
        "_close",
        "i",
        "r",
        "set_agreements",
        "_agreements",
        "Ll/l3m;",
        "j",
        "Ll/l3m;",
        "privilegeComponent",
        "Ll/ndb0;",
        "k",
        "Ll/ndb0;",
        "mediator",
        "",
        "Ll/w3m;",
        "l",
        "Ljava/util/List;",
        "purchaseComponentsList",
        "m",
        "Z",
        "isDialogShow",
        "Ll/lib0;",
        "Ll/lib0;",
        "purchasePageTrack",
        "Ll/l4g0;",
        "Ll/l4g0;",
        "statisticsPageHelper",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "Ll/x20;",
        "onCloseClick",
        "onTouchOutsideCallback",
        "Ll/a30;",
        "onDismiss",
        "Lcom/p1/mobile/android/app/Dialog;",
        "Lcom/p1/mobile/android/app/Dialog;",
        "dialog",
        "shouldDismissCallback",
        "Ll/y20;",
        "",
        "kotlin.jvm.PlatformType",
        "Ll/y20;",
        "dialogStateAction",
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
.field public final A:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Lv/VScroll_Fill_BottomAligned;

.field public e:Landroid/widget/FrameLayout;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/VImage;

.field public i:Landroid/widget/FrameLayout;

.field public j:Ll/l3m;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public k:Ll/ndb0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public l:Ljava/util/List;
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

.field public m:Z

.field public n:Ll/lib0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final o:Ll/l4g0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public p:Z

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public r:Lcom/p1/mobile/putong/core/data/Privilege;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public s:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public t:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public u:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public v:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public w:Ll/a30;
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

.field public x:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public y:Lcom/p1/mobile/android/app/Dialog;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public z:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 15
    .line 16
    new-instance p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->l:Ljava/util/List;

    .line 22
    .line 23
    new-instance p1, Ll/l4g0;

    .line 24
    .line 25
    new-instance p2, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$e;

    .line 26
    .line 27
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$e;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-direct {p1, p2}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->o:Ll/l4g0;

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->z:Z

    .line 37
    .line 38
    new-instance p1, Ll/aib0;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ll/aib0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->A:Ll/y20;

    .line 44
    .line 45
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->A:Ll/y20;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->t:Ll/x20;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->y:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    if-eq p1, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq p1, v1, :cond_0

    .line 17
    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->y:Lcom/p1/mobile/android/app/Dialog;

    .line 22
    .line 23
    if-eqz p0, :cond_4

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    if-ne p1, v0, :cond_2

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->J(Z)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->y:Lcom/p1/mobile/android/app/Dialog;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->y:Lcom/p1/mobile/android/app/Dialog;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/app/Dialog;->hide()V

    .line 48
    .line 49
    .line 50
    :cond_4
    :goto_0
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->E9()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->z()V

    .line 13
    .line 14
    .line 15
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->m:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->o:Ll/l4g0;

    .line 20
    .line 21
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->z:Z

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->x:Ll/x20;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-interface {p0}, Ll/x20;->call()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
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

.method public static f(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->A:Ll/y20;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->u:Ll/x20;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 p3, 0x0

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    if-ne p2, p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->A:Ll/y20;

    .line 15
    .line 16
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-interface {p1, p2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->v:Ll/x20;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return p3
.end method

.method public static final synthetic i(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->p(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic j(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)Ll/lib0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->n:Ll/lib0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic k(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public static final synthetic l(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic m(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->A(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->r:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-void
.end method

.method public final B(Ll/x20;)V
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->t:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final C(Ll/x20;)V
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->x:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final D(Ll/x20;)V
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->v:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final E(Ll/a30;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->w:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public final F(Ll/x20;)V
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->u:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final G(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final H(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ll/a690;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->q:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public final I(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public final J(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->z:Z

    .line 2
    .line 3
    return-void
.end method

.method public final K()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v0, Ll/beb0;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;->pop_one:Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;

    .line 22
    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {v0, v1, v2, v3}, Ll/beb0;-><init>(Lcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/ui/purchase/mediator/track/PurchaseTrackPageType;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->n:Ll/lib0;

    .line 29
    .line 30
    new-instance v0, Ll/ndb0;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-direct {v0, v1, v2, v3}, Ll/ndb0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->n:Ll/lib0;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->P(Ll/lib0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->n()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->x()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dib0;->a(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->o()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/dgc0;->j:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/whb0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/whb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/xhb0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/xhb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/yhb0;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/yhb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->i0(Landroid/content/DialogInterface$OnKeyListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/zhb0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/zhb0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->K0(Lcom/p1/mobile/android/app/Dialog$i;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Ll/g6e;->a:Lcom/p1/mobile/android/app/Dialog$f;

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->y0(Lcom/p1/mobile/android/app/Dialog$f;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->y:Lcom/p1/mobile/android/app/Dialog;

    .line 73
    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 77
    .line 78
    .line 79
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->n:Ll/lib0;

    .line 80
    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ll/lib0;->v(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 93
    .line 94
    .line 95
    :cond_1
    return-void
.end method

.method public final o()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/rec0;->I1:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->h(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 21
    .line 22
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_6

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 29
    .line 30
    invoke-static {v1}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_6

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 37
    .line 38
    invoke-static {v1}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 46
    .line 47
    invoke-static {v1}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_5

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 54
    .line 55
    invoke-static {v1}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 63
    .line 64
    invoke-static {v1}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    sget v1, Ll/jbc0;->P5:I

    .line 71
    .line 72
    goto :goto_2

    .line 73
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 74
    .line 75
    invoke-static {v1}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    sget v1, Ll/jbc0;->W7:I

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 85
    .line 86
    invoke-static {v1}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    sget v1, Ll/jbc0;->X7:I

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_4
    sget v1, Ll/jbc0;->J9:I

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_5
    :goto_0
    sget v1, Ll/jbc0;->J:I

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_6
    :goto_1
    sget v1, Ll/jbc0;->m4:I

    .line 102
    .line 103
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->t()Lv/VScroll_Fill_BottomAligned;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 111
    .line 112
    invoke-static {v1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_8

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 119
    .line 120
    invoke-static {v1}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-nez v1, :cond_8

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 127
    .line 128
    invoke-static {v1}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_7

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_7
    sget v1, Ll/jbc0;->Ua:I

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_8
    :goto_3
    sget v1, Ll/jbc0;->Va:I

    .line 139
    .line 140
    :goto_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->s()Lv/VImage;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->s()Lv/VImage;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    const/4 v2, 0x1

    .line 152
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->s()Lv/VImage;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    new-instance v2, Ll/bib0;

    .line 160
    .line 161
    invoke-direct {v2, p0}, Ll/bib0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 162
    .line 163
    .line 164
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 165
    .line 166
    .line 167
    return-object v0
.end method

.method public final p(Ljava/util/List;)V
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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "productType"

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/mib0;->j(Ljava/util/List;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ljava/util/Collection;

    .line 37
    .line 38
    const-string v3, ","

    .line 39
    .line 40
    invoke-static {v2, v3}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const-string v3, "skuGroup"

    .line 45
    .line 46
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string v2, "default_product"

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, v1}, Ll/tab0;->p(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, "default_duration"

    .line 67
    .line 68
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    check-cast p1, Ljava/util/Collection;

    .line 72
    .line 73
    new-instance v1, Ll/cib0;

    .line 74
    .line 75
    invoke-direct {v1}, Ll/cib0;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    const-string v1, "if_sale"
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    const-string v2, "no"

    .line 89
    .line 90
    const-string v3, "yes"

    .line 91
    .line 92
    if-eqz p1, :cond_0

    .line 93
    .line 94
    move-object v4, v3

    .line 95
    goto :goto_0

    .line 96
    :cond_0
    move-object v4, v2

    .line 97
    :goto_0
    :try_start_1
    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    const-string v1, "if_discount"

    .line 101
    .line 102
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 103
    .line 104
    .line 105
    const-string p1, "if_double_tab"

    .line 106
    .line 107
    const/4 v1, 0x0

    .line 108
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 109
    .line 110
    .line 111
    const-string p1, "function_type"

    .line 112
    .line 113
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->r:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 114
    .line 115
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v4, v5}, Ll/mib0;->f(Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 122
    .line 123
    .line 124
    const-string p1, "tooltips_trigger_mode"

    .line 125
    .line 126
    const-string v4, "active"

    .line 127
    .line 128
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 129
    .line 130
    .line 131
    const-string p1, "tooltips_type_ui"

    .line 132
    .line 133
    const-string v4, "alert_self_definition_business_a"

    .line 134
    .line 135
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    const-string p1, "tooltips_trigger_module"

    .line 139
    .line 140
    const-string v4, "purchase_button"

    .line 141
    .line 142
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 143
    .line 144
    .line 145
    const-string p1, "tooltips_trigger_page"

    .line 146
    .line 147
    const-string v4, "anywhere"

    .line 148
    .line 149
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 150
    .line 151
    .line 152
    const-string p1, "tooltips_type"

    .line 153
    .line 154
    const-string v4, "alert"

    .line 155
    .line 156
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 157
    .line 158
    .line 159
    const-string p1, "tooltips_trigger_reason"

    .line 160
    .line 161
    const-string v4, "purchase"

    .line 162
    .line 163
    invoke-virtual {v0, p1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    .line 165
    .line 166
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->U()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_1

    .line 179
    .line 180
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 181
    .line 182
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 183
    .line 184
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->w3()Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-eqz p1, :cond_1

    .line 189
    .line 190
    move-object v2, v3

    .line 191
    goto :goto_1

    .line 192
    :catch_0
    move-exception p1

    .line 193
    goto :goto_2

    .line 194
    :cond_1
    :goto_1
    const-string p1, "no_secret_payment"

    .line 195
    .line 196
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    const-string p1, "user_secret_staus"

    .line 200
    .line 201
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 202
    .line 203
    .line 204
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-interface {p1}, Ll/r97;->N()Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-eqz p1, :cond_3

    .line 217
    .line 218
    const-string p1, "is_fakeunreal"

    .line 219
    .line 220
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 221
    .line 222
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 223
    .line 224
    invoke-virtual {v2}, Ll/dkb;->Z7()Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-eqz v2, :cond_2

    .line 229
    .line 230
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 231
    .line 232
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 233
    .line 234
    invoke-virtual {v2}, Ll/dkb;->W7()Z

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-nez v2, :cond_2

    .line 239
    .line 240
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 241
    .line 242
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 243
    .line 244
    invoke-virtual {v2}, Ll/dkb;->k8()Z

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    if-nez v2, :cond_2

    .line 249
    .line 250
    const/4 v1, 0x1

    .line 251
    :cond_2
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 252
    .line 253
    .line 254
    goto :goto_3

    .line 255
    :goto_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 256
    .line 257
    .line 258
    :cond_3
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->o:Ll/l4g0;

    .line 259
    .line 260
    invoke-virtual {p1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 261
    .line 262
    .line 263
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->o:Ll/l4g0;

    .line 264
    .line 265
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 266
    .line 267
    .line 268
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->y:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final r()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->i:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_agreements"

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

.method public final s()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->h:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_close"

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

.method public final t()Lv/VScroll_Fill_BottomAligned;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->d:Lv/VScroll_Fill_BottomAligned;

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

.method public final u()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_payment"

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

.method public final v()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->e:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_privilege"

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

.method public final w()Landroid/widget/FrameLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_showcase"

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

.method public final x()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const/4 v4, 0x1

    .line 9
    invoke-static {v0, v1, v2, v3, v4}, Ll/pab0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;ZZ)Ll/l3m;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->j:Ll/l3m;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->v()Landroid/widget/FrameLayout;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v0, v2, v3}, Ll/l3m;->a(Landroid/view/ViewGroup;Z)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, v1

    .line 28
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->j:Ll/l3m;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->q:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v2, v3}, Ll/l3m;->c(Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 38
    .line 39
    const/4 v3, -0x1

    .line 40
    const/4 v5, -0x2

    .line 41
    invoke-direct {v2, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->v()Landroid/widget/FrameLayout;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->j:Ll/l3m;

    .line 52
    .line 53
    instance-of v2, v0, Ll/oud0;

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    move-object v1, v0

    .line 58
    check-cast v1, Ll/oud0;

    .line 59
    .line 60
    :cond_2
    if-eqz v1, :cond_3

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/oud0;->g()V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 66
    .line 67
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 74
    .line 75
    invoke-static {v0}, Ll/wib0;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 82
    .line 83
    invoke-static {v0}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_5

    .line 88
    .line 89
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->w()Landroid/widget/FrameLayout;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 101
    .line 102
    invoke-static {v4}, Ll/txq;->c(I)I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 107
    .line 108
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->w()Landroid/widget/FrameLayout;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .line 116
    .line 117
    :cond_5
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-eqz v0, :cond_6

    .line 126
    .line 127
    new-instance v0, Ll/hib0;

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 130
    .line 131
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 132
    .line 133
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 134
    .line 135
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 136
    .line 137
    invoke-direct {v0, v1, v2, v3, v5}, Ll/hib0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_6
    new-instance v0, Ll/eib0;

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 146
    .line 147
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 150
    .line 151
    invoke-direct {v0, v1, v2, v3, v5}, Ll/eib0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 152
    .line 153
    .line 154
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->w()Landroid/widget/FrameLayout;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->w()Landroid/widget/FrameLayout;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-interface {v0, v2}, Ll/w3m;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 167
    .line 168
    .line 169
    invoke-interface {v0}, Ll/w3m;->register()V

    .line 170
    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->l:Ljava/util/List;

    .line 173
    .line 174
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 178
    .line 179
    invoke-static {v0}, Ll/wib0;->e(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_8

    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 186
    .line 187
    invoke-static {v0}, Ll/wib0;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_7

    .line 192
    .line 193
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 194
    .line 195
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->v9()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_7

    .line 204
    .line 205
    invoke-static {}, Ll/joa;->M3()Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-nez v0, :cond_7

    .line 210
    .line 211
    goto :goto_2

    .line 212
    :cond_7
    new-instance v0, Ll/xeb0;

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 215
    .line 216
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 217
    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 219
    .line 220
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 221
    .line 222
    invoke-direct {v0, v1, v2, v3, v5}, Ll/xeb0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 223
    .line 224
    .line 225
    goto :goto_3

    .line 226
    :cond_8
    :goto_2
    new-instance v0, Ll/teb0;

    .line 227
    .line 228
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 229
    .line 230
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 231
    .line 232
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 235
    .line 236
    invoke-direct {v0, v1, v2, v3, v5}, Ll/teb0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 237
    .line 238
    .line 239
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->u()Landroid/widget/FrameLayout;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->u()Landroid/widget/FrameLayout;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    invoke-virtual {v0, v2}, Ll/xeb0;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 252
    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->w:Ll/a30;

    .line 255
    .line 256
    invoke-virtual {v0, v1}, Ll/l5;->Q(Ll/a30;)V

    .line 257
    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->r:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 260
    .line 261
    invoke-virtual {v0, v1}, Ll/l5;->P(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 262
    .line 263
    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->A:Ll/y20;

    .line 265
    .line 266
    invoke-virtual {v0, v1}, Ll/l5;->O(Ll/y20;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0}, Ll/l5;->register()V

    .line 270
    .line 271
    .line 272
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->l:Ljava/util/List;

    .line 273
    .line 274
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 278
    .line 279
    invoke-static {v0}, Ll/wib0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-eqz v0, :cond_a

    .line 284
    .line 285
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->r()Landroid/widget/FrameLayout;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 290
    .line 291
    .line 292
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->a:Lcom/p1/mobile/android/app/Act;

    .line 301
    .line 302
    if-eqz v0, :cond_9

    .line 303
    .line 304
    new-instance v0, Ll/y8b0;

    .line 305
    .line 306
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 307
    .line 308
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 309
    .line 310
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 311
    .line 312
    invoke-direct {v0, v1, v2, v3, v4}, Ll/y8b0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 313
    .line 314
    .line 315
    goto :goto_4

    .line 316
    :cond_9
    new-instance v0, Ll/u8b0;

    .line 317
    .line 318
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 319
    .line 320
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->c:Ljava/lang/String;

    .line 321
    .line 322
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 323
    .line 324
    invoke-direct {v0, v1, v2, v3, v4}, Ll/u8b0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 325
    .line 326
    .line 327
    :goto_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->r()Landroid/widget/FrameLayout;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->r()Landroid/widget/FrameLayout;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    invoke-interface {v0, v2}, Ll/w3m;->a(Landroid/view/ViewGroup;)Landroid/view/View;

    .line 336
    .line 337
    .line 338
    move-result-object v2

    .line 339
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 340
    .line 341
    .line 342
    invoke-interface {v0}, Ll/w3m;->register()V

    .line 343
    .line 344
    .line 345
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->l:Ljava/util/List;

    .line 346
    .line 347
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    :cond_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->y()V

    .line 351
    .line 352
    .line 353
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 354
    .line 355
    if-eqz v0, :cond_b

    .line 356
    .line 357
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->w()V

    .line 358
    .line 359
    .line 360
    :cond_b
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->l:Ljava/util/List;

    .line 361
    .line 362
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-eqz v0, :cond_c

    .line 371
    .line 372
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    check-cast v0, Ll/w3m;

    .line 377
    .line 378
    invoke-interface {v0}, Ll/w3m;->b()V

    .line 379
    .line 380
    .line 381
    goto :goto_5

    .line 382
    :cond_c
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$b;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$b;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->J(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$c;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$c;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->I(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$d;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$d;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;)V

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

.method public final z()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->k:Ll/ndb0;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->j:Ll/l3m;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->l:Ljava/util/List;

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
