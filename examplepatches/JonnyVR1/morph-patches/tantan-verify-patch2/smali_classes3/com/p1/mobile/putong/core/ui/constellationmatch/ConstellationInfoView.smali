.class public final Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00be\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u00020\u00012\u00020\u0002B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\t\u0010\nB\u001b\u0008\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\t\u0010\u000bB\u0011\u0008\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\t\u0010\u000cJ\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u0017\u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0016\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0015J\u0017\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0015J\u0017\u0010\u001a\u001a\u00020\u000f2\u0006\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\u0017\u0010\u001c\u001a\u00020\u000f2\u0006\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001bJ\u001f\u0010\u001e\u001a\u00020\u000f2\u0006\u0010\u001d\u001a\u00020\u00182\u0006\u0010\u0013\u001a\u00020\u0012H\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\u000fH\u0014\u00a2\u0006\u0004\u0008 \u0010!J\u001d\u0010$\u001a\u00020\u000f2\u0006\u0010#\u001a\u00020\"2\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008$\u0010%J\u001f\u0010)\u001a\u00020\u00182\u0006\u0010&\u001a\u00020\r2\u0006\u0010(\u001a\u00020\'H\u0016\u00a2\u0006\u0004\u0008)\u0010*R\"\u00102\u001a\u00020+8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008,\u0010-\u001a\u0004\u0008.\u0010/\"\u0004\u00080\u00101R\"\u0010:\u001a\u0002038\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00084\u00105\u001a\u0004\u00086\u00107\"\u0004\u00088\u00109R\"\u0010B\u001a\u00020;8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008<\u0010=\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010AR\"\u0010J\u001a\u00020C8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008D\u0010E\u001a\u0004\u0008F\u0010G\"\u0004\u0008H\u0010IR\"\u0010R\u001a\u00020K8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008L\u0010M\u001a\u0004\u0008N\u0010O\"\u0004\u0008P\u0010QR\"\u0010V\u001a\u00020K8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008S\u0010M\u001a\u0004\u0008T\u0010O\"\u0004\u0008U\u0010QR\"\u0010^\u001a\u00020W8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008X\u0010Y\u001a\u0004\u0008Z\u0010[\"\u0004\u0008\\\u0010]R\"\u0010b\u001a\u0002038\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008_\u00105\u001a\u0004\u0008`\u00107\"\u0004\u0008a\u00109R\"\u0010j\u001a\u00020c8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008d\u0010e\u001a\u0004\u0008f\u0010g\"\u0004\u0008h\u0010iR\"\u0010r\u001a\u00020k8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008l\u0010m\u001a\u0004\u0008n\u0010o\"\u0004\u0008p\u0010qR\"\u0010z\u001a\u00020s8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008t\u0010u\u001a\u0004\u0008v\u0010w\"\u0004\u0008x\u0010yR%\u0010\u0082\u0001\u001a\u00020{8\u0006@\u0006X\u0086.\u00a2\u0006\u0014\n\u0004\u0008|\u0010}\u001a\u0004\u0008~\u0010\u007f\"\u0006\u0008\u0080\u0001\u0010\u0081\u0001R&\u0010\u0086\u0001\u001a\u00020s8\u0006@\u0006X\u0086.\u00a2\u0006\u0015\n\u0005\u0008\u0083\u0001\u0010u\u001a\u0005\u0008\u0084\u0001\u0010w\"\u0005\u0008\u0085\u0001\u0010yR&\u0010\u008a\u0001\u001a\u00020K8\u0006@\u0006X\u0086.\u00a2\u0006\u0015\n\u0005\u0008\u0087\u0001\u0010M\u001a\u0005\u0008\u0088\u0001\u0010O\"\u0005\u0008\u0089\u0001\u0010QR*\u0010\u0092\u0001\u001a\u00030\u008b\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u008c\u0001\u0010\u008d\u0001\u001a\u0006\u0008\u008e\u0001\u0010\u008f\u0001\"\u0006\u0008\u0090\u0001\u0010\u0091\u0001R&\u0010\u0096\u0001\u001a\u00020K8\u0006@\u0006X\u0086.\u00a2\u0006\u0015\n\u0005\u0008\u0093\u0001\u0010M\u001a\u0005\u0008\u0094\u0001\u0010O\"\u0005\u0008\u0095\u0001\u0010QR*\u0010\u009e\u0001\u001a\u00030\u0097\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u0098\u0001\u0010\u0099\u0001\u001a\u0006\u0008\u009a\u0001\u0010\u009b\u0001\"\u0006\u0008\u009c\u0001\u0010\u009d\u0001R*\u0010\u00a2\u0001\u001a\u00030\u0097\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u009f\u0001\u0010\u0099\u0001\u001a\u0006\u0008\u00a0\u0001\u0010\u009b\u0001\"\u0006\u0008\u00a1\u0001\u0010\u009d\u0001R*\u0010\u00aa\u0001\u001a\u00030\u00a3\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0018\n\u0006\u0008\u00a4\u0001\u0010\u00a5\u0001\u001a\u0006\u0008\u00a6\u0001\u0010\u00a7\u0001\"\u0006\u0008\u00a8\u0001\u0010\u00a9\u0001R)\u0010\u00b1\u0001\u001a\u00030\u00ab\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008&\u0010\u00ac\u0001\u001a\u0006\u0008\u00ad\u0001\u0010\u00ae\u0001\"\u0006\u0008\u00af\u0001\u0010\u00b0\u0001R\u0018\u0010#\u001a\u00020\"8\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u00b2\u0001\u0010\u00b3\u0001\u00a8\u0006\u00b4\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;",
        "Lv/VLinear;",
        "Landroid/view/View$OnTouchListener;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "(Landroid/content/Context;)V",
        "Landroid/view/View;",
        "view",
        "",
        "c0",
        "(Landroid/view/View;)V",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "e0",
        "(Lcom/p1/mobile/putong/data/User;)V",
        "d0",
        "g0",
        "",
        "like",
        "p0",
        "(Z)V",
        "o0",
        "liked",
        "f0",
        "(ZLcom/p1/mobile/putong/data/User;)V",
        "onFinishInflate",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "h0",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V",
        "v",
        "Landroid/view/MotionEvent;",
        "event",
        "onTouch",
        "(Landroid/view/View;Landroid/view/MotionEvent;)Z",
        "Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;",
        "c",
        "Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;",
        "get_constrain_layout",
        "()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;",
        "set_constrain_layout",
        "(Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;)V",
        "_constrain_layout",
        "Lv/VDraweeView;",
        "d",
        "Lv/VDraweeView;",
        "get_image",
        "()Lv/VDraweeView;",
        "set_image",
        "(Lv/VDraweeView;)V",
        "_image",
        "Lv/VButton;",
        "e",
        "Lv/VButton;",
        "get_close",
        "()Lv/VButton;",
        "set_close",
        "(Lv/VButton;)V",
        "_close",
        "Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;",
        "f",
        "Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;",
        "get_order_layout",
        "()Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;",
        "set_order_layout",
        "(Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;)V",
        "_order_layout",
        "Lv/VText;",
        "g",
        "Lv/VText;",
        "get_name",
        "()Lv/VText;",
        "set_name",
        "(Lv/VText;)V",
        "_name",
        "h",
        "get_age",
        "set_age",
        "_age",
        "Landroid/widget/Space;",
        "i",
        "Landroid/widget/Space;",
        "get_space",
        "()Landroid/widget/Space;",
        "set_space",
        "(Landroid/widget/Space;)V",
        "_space",
        "j",
        "get_constellation_image",
        "set_constellation_image",
        "_constellation_image",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "k",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "get_info_layout",
        "()Landroidx/constraintlayout/widget/ConstraintLayout;",
        "set_info_layout",
        "(Landroidx/constraintlayout/widget/ConstraintLayout;)V",
        "_info_layout",
        "Landroid/widget/RelativeLayout;",
        "l",
        "Landroid/widget/RelativeLayout;",
        "get_card_layout",
        "()Landroid/widget/RelativeLayout;",
        "set_card_layout",
        "(Landroid/widget/RelativeLayout;)V",
        "_card_layout",
        "Landroid/widget/TextView;",
        "m",
        "Landroid/widget/TextView;",
        "get_type",
        "()Landroid/widget/TextView;",
        "set_type",
        "(Landroid/widget/TextView;)V",
        "_type",
        "Lorg/apmem/tools/layouts/FlowLayout;",
        "n",
        "Lorg/apmem/tools/layouts/FlowLayout;",
        "get_tags",
        "()Lorg/apmem/tools/layouts/FlowLayout;",
        "set_tags",
        "(Lorg/apmem/tools/layouts/FlowLayout;)V",
        "_tags",
        "o",
        "get_desc",
        "set_desc",
        "_desc",
        "p",
        "get_branding",
        "set_branding",
        "_branding",
        "Landroid/widget/LinearLayout;",
        "q",
        "Landroid/widget/LinearLayout;",
        "get_save_pic",
        "()Landroid/widget/LinearLayout;",
        "set_save_pic",
        "(Landroid/widget/LinearLayout;)V",
        "_save_pic",
        "r",
        "get_save_pic_text",
        "set_save_pic_text",
        "_save_pic_text",
        "Landroid/view/ViewStub;",
        "s",
        "Landroid/view/ViewStub;",
        "get_normal_operation",
        "()Landroid/view/ViewStub;",
        "set_normal_operation",
        "(Landroid/view/ViewStub;)V",
        "_normal_operation",
        "t",
        "get_usa_operation",
        "set_usa_operation",
        "_usa_operation",
        "Ll/ya5;",
        "u",
        "Ll/ya5;",
        "getListener",
        "()Ll/ya5;",
        "setListener",
        "(Ll/ya5;)V",
        "listener",
        "Ll/nij0;",
        "Ll/nij0;",
        "getTranslationListener",
        "()Ll/nij0;",
        "setTranslationListener",
        "(Ll/nij0;)V",
        "translationListener",
        "w",
        "Lcom/p1/mobile/android/app/Act;",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

.field public d:Lv/VDraweeView;

.field public e:Lv/VButton;

.field public f:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/widget/Space;

.field public j:Lv/VDraweeView;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Landroid/widget/TextView;

.field public n:Lorg/apmem/tools/layouts/FlowLayout;

.field public o:Landroid/widget/TextView;

.field public p:Lv/VText;

.field public q:Landroid/widget/LinearLayout;

.field public r:Lv/VText;

.field public s:Landroid/view/ViewStub;

.field public t:Landroid/view/ViewStub;

.field public u:Ll/ya5;

.field public v:Ll/nij0;

.field public w:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic P(Lkotlin/jvm/internal/Ref$ObjectRef;Lcom/p1/mobile/android/app/Act;Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->j0(Lkotlin/jvm/internal/Ref$ObjectRef;Lcom/p1/mobile/android/app/Act;Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->k0(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/Boolean;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->n0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->l0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V

    return-void
.end method

.method public static T(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->o0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->f0(ZLcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->m0(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->i0(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static X(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->p0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->f0(ZLcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static Y(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->p0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->f0(ZLcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static Z(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->o0(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->f0(ZLcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static a0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/Relationship;)V
    .locals 7

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 5
    .line 6
    const-string v1, "matched"

    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_e

    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 15
    .line 16
    const-string v1, "xmasActivity"

    .line 17
    .line 18
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_e

    .line 27
    .line 28
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v1, 0x1

    .line 35
    const/16 v2, 0xd

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 47
    .line 48
    const-string v4, "letter"

    .line 49
    .line 50
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_0

    .line 94
    .line 95
    const/16 v0, 0x25

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    const/16 v0, 0x26

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_2

    .line 108
    .line 109
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 116
    .line 117
    const-string v4, "superLikedEach"

    .line 118
    .line 119
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_2

    .line 124
    .line 125
    move v0, v2

    .line 126
    goto :goto_0

    .line 127
    :cond_2
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_3

    .line 134
    .line 135
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 142
    .line 143
    const-string v4, "superLiked"

    .line 144
    .line 145
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    const/16 v0, 0xb

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_3
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_4

    .line 161
    .line 162
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 169
    .line 170
    const-string v4, "secretcrush"

    .line 171
    .line 172
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_4

    .line 177
    .line 178
    move v0, v1

    .line 179
    goto :goto_0

    .line 180
    :cond_4
    move v0, v3

    .line 181
    :goto_0
    invoke-static {}, Ll/d79;->j0()Z

    .line 182
    .line 183
    .line 184
    move-result v4

    .line 185
    if-eqz v4, :cond_5

    .line 186
    .line 187
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 188
    .line 189
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 190
    .line 191
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 192
    .line 193
    .line 194
    :cond_5
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 195
    .line 196
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 197
    .line 198
    invoke-virtual {v4}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    const-string v5, "act"

    .line 207
    .line 208
    const/4 v6, 0x0

    .line 209
    if-eqz v4, :cond_a

    .line 210
    .line 211
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->w:Lcom/p1/mobile/android/app/Act;

    .line 212
    .line 213
    if-nez p2, :cond_6

    .line 214
    .line 215
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    move-object p2, v6

    .line 219
    :cond_6
    invoke-static {p2, p0}, Ll/pci;->J(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 220
    .line 221
    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    if-nez p0, :cond_7

    .line 227
    .line 228
    invoke-static {}, Ll/toh0;->s()V

    .line 229
    .line 230
    .line 231
    :cond_7
    if-ne v0, v2, :cond_e

    .line 232
    .line 233
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    invoke-virtual {p0}, Ll/tx0;->B()Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-eqz p0, :cond_e

    .line 242
    .line 243
    invoke-static {}, Ll/spl0;->F()Z

    .line 244
    .line 245
    .line 246
    move-result p0

    .line 247
    if-eqz p0, :cond_8

    .line 248
    .line 249
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    sget-object p2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup_store:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 258
    .line 259
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    invoke-virtual {p0, p2, v3, v1}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 264
    .line 265
    .line 266
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->w:Lcom/p1/mobile/android/app/Act;

    .line 267
    .line 268
    if-nez p0, :cond_9

    .line 269
    .line 270
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    goto :goto_1

    .line 274
    :cond_9
    move-object v6, p0

    .line 275
    :goto_1
    const/high16 p0, 0x40a00000    # 5.0f

    .line 276
    .line 277
    const-string p1, "superlike"

    .line 278
    .line 279
    invoke-static {v6, v3, p0, p1}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :cond_a
    iget-object v1, p1, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->w:Lcom/p1/mobile/android/app/Act;

    .line 284
    .line 285
    if-nez v1, :cond_b

    .line 286
    .line 287
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    move-object v1, v6

    .line 291
    :cond_b
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 292
    .line 293
    filled-new-array {p0}, [Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Relationship;->scenarios:Ljava/util/List;

    .line 302
    .line 303
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 304
    .line 305
    .line 306
    check-cast p2, Ljava/util/ArrayList;

    .line 307
    .line 308
    invoke-static {}, Ll/gra;->S1()Z

    .line 309
    .line 310
    .line 311
    move-result v2

    .line 312
    if-eqz v2, :cond_c

    .line 313
    .line 314
    const-string v2, "tmp_from_home_swipe"

    .line 315
    .line 316
    goto :goto_2

    .line 317
    :cond_c
    move-object v2, v6

    .line 318
    :goto_2
    invoke-static {v1, p0, v0, p2, v2}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ILjava/util/ArrayList;Ljava/lang/String;)Landroid/content/Intent;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->w:Lcom/p1/mobile/android/app/Act;

    .line 323
    .line 324
    if-nez p1, :cond_d

    .line 325
    .line 326
    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    goto :goto_3

    .line 330
    :cond_d
    move-object v6, p1

    .line 331
    :goto_3
    new-instance p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;

    .line 332
    .line 333
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct$b;-><init>()V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v6, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 337
    .line 338
    .line 339
    :cond_e
    return-void
.end method

.method public static b0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static final i0(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_close()Lv/VButton;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    const-string p2, "e_intl_horoscope_match_save_to_album"

    .line 10
    .line 11
    const-string v0, "p_intl_horoscope_match_self_card"

    .line 12
    .line 13
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p2}, Ll/i1k;->f(Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    new-instance v0, Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 25
    .line 26
    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/ez5;

    .line 30
    .line 31
    invoke-direct {v1, v0, p1, p2, p0}, Ll/ez5;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;Lcom/p1/mobile/android/app/Act;Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v1}, Ll/i1k;->d(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static final j0(Lkotlin/jvm/internal/Ref$ObjectRef;Lcom/p1/mobile/android/app/Act;Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/vy5;->e(Landroid/graphics/Bitmap;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p2, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/jz5;

    .line 21
    .line 22
    invoke-direct {p2, p3, p0}, Ll/jz5;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lkotlin/jvm/internal/Ref$ObjectRef;)V

    .line 23
    .line 24
    .line 25
    new-instance p3, Ll/kz5;

    .line 26
    .line 27
    invoke-direct {p3, p2}, Ll/kz5;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p3}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 35
    .line 36
    return-void
.end method

.method public static final k0(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/Boolean;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_close()Lv/VButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/core/R$string;->vi:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ll/kcg0;

    .line 23
    .line 24
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 28
    .line 29
    return-object p0
.end method

.method public static final l0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final m0(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->u:Ll/ya5;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->getListener()Ll/ya5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/ya5;->close()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static final n0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final c0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lz5;->a(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_usa_operation()Landroid/view/ViewStub;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/adc0;->t2:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 16
    .line 17
    sget v2, Ll/adc0;->Y6:I

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 24
    .line 25
    new-instance v2, Ll/hz5;

    .line 26
    .line 27
    invoke-direct {v2, p0, p1}, Ll/hz5;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/iz5;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/iz5;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final e0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_normal_operation()Landroid/view/ViewStub;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/adc0;->s2:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 16
    .line 17
    sget v2, Ll/adc0;->W6:I

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;

    .line 24
    .line 25
    new-instance v2, Ll/fz5;

    .line 26
    .line 27
    invoke-direct {v2, p0, p1}, Ll/fz5;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/gz5;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/gz5;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final f0(ZLcom/p1/mobile/putong/data/User;)V
    .locals 11

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/LikeExtraData;->new_()Lcom/p1/mobile/putong/data/LikeExtraData;

    .line 2
    .line 3
    .line 4
    move-result-object v8

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->SUGGEST:Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$ScActionFrom;->getFrom()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->matchSource(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isLike(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isFromButton(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->isSuperLiked(Z)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->user(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "p_intl_horoscope_match_others_card"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->pageId(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/MatchScData$MatchBuilder;->build()Lcom/p1/mobile/putong/data/MatchScData;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, v8, Lcom/p1/mobile/putong/data/LikeExtraData;->matchScData:Lcom/p1/mobile/putong/data/MatchScData;

    .line 49
    .line 50
    new-instance v3, Ljava/util/LinkedHashMap;

    .line 51
    .line 52
    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 53
    .line 54
    .line 55
    const-string v0, "sourcepage"

    .line 56
    .line 57
    sget-object v2, Ll/b240;->S0:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    const-string v0, "actiontype"

    .line 63
    .line 64
    sget-object v2, Ll/b240;->T0:Ljava/lang/String;

    .line 65
    .line 66
    invoke-interface {v3, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    if-eqz p1, :cond_0

    .line 70
    .line 71
    const-string v0, "e_intl_horoscope_match_like_button"

    .line 72
    .line 73
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    const-string v0, "e_intl_horoscope_match_dislike_button"

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 85
    .line 86
    const-string v1, "home"

    .line 87
    .line 88
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    const/4 v9, 0x0

    .line 93
    const/4 v10, 0x0

    .line 94
    const/4 v2, 0x0

    .line 95
    const/4 v5, 0x0

    .line 96
    const/4 v7, 0x1

    .line 97
    move v1, p1

    .line 98
    move-object v4, p2

    .line 99
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->Y7(ZZLjava/util/Map;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/LikeFrom;ZLcom/p1/mobile/putong/data/LikeExtraData;ILjava/lang/String;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    new-instance p2, Ll/az5;

    .line 104
    .line 105
    invoke-direct {p2, v4, p0}, Ll/az5;-><init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V

    .line 106
    .line 107
    .line 108
    new-instance p0, Ll/bz5;

    .line 109
    .line 110
    invoke-direct {p0}, Ll/bz5;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_image()Lv/VDraweeView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final getListener()Ll/ya5;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->u:Ll/ya5;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "listener"

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

.method public final getTranslationListener()Ll/nij0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->v:Ll/nij0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "translationListener"

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

.method public final get_age()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->h:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_age"

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

.method public final get_branding()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->p:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_branding"

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

.method public final get_card_layout()Landroid/widget/RelativeLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->l:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_card_layout"

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

.method public final get_close()Lv/VButton;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->e:Lv/VButton;

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

.method public final get_constellation_image()Lv/VDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->j:Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_constellation_image"

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

.method public final get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->c:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_constrain_layout"

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

.method public final get_desc()Landroid/widget/TextView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->o:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_desc"

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

.method public final get_image()Lv/VDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_image"

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

.method public final get_info_layout()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_info_layout"

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

.method public final get_name()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->g:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_name"

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

.method public final get_normal_operation()Landroid/view/ViewStub;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->s:Landroid/view/ViewStub;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_normal_operation"

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

.method public final get_order_layout()Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->f:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_order_layout"

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

.method public final get_save_pic()Landroid/widget/LinearLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->q:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_save_pic"

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

.method public final get_save_pic_text()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->r:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_save_pic_text"

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

.method public final get_space()Landroid/widget/Space;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->i:Landroid/widget/Space;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_space"

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

.method public final get_tags()Lorg/apmem/tools/layouts/FlowLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->n:Lorg/apmem/tools/layouts/FlowLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_tags"

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

.method public final get_type()Landroid/widget/TextView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->m:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_type"

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

.method public final get_usa_operation()Landroid/view/ViewStub;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->t:Landroid/view/ViewStub;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_usa_operation"

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

.method public final h0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 9
    .param p1    # Lcom/p1/mobile/android/app/Act;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->w:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_name()Lv/VText;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_age()Lv/VText;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/vy5;->c(Landroid/content/Context;Lcom/p1/mobile/putong/data/ProfileZodiac;)Lcom/p1/mobile/putong/core/data/ConstellationData;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constellation_image()Lv/VDraweeView;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/ConstellationData;->image:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_type()Landroid/widget/TextView;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget v2, v0, Lcom/p1/mobile/putong/core/data/ConstellationData;->nameColor:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_type()Landroid/widget/TextView;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ConstellationData;->name:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_desc()Landroid/widget/TextView;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ConstellationData;->meaning:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_desc()Landroid/widget/TextView;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/ConstellationData;->keywords:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    .line 105
    .line 106
    const-string v0, ","

    .line 107
    .line 108
    const-string v1, "\uff0c"

    .line 109
    .line 110
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    const/4 v7, 0x6

    .line 115
    const/4 v8, 0x0

    .line 116
    const/4 v5, 0x0

    .line 117
    const/4 v6, 0x0

    .line 118
    invoke-static/range {v3 .. v8}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZIILjava/lang/Object;)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Ljava/lang/Iterable;

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_0

    .line 133
    .line 134
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    check-cast v1, Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {v2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    sget v3, Ll/kec0;->y4:I

    .line 149
    .line 150
    const/4 v4, 0x0

    .line 151
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    sget v3, Ll/adc0;->G6:I

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    check-cast v3, Landroid/widget/TextView;

    .line 162
    .line 163
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_tags()Lorg/apmem/tools/layouts/FlowLayout;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 171
    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_0
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-eqz v0, :cond_1

    .line 189
    .line 190
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_save_pic()Landroid/widget/LinearLayout;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    const/4 v0, 0x1

    .line 195
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_branding()Lv/VText;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 206
    .line 207
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 208
    .line 209
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->g0(Lcom/p1/mobile/putong/data/User;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_save_pic()Landroid/widget/LinearLayout;

    .line 220
    .line 221
    .line 222
    move-result-object p2

    .line 223
    new-instance v0, Ll/zy5;

    .line 224
    .line 225
    invoke-direct {v0, p0, p1}, Ll/zy5;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;Lcom/p1/mobile/android/app/Act;)V

    .line 226
    .line 227
    .line 228
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_close()Lv/VButton;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    new-instance p2, Ll/cz5;

    .line 236
    .line 237
    invoke-direct {p2, p0}, Ll/cz5;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V

    .line 238
    .line 239
    .line 240
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 241
    .line 242
    .line 243
    return-void

    .line 244
    :cond_1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->g0(Lcom/p1/mobile/putong/data/User;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_branding()Lv/VText;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    const/4 v0, 0x0

    .line 252
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 253
    .line 254
    .line 255
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_close()Lv/VButton;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    new-instance v0, Ll/dz5;

    .line 267
    .line 268
    invoke-direct {v0}, Ll/dz5;-><init>()V

    .line 269
    .line 270
    .line 271
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    .line 273
    .line 274
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 275
    .line 276
    .line 277
    move-result p1

    .line 278
    if-eqz p1, :cond_2

    .line 279
    .line 280
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->d0(Lcom/p1/mobile/putong/data/User;)V

    .line 281
    .line 282
    .line 283
    return-void

    .line 284
    :cond_2
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->e0(Lcom/p1/mobile/putong/data/User;)V

    .line 285
    .line 286
    .line 287
    :cond_3
    return-void
.end method

.method public final o0(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/high16 v1, 0x40a00000    # 5.0f

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/high16 v1, -0x3f600000    # -5.0f

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    move v2, v1

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_info_layout()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v2, v2

    .line 33
    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setPivotX(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_info_layout()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    int-to-float v2, v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/view/View;->setPivotY(F)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->v:Ll/nij0;

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->getTranslationListener()Ll/nij0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Ll/nij0;->onStart()V

    .line 61
    .line 62
    .line 63
    :cond_2
    const/4 v0, 0x1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    move p1, v0

    .line 67
    goto :goto_2

    .line 68
    :cond_3
    const/4 p1, -0x1

    .line 69
    :goto_2
    int-to-float p1, p1

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    int-to-float v2, v2

    .line 79
    mul-float/2addr p1, v2

    .line 80
    const/high16 v2, 0x40000000    # 2.0f

    .line 81
    .line 82
    mul-float/2addr p1, v2

    .line 83
    const/4 v2, 0x2

    .line 84
    new-array v2, v2, [F

    .line 85
    .line 86
    const/4 v3, 0x0

    .line 87
    aput v1, v2, v3

    .line 88
    .line 89
    aput p1, v2, v0

    .line 90
    .line 91
    const-string p1, "translationX"

    .line 92
    .line 93
    invoke-static {p0, p1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 101
    .line 102
    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 106
    .line 107
    .line 108
    new-instance v0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView$a;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView$a;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 114
    .line 115
    .line 116
    const-wide/16 v0, 0x1f4

    .line 117
    .line 118
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->c0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/MotionEvent;
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
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    sget p2, Ll/adc0;->s2:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    if-eq p0, p2, :cond_1

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sget p2, Ll/adc0;->W6:I

    .line 21
    .line 22
    if-eq p0, p2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    sget p2, Ll/adc0;->o6:I

    .line 29
    .line 30
    if-ne p0, p2, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return v0

    .line 34
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 p1, 0x1

    .line 39
    invoke-interface {p0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 40
    .line 41
    .line 42
    return v0
.end method

.method public final p0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->v:Ll/nij0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->getTranslationListener()Ll/nij0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/nij0;->onStart()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 p1, -0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move p1, v0

    .line 18
    :goto_0
    int-to-float p1, p1

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->get_constrain_layout()Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    mul-float/2addr p1, v1

    .line 29
    const/high16 v1, 0x40000000    # 2.0f

    .line 30
    .line 31
    mul-float/2addr p1, v1

    .line 32
    const/4 v1, 0x2

    .line 33
    new-array v1, v1, [F

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    const/4 v3, 0x0

    .line 37
    aput v2, v1, v3

    .line 38
    .line 39
    aput p1, v1, v0

    .line 40
    .line 41
    const-string p1, "translationY"

    .line 42
    .line 43
    invoke-static {p0, p1, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    .line 51
    .line 52
    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView$b;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView$b;-><init>(Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 64
    .line 65
    .line 66
    const-wide/16 v0, 0x1f4

    .line 67
    .line 68
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final setListener(Ll/ya5;)V
    .locals 0
    .param p1    # Ll/ya5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->u:Ll/ya5;

    .line 5
    .line 6
    return-void
.end method

.method public final setTranslationListener(Ll/nij0;)V
    .locals 0
    .param p1    # Ll/nij0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->v:Ll/nij0;

    .line 5
    .line 6
    return-void
.end method

.method public final set_age(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->h:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_branding(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->p:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_card_layout(Landroid/widget/RelativeLayout;)V
    .locals 0
    .param p1    # Landroid/widget/RelativeLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->l:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_close(Lv/VButton;)V
    .locals 0
    .param p1    # Lv/VButton;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->e:Lv/VButton;

    .line 5
    .line 6
    return-void
.end method

.method public final set_constellation_image(Lv/VDraweeView;)V
    .locals 0
    .param p1    # Lv/VDraweeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->j:Lv/VDraweeView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_constrain_layout(Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->c:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_desc(Landroid/widget/TextView;)V
    .locals 0
    .param p1    # Landroid/widget/TextView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->o:Landroid/widget/TextView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_image(Lv/VDraweeView;)V
    .locals 0
    .param p1    # Lv/VDraweeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->d:Lv/VDraweeView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_info_layout(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0
    .param p1    # Landroidx/constraintlayout/widget/ConstraintLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_name(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->g:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_normal_operation(Landroid/view/ViewStub;)V
    .locals 0
    .param p1    # Landroid/view/ViewStub;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->s:Landroid/view/ViewStub;

    .line 5
    .line 6
    return-void
.end method

.method public final set_order_layout(Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->f:Lcom/p1/mobile/putong/core/newui/view/LinearMeasureOrderLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_save_pic(Landroid/widget/LinearLayout;)V
    .locals 0
    .param p1    # Landroid/widget/LinearLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->q:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_save_pic_text(Lv/VText;)V
    .locals 0
    .param p1    # Lv/VText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->r:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_space(Landroid/widget/Space;)V
    .locals 0
    .param p1    # Landroid/widget/Space;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->i:Landroid/widget/Space;

    .line 5
    .line 6
    return-void
.end method

.method public final set_tags(Lorg/apmem/tools/layouts/FlowLayout;)V
    .locals 0
    .param p1    # Lorg/apmem/tools/layouts/FlowLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->n:Lorg/apmem/tools/layouts/FlowLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_type(Landroid/widget/TextView;)V
    .locals 0
    .param p1    # Landroid/widget/TextView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->m:Landroid/widget/TextView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_usa_operation(Landroid/view/ViewStub;)V
    .locals 0
    .param p1    # Landroid/view/ViewStub;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/constellationmatch/ConstellationInfoView;->t:Landroid/view/ViewStub;

    .line 5
    .line 6
    return-void
.end method
