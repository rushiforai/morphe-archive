.class public abstract Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;,
        Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;,
        Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;,
        Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;,
        Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00a6\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0016\n\u0002\u0010\u000b\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010!\n\u0002\u0008\u0015\u0008&\u0018\u00002\u00020\u0001:\u0005hu!plB!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u001d\u0010\u000e\u001a\u00020\r2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\r\u0010\u0011\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0014\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\rH\u0004\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\rH\u0004\u00a2\u0006\u0004\u0008\u0019\u0010\u0017J\u001f\u0010\u001c\u001a\u00020\u00102\u0006\u0010\u001a\u001a\u00020\u000b2\u0006\u0010\u001b\u001a\u00020\u0010H\u0004\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0015\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nH\u0004\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ-\u0010!\u001a\u00020\r2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n2\u0006\u0010\u001b\u001a\u00020\u00102\u0006\u0010 \u001a\u00020\u0013H\u0014\u00a2\u0006\u0004\u0008!\u0010\"J\u001f\u0010#\u001a\u0004\u0018\u00010\u000b2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nH\u0004\u00a2\u0006\u0004\u0008#\u0010$J%\u0010%\u001a\u00020\r2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n2\u0006\u0010 \u001a\u00020\u0013H\u0004\u00a2\u0006\u0004\u0008%\u0010&J\u001f\u0010(\u001a\u00020\r2\u0006\u0010\'\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\u0013H\u0014\u00a2\u0006\u0004\u0008(\u0010)J\u001f\u0010+\u001a\u00020*2\u0006\u0010\'\u001a\u00020\u000b2\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u0010\u00a2\u0006\u0004\u0008+\u0010,J\u0017\u0010-\u001a\u00020*2\u0006\u0010\'\u001a\u00020\u000bH\u0004\u00a2\u0006\u0004\u0008-\u0010.J\u0013\u0010/\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n\u00a2\u0006\u0004\u0008/\u0010\u001fJ\r\u00100\u001a\u00020\u0013\u00a2\u0006\u0004\u00080\u0010\u0015J\r\u00101\u001a\u00020\u0010\u00a2\u0006\u0004\u00081\u0010\u0012J\u000f\u00102\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0004\u00082\u00103J\u0017\u00105\u001a\u00020\r2\u0008\u00104\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u00085\u00106J\u000f\u00108\u001a\u0004\u0018\u000107\u00a2\u0006\u0004\u00088\u00109J\u0017\u0010;\u001a\u00020\r2\u0008\u0010:\u001a\u0004\u0018\u000107\u00a2\u0006\u0004\u0008;\u0010<J\r\u0010=\u001a\u00020*\u00a2\u0006\u0004\u0008=\u0010>J\u0015\u0010A\u001a\u00020\r2\u0006\u0010@\u001a\u00020?\u00a2\u0006\u0004\u0008A\u0010BJ\u000f\u0010C\u001a\u0004\u0018\u00010?\u00a2\u0006\u0004\u0008C\u0010DJ\u000f\u0010E\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008E\u0010\u0017J\u001d\u0010F\u001a\u00020\r2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nH\u0004\u00a2\u0006\u0004\u0008F\u0010\u000fJ3\u0010J\u001a\u00020*2\u0006\u0010\'\u001a\u00020\u000b2\u0008\u0010G\u001a\u0004\u0018\u00010\u000b2\u0006\u0010H\u001a\u00020*2\u0008\u0008\u0002\u0010I\u001a\u00020*H\u0004\u00a2\u0006\u0004\u0008J\u0010KJ\u0017\u0010L\u001a\u00020*2\u0006\u0010\u001b\u001a\u00020\u0010H\u0004\u00a2\u0006\u0004\u0008L\u0010MJ\u0017\u0010N\u001a\u00020*2\u0006\u0010 \u001a\u00020\u0013H\u0004\u00a2\u0006\u0004\u0008N\u0010OJ\u001d\u0010R\u001a\u00020*2\u0006\u0010Q\u001a\u00020P2\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008R\u0010SJ\u0015\u0010V\u001a\u00020\r2\u0006\u0010U\u001a\u00020T\u00a2\u0006\u0004\u0008V\u0010WJ\u0015\u0010Z\u001a\u00020\r2\u0006\u0010Y\u001a\u00020X\u00a2\u0006\u0004\u0008Z\u0010[J\u0015\u0010^\u001a\u00020\r2\u0006\u0010]\u001a\u00020\\\u00a2\u0006\u0004\u0008^\u0010_J\u0015\u0010b\u001a\u00020\r2\u0006\u0010a\u001a\u00020`\u00a2\u0006\u0004\u0008b\u0010cJ\u0015\u0010f\u001a\u00020\r2\u0006\u0010e\u001a\u00020d\u00a2\u0006\u0004\u0008f\u0010gR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008h\u0010i\u001a\u0004\u0008j\u0010kR\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008l\u0010m\u001a\u0004\u0008n\u0010oR\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008p\u0010q\u001a\u0004\u0008r\u0010sR\u0018\u0010w\u001a\u0004\u0018\u00010t8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008u\u0010vR\u001c\u0010z\u001a\u0008\u0012\u0004\u0012\u00020x0\n8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008!\u0010yR(\u0010}\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\n8\u0004@\u0004X\u0084.\u00a2\u0006\u0012\n\u0004\u0008(\u0010y\u001a\u0004\u0008{\u0010\u001f\"\u0004\u0008|\u0010\u000fR\u0017\u0010\u0080\u0001\u001a\u00020~8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008%\u0010\u007fR\u001e\u0010\u0082\u0001\u001a\t\u0012\u0004\u0012\u00020\u000b0\u0081\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010yR!\u0010\u0085\u0001\u001a\u000b \u0083\u0001*\u0004\u0018\u00010\u00100\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008\u001e\u0010\u0084\u0001R\u0018\u0010\u0087\u0001\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008#\u0010\u0086\u0001R\u001a\u0010\u0089\u0001\u001a\u0004\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008j\u0010\u0088\u0001R\u001a\u0010\u008a\u0001\u001a\u0004\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u00080\u0010\u0088\u0001R\u001a\u0010\u008b\u0001\u001a\u0004\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u00081\u0010\u0088\u0001R\u0018\u00104\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00082\u0010qR\u001a\u0010\u008d\u0001\u001a\u0004\u0018\u00010?8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008C\u0010\u008c\u0001R\u0019\u0010:\u001a\u0004\u0018\u0001078\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0007\n\u0005\u0008{\u0010\u008e\u0001R\u001e\u0010\u008f\u0001\u001a\t\u0012\u0004\u0012\u00020T0\u0081\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00088\u0010yR\u001e\u0010\u0090\u0001\u001a\t\u0012\u0004\u0012\u00020X0\u0081\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008n\u0010yR\u001e\u0010\u0091\u0001\u001a\t\u0012\u0004\u0012\u00020\\0\u0081\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008-\u0010yR\u001e\u0010\u0092\u0001\u001a\t\u0012\u0004\u0012\u00020`0\u0081\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010yR\u001e\u0010\u0093\u0001\u001a\t\u0012\u0004\u0012\u00020d0\u0081\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010yR\u0013\u0010\u0095\u0001\u001a\u00020*8F\u00a2\u0006\u0007\u001a\u0005\u0008\u0094\u0001\u0010>\u00a8\u0006\u0096\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;",
        "",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V",
        "",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "sections",
        "",
        "S",
        "(Ljava/util/List;)V",
        "Lcom/p1/mobile/putong/data/PayMethod;",
        "u",
        "()Lcom/p1/mobile/putong/data/PayMethod;",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;",
        "t",
        "()Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;",
        "v",
        "()V",
        "w",
        "L",
        "it",
        "payMethod",
        "h",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)Lcom/p1/mobile/putong/data/PayMethod;",
        "i",
        "()Ljava/util/List;",
        "agreementState",
        "e",
        "(Ljava/util/List;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V",
        "j",
        "(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "g",
        "(Ljava/util/List;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V",
        "section",
        "f",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V",
        "",
        "R",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)Z",
        "s",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d;)Z",
        "M",
        "l",
        "m",
        "n",
        "()Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "selectCouponId",
        "Q",
        "(Ljava/lang/String;)V",
        "Ll/lib0;",
        "q",
        "()Ll/lib0;",
        "purchaseTrack",
        "P",
        "(Ll/lib0;)V",
        "x",
        "()Z",
        "Ll/pbb0;",
        "extra",
        "N",
        "(Ll/pbb0;)V",
        "o",
        "()Ll/pbb0;",
        "K",
        "E",
        "sectionWithExtra",
        "scroll",
        "isClick",
        "B",
        "(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/d;ZZ)Z",
        "z",
        "(Lcom/p1/mobile/putong/data/PayMethod;)Z",
        "D",
        "(Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)Z",
        "Ll/jn60;",
        "paymentHandlerData",
        "A",
        "(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;",
        "iPayMethod",
        "F",
        "(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;)V",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;",
        "iPurchaseSectionListener",
        "I",
        "(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;)V",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;",
        "iPurchaseSectionsListListener",
        "J",
        "(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;)V",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;",
        "iPurchaseSectionCheckStateListener",
        "H",
        "(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;)V",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;",
        "iPurchasePaymentClickListener",
        "G",
        "(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;)V",
        "a",
        "Lcom/p1/mobile/android/app/Act;",
        "k",
        "()Lcom/p1/mobile/android/app/Act;",
        "b",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "r",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "c",
        "Ljava/lang/String;",
        "getFrom",
        "()Ljava/lang/String;",
        "Ll/kcg0;",
        "d",
        "Ll/kcg0;",
        "merchandiseSubs",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "Ljava/util/List;",
        "merchandises",
        "p",
        "O",
        "purchaseSectionsSource",
        "Ll/k8f0;",
        "Ll/k8f0;",
        "showcaseNewFilterChain",
        "",
        "renderSections",
        "kotlin.jvm.PlatformType",
        "Lcom/p1/mobile/putong/data/PayMethod;",
        "currentPayMethod",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;",
        "currentAgreementState",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "currentPurchaseSection",
        "currentPurchaseSectionWithExtra",
        "currentUsedPurchaseSection",
        "Ll/pbb0;",
        "purchaseExtra",
        "Ll/lib0;",
        "payMethodListeners",
        "purchaseSectionsListeners",
        "purchaseSectionsListListeners",
        "purchaseSectionCheckSateListeners",
        "purchasePaymentClickListeners",
        "y",
        "isSectionsInitialized",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
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

.field public d:Ll/kcg0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/k8f0;

.field public h:Ljava/util/List;
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

.field public i:Lcom/p1/mobile/putong/data/PayMethod;

.field public j:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public k:Lcom/p1/mobile/putong/core/ui/purchase/d;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/core/ui/purchase/d;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/core/ui/purchase/d;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public n:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public o:Ll/pbb0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public p:Ll/lib0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public u:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->c:Ljava/lang/String;

    .line 15
    .line 16
    new-instance p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->h:Ljava/util/List;

    .line 22
    .line 23
    const-string p1, "unknown_"

    .line 24
    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->i:Lcom/p1/mobile/putong/data/PayMethod;

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->UNKNOWN_:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->j:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 34
    .line 35
    new-instance p1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q:Ljava/util/List;

    .line 41
    .line 42
    new-instance p1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->r:Ljava/util/List;

    .line 48
    .line 49
    new-instance p1, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->s:Ljava/util/List;

    .line 55
    .line 56
    new-instance p1, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->t:Ljava/util/List;

    .line 62
    .line 63
    new-instance p1, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->u:Ljava/util/List;

    .line 69
    .line 70
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/d;ZZILjava/lang/Object;)Z
    .locals 0

    .line 1
    if-nez p6, :cond_1

    .line 2
    .line 3
    and-int/lit8 p5, p5, 0x8

    .line 4
    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->B(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/d;ZZ)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_1
    const-string p0, "Super calls with default arguments not supported in this target, function: notifyPurchaseSection"

    .line 14
    .line 15
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static a(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    check-cast p0, Ljava/util/Collection;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->n:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1, p0}, Ll/v5b0;->j(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;Ljava/util/List;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->e:Ljava/util/List;

    .line 5
    .line 6
    new-instance v0, Ll/ory;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/ory;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/ory;->c(Ljava/util/List;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->O(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->v()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->L()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static d(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public final A(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
    .locals 1
    .param p1    # Ll/jn60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->u:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;

    .line 24
    .line 25
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;->a(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public final B(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/d;ZZ)Z
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/purchase/d;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move-object v0, p2

    .line 9
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->s(Lcom/p1/mobile/putong/core/ui/purchase/d;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->k:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->l:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 20
    .line 21
    if-nez p2, :cond_2

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    goto :goto_1

    .line 25
    :cond_2
    move-object v0, p2

    .line 26
    :goto_1
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->m:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->r:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_5

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;

    .line 45
    .line 46
    if-nez p2, :cond_3

    .line 47
    .line 48
    move-object v1, p1

    .line 49
    goto :goto_3

    .line 50
    :cond_3
    move-object v1, p2

    .line 51
    :goto_3
    if-nez p2, :cond_4

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    goto :goto_4

    .line 55
    :cond_4
    move-object v2, p1

    .line 56
    :goto_4
    invoke-interface {v0, v1, p3, p4, v2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;->a(Lcom/p1/mobile/putong/core/ui/purchase/d;ZZLcom/p1/mobile/putong/core/ui/purchase/d;)V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_5
    const/4 p0, 0x1

    .line 61
    return p0
.end method

.method public final D(Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)Z
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->j:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 5
    .line 6
    if-ne v0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->j:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->t:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;

    .line 29
    .line 30
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;->a(Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public final E(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
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
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->h:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->h:Ljava/util/List;

    .line 10
    .line 11
    move-object v1, p1

    .line 12
    check-cast v1, Ljava/util/Collection;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->s:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;

    .line 34
    .line 35
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;->a(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method public final F(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->u:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->u:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->t:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->t:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final I(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->r:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->r:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$e;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->s:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->s:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->d:Ll/kcg0;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->o:Ll/pbb0;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pbb0;->n()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final L()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->u()Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->t()Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->i()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->S(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->e(Ljava/util/List;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->j(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->o:Ll/pbb0;

    .line 24
    .line 25
    const/4 v5, 0x0

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/pbb0;->l()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/4 v6, 0x1

    .line 33
    if-ne v3, v6, :cond_0

    .line 34
    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->o:Ll/pbb0;

    .line 38
    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ll/pbb0;->i(Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    :cond_0
    if-eqz v4, :cond_2

    .line 46
    .line 47
    if-nez v5, :cond_1

    .line 48
    .line 49
    move-object v3, v4

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move-object v3, v5

    .line 52
    :goto_0
    invoke-virtual {p0, v3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->h(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->z(Lcom/p1/mobile/putong/data/PayMethod;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->D(Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)Z

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->E(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    const/16 v8, 0x8

    .line 66
    .line 67
    const/4 v9, 0x0

    .line 68
    const/4 v6, 0x0

    .line 69
    const/4 v7, 0x0

    .line 70
    move-object v3, p0

    .line 71
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->C(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/d;ZZILjava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method

.method public final M()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final N(Ll/pbb0;)V
    .locals 0
    .param p1    # Ll/pbb0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->o:Ll/pbb0;

    .line 5
    .line 6
    return-void
.end method

.method public final O(Ljava/util/List;)V
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
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
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->f:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method

.method public final P(Ll/lib0;)V
    .locals 0
    .param p1    # Ll/lib0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->p:Ll/lib0;

    .line 2
    .line 3
    return-void
.end method

.method public final Q(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)Z
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/PayMethod;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "jingdong"

    .line 5
    .line 6
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_5

    .line 11
    .line 12
    const-string v0, "alipay"

    .line 13
    .line 14
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->u3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_5

    .line 45
    .line 46
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 47
    .line 48
    invoke-static {v0}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 79
    .line 80
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    const-string v0, "wechat"

    .line 85
    .line 86
    if-eqz p1, :cond_2

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->x()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_2

    .line 93
    .line 94
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_5

    .line 99
    .line 100
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 101
    .line 102
    invoke-static {p1}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_3

    .line 107
    .line 108
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_5

    .line 113
    .line 114
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 115
    .line 116
    invoke-static {p0}, Ll/wib0;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-eqz p0, :cond_4

    .line 121
    .line 122
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_4

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_4
    const/4 p0, 0x1

    .line 130
    return p0

    .line 131
    :cond_5
    :goto_0
    const/4 p0, 0x0

    .line 132
    return p0
.end method

.method public final S(Ljava/util/List;)V
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
    invoke-static {}, Ll/s7a;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->n:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_5

    .line 15
    .line 16
    move-object v0, p1

    .line 17
    check-cast v0, Ljava/lang/Iterable;

    .line 18
    .line 19
    new-instance v2, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_3

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    move-object v4, v3

    .line 39
    check-cast v4, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-nez v5, :cond_1

    .line 46
    .line 47
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    check-cast v5, Ljava/util/Collection;

    .line 61
    .line 62
    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_2

    .line 67
    .line 68
    :cond_1
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_0

    .line 73
    .line 74
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 83
    .line 84
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    check-cast v4, Ljava/util/Collection;

    .line 88
    .line 89
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-nez v4, :cond_0

    .line 94
    .line 95
    :cond_2
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_3
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_5

    .line 104
    .line 105
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_5

    .line 110
    .line 111
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_4

    .line 122
    .line 123
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    goto :goto_1

    .line 138
    :cond_4
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-eqz v2, :cond_5

    .line 157
    .line 158
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 159
    .line 160
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    .line 162
    .line 163
    check-cast v2, Ljava/util/Collection;

    .line 164
    .line 165
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-nez v2, :cond_5

    .line 170
    .line 171
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 172
    .line 173
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->n:Ljava/lang/String;

    .line 182
    .line 183
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->n:Ljava/lang/String;

    .line 184
    .line 185
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_7

    .line 190
    .line 191
    new-instance v0, Ll/d5;

    .line 192
    .line 193
    invoke-direct {v0, p0}, Ll/d5;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;)V

    .line 194
    .line 195
    .line 196
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-ltz p0, :cond_7

    .line 201
    .line 202
    check-cast p1, Ljava/lang/Iterable;

    .line 203
    .line 204
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    move v0, v1

    .line 209
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    if-eqz v2, :cond_7

    .line 214
    .line 215
    add-int/lit8 v2, v0, 0x1

    .line 216
    .line 217
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    check-cast v3, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 222
    .line 223
    if-ne v0, p0, :cond_6

    .line 224
    .line 225
    const/4 v0, 0x1

    .line 226
    goto :goto_3

    .line 227
    :cond_6
    move v0, v1

    .line 228
    :goto_3
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 229
    .line 230
    .line 231
    move v0, v2

    .line 232
    goto :goto_2

    .line 233
    :cond_7
    return-void
.end method

.method public e(Ljava/util/List;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/PayMethod;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->x()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 32
    .line 33
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->R(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const/4 v2, 0x0

    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->CHECKED:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 41
    .line 42
    if-ne p3, v1, :cond_1

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    :cond_1
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    :goto_1
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->x()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x1

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->CHECKED:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 19
    .line 20
    if-ne p2, p0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    :goto_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->w(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final g(Ljava/util/List;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 22
    .line 23
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->f(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/data/PayMethod;)Lcom/p1/mobile/putong/data/PayMethod;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/PayMethod;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    invoke-static {p0}, Ll/wib0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_6

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :goto_0
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, p0}, Ll/tab0;->x(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    const/4 p1, 0x0

    .line 56
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_5

    .line 74
    .line 75
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    check-cast p2, Lcom/p1/mobile/putong/data/PayMethod;

    .line 80
    .line 81
    const-string v0, "alipay"

    .line 82
    .line 83
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_2

    .line 88
    .line 89
    invoke-static {}, Ll/xl60;->l()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_4

    .line 94
    .line 95
    :cond_2
    const-string v0, "wechat"

    .line 96
    .line 97
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_3

    .line 102
    .line 103
    invoke-static {}, Ll/xl60;->q()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_4

    .line 108
    .line 109
    :cond_3
    const-string v0, "jingdong"

    .line 110
    .line 111
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-eqz v0, :cond_1

    .line 116
    .line 117
    invoke-static {}, Ll/xl60;->n()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_1

    .line 122
    .line 123
    :cond_4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    .line 125
    .line 126
    return-object p2

    .line 127
    :cond_5
    return-object p1

    .line 128
    :cond_6
    return-object p2
.end method

.method public final i()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->g:Ll/k8f0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "showcaseNewFilterChain"

    .line 6
    .line 7
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->p()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Ll/k8f0;->m(Ljava/util/List;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final j(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->l()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return-object p1

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public final k()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l()Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->j:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 2
    .line 3
    return-object p0
.end method

.method public final m()Lcom/p1/mobile/putong/data/PayMethod;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->i:Lcom/p1/mobile/putong/data/PayMethod;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final n()Lcom/p1/mobile/putong/core/ui/purchase/d;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->k:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public final o()Ll/pbb0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->o:Ll/pbb0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final p()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "purchaseSectionsSource"

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

.method public final q()Ll/lib0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->p:Ll/lib0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final r()Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final s(Lcom/p1/mobile/putong/core/ui/purchase/d;)Z
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/purchase/d;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->m:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 5
    .line 6
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->m:Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-ne p1, p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public t()Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->UNCHECKED:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->CHECKED:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 11
    .line 12
    return-object p0
.end method

.method public final u()Lcom/p1/mobile/putong/data/PayMethod;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Ll/xl60;->l()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "alipay"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string p0, "wechat"

    .line 18
    .line 19
    invoke-static {p0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public final v()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->g:Ll/k8f0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/k8f0;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/k8f0;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->g:Ll/k8f0;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public w()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->K()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/data/PurchaseType;->productCategory()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/a5;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/a5;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v2, Ll/b5;

    .line 30
    .line 31
    invoke-direct {v2, v1}, Ll/b5;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/c5;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/c5;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->d:Ll/kcg0;

    .line 57
    .line 58
    return-void
.end method

.method public final x()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tab0;->z()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final y()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->f:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final z(Lcom/p1/mobile/putong/data/PayMethod;)Z
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/data/PayMethod;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->i:Lcom/p1/mobile/putong/data/PayMethod;

    .line 5
    .line 6
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return v1

    .line 14
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->i:Lcom/p1/mobile/putong/data/PayMethod;

    .line 15
    .line 16
    const-string v0, "unknown_"

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;

    .line 41
    .line 42
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$a;->a(Lcom/p1/mobile/putong/data/PayMethod;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 p0, 0x1

    .line 47
    return p0

    .line 48
    :cond_2
    const-string p0, "current pay method is unknown!!!"

    .line 49
    .line 50
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return v1
.end method
