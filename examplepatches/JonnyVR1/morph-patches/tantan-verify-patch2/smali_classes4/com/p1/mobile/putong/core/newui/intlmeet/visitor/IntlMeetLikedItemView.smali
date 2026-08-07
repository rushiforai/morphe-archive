.class public final Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0096\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u001b\n\u0002\u0018\u0002\n\u0002\u0008\u000f\u0018\u00002\u00020\u0001B\u0011\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\u001b\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0004\u0010\u0008B#\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0004\u0010\u000bJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010JY\u0010\u001c\u001a\u00020\u000e2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00020\u00152\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00182\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00182\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u0018H\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u001d\u0010!\u001a\u00020\u000e2\u000c\u0010 \u001a\u0008\u0012\u0004\u0012\u00020\u001f0\u001eH\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\u000f\u0010#\u001a\u00020\u000eH\u0014\u00a2\u0006\u0004\u0008#\u0010$J\u000f\u0010&\u001a\u0004\u0018\u00010%\u00a2\u0006\u0004\u0008&\u0010\'J_\u0010+\u001a\u00020\u000e2\u0006\u0010)\u001a\u00020(2\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010*\u001a\u00020\u001f2\u0006\u0010\u0017\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00152\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00182\u000c\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00182\u000c\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u0018\u00a2\u0006\u0004\u0008+\u0010,R\"\u00103\u001a\u00020\u00008\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008-\u0010.\u001a\u0004\u0008/\u00100\"\u0004\u00081\u00102R\"\u00109\u001a\u00020\u000c8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00084\u00105\u001a\u0004\u00086\u00107\"\u0004\u00088\u0010\u0010R\"\u0010A\u001a\u00020:8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008;\u0010<\u001a\u0004\u0008=\u0010>\"\u0004\u0008?\u0010@R\"\u0010I\u001a\u00020B8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008C\u0010D\u001a\u0004\u0008E\u0010F\"\u0004\u0008G\u0010HR\"\u0010Q\u001a\u00020J8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008K\u0010L\u001a\u0004\u0008M\u0010N\"\u0004\u0008O\u0010PR\"\u0010U\u001a\u00020B8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008R\u0010D\u001a\u0004\u0008S\u0010F\"\u0004\u0008T\u0010HR\"\u0010]\u001a\u00020V8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008W\u0010X\u001a\u0004\u0008Y\u0010Z\"\u0004\u0008[\u0010\\R\"\u0010a\u001a\u00020V8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008^\u0010X\u001a\u0004\u0008_\u0010Z\"\u0004\u0008`\u0010\\R\"\u0010i\u001a\u00020b8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008c\u0010d\u001a\u0004\u0008e\u0010f\"\u0004\u0008g\u0010hR\"\u0010m\u001a\u00020J8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008j\u0010L\u001a\u0004\u0008k\u0010N\"\u0004\u0008l\u0010PR\"\u0010q\u001a\u00020V8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008n\u0010X\u001a\u0004\u0008o\u0010Z\"\u0004\u0008p\u0010\\R\"\u0010u\u001a\u00020:8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008r\u0010<\u001a\u0004\u0008s\u0010>\"\u0004\u0008t\u0010@R\"\u0010y\u001a\u00020B8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008v\u0010D\u001a\u0004\u0008w\u0010F\"\u0004\u0008x\u0010HR\"\u0010}\u001a\u00020V8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008z\u0010X\u001a\u0004\u0008{\u0010Z\"\u0004\u0008|\u0010\\R(\u0010\u0085\u0001\u001a\u00020~8\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008\u007f\u0010\u0080\u0001\u001a\u0006\u0008\u0081\u0001\u0010\u0082\u0001\"\u0006\u0008\u0083\u0001\u0010\u0084\u0001R&\u0010\u0089\u0001\u001a\u00020\u000c8\u0006@\u0006X\u0086.\u00a2\u0006\u0015\n\u0005\u0008\u0086\u0001\u00105\u001a\u0005\u0008\u0087\u0001\u00107\"\u0005\u0008\u0088\u0001\u0010\u0010R\u001b\u0010\u008c\u0001\u001a\u0004\u0018\u00010\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0008\n\u0006\u0008\u008a\u0001\u0010\u008b\u0001\u00a8\u0006\u008d\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;",
        "Lv/VFrame;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Landroid/util/AttributeSet;",
        "attrs",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "defStyleAttr",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "Landroid/view/View;",
        "view",
        "",
        "z",
        "(Landroid/view/View;)V",
        "Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;",
        "visitorItem",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "",
        "hasPrivilege",
        "isFirstItem",
        "Ll/y20;",
        "onClick",
        "onSuperLikeSend",
        "onInstantMatchSend",
        "B",
        "(Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Lcom/p1/mobile/putong/data/User;ZZLl/y20;Ll/y20;Ll/y20;)V",
        "",
        "",
        "texts",
        "E",
        "(Ljava/util/List;)V",
        "onFinishInflate",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "()Lcom/p1/mobile/android/app/Act;",
        "Ll/fko;",
        "adapter",
        "userId",
        "C",
        "(Ll/fko;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Ljava/lang/String;ZZLl/y20;Ll/y20;Ll/y20;)V",
        "a",
        "Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;",
        "get_root",
        "()Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;",
        "set_root",
        "(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;)V",
        "_root",
        "b",
        "Landroid/view/View;",
        "get_divider",
        "()Landroid/view/View;",
        "set_divider",
        "_divider",
        "Lv/VDraweeView;",
        "c",
        "Lv/VDraweeView;",
        "get_header_pic",
        "()Lv/VDraweeView;",
        "set_header_pic",
        "(Lv/VDraweeView;)V",
        "_header_pic",
        "Lv/VLinear;",
        "d",
        "Lv/VLinear;",
        "get_content",
        "()Lv/VLinear;",
        "set_content",
        "(Lv/VLinear;)V",
        "_content",
        "Lv/VText;",
        "e",
        "Lv/VText;",
        "get_title_big",
        "()Lv/VText;",
        "set_title_big",
        "(Lv/VText;)V",
        "_title_big",
        "f",
        "get_pic_tag_big",
        "set_pic_tag_big",
        "_pic_tag_big",
        "Lv/VImage;",
        "g",
        "Lv/VImage;",
        "get_pic_tag_big_pic_verify_logo",
        "()Lv/VImage;",
        "set_pic_tag_big_pic_verify_logo",
        "(Lv/VImage;)V",
        "_pic_tag_big_pic_verify_logo",
        "h",
        "get_pic_tag_big_svip_tag",
        "set_pic_tag_big_svip_tag",
        "_pic_tag_big_svip_tag",
        "Landroid/widget/RelativeLayout;",
        "i",
        "Landroid/widget/RelativeLayout;",
        "get_like",
        "()Landroid/widget/RelativeLayout;",
        "set_like",
        "(Landroid/widget/RelativeLayout;)V",
        "_like",
        "j",
        "get_subtitle",
        "set_subtitle",
        "_subtitle",
        "k",
        "get_action_btn",
        "set_action_btn",
        "_action_btn",
        "l",
        "get_image",
        "set_image",
        "_image",
        "m",
        "get_match",
        "set_match",
        "_match",
        "n",
        "get_match_icon",
        "set_match_icon",
        "_match_icon",
        "Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;",
        "o",
        "Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;",
        "get_match_remaining_switch",
        "()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;",
        "set_match_remaining_switch",
        "(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;)V",
        "_match_remaining_switch",
        "p",
        "get_maskView",
        "set_maskView",
        "_maskView",
        "q",
        "Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;",
        "likedUser",
        "member_intlGmsRelease"
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
.field public a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

.field public b:Landroid/view/View;

.field public c:Lv/VDraweeView;

.field public d:Lv/VLinear;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public g:Lv/VImage;

.field public h:Lv/VImage;

.field public i:Landroid/widget/RelativeLayout;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lv/VDraweeView;

.field public m:Lv/VLinear;

.field public n:Lv/VImage;

.field public o:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

.field public p:Landroid/view/View;

.field public q:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
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

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private final E(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0xe

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->f(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    float-to-int v1, v2

    .line 54
    const/high16 v2, 0x40000000    # 2.0f

    .line 55
    .line 56
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    add-int/2addr v1, v2

    .line 61
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const/4 v1, 0x1

    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setTextList(Ljava/util/List;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const/high16 v0, 0x3f000000    # 0.5f

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setOutTranslateY(F)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const/4 v0, 0x0

    .line 106
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setAnimateDirection(Z)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    const-wide/16 v0, 0x12c

    .line 114
    .line 115
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->setInOutAnimation(J)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h()V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public static p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static s(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/data/User;ZLl/y20;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    if-eq p4, v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    if-eqz p4, :cond_1

    .line 22
    .line 23
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p4, 0x0

    .line 29
    :goto_0
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p4, p1}, Ll/fwl;->m(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-nez p2, :cond_2

    .line 35
    .line 36
    sget-object v0, Ll/sop;->INSTANCE:Ll/sop;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 43
    .line 44
    const/16 v5, 0x8

    .line 45
    .line 46
    const/4 v6, 0x0

    .line 47
    const-string v2, "p_intl_meet_view,e_intl_instantmatch_btn,click"

    .line 48
    .line 49
    const/4 v4, 0x0

    .line 50
    invoke-static/range {v0 .. v6}, Ll/sop;->l(Ll/sop;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 55
    .line 56
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static u(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;ZZLl/y20;Ll/y20;Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move v0, p3

    .line 5
    move p3, p2

    .line 6
    move-object p2, p7

    .line 7
    move-object p7, p6

    .line 8
    move-object p6, p5

    .line 9
    move-object p5, p4

    .line 10
    move p4, v0

    .line 11
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->B(Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Lcom/p1/mobile/putong/data/User;ZZLl/y20;Ll/y20;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static v(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/data/User;ZLl/y20;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 9
    .line 10
    .line 11
    move-result-object p4

    .line 12
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    if-eq p4, v0, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    if-eqz p4, :cond_1

    .line 22
    .line 23
    invoke-virtual {p4}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p4, 0x0

    .line 29
    :goto_0
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p4, p1}, Ll/fwl;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    if-nez p2, :cond_3

    .line 35
    .line 36
    invoke-static {}, Ll/joa;->R3()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-lez p1, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    sget-object v0, Ll/sop;->INSTANCE:Ll/sop;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 50
    .line 51
    const/16 v5, 0x8

    .line 52
    .line 53
    const/4 v6, 0x0

    .line 54
    const-string v2, "p_intl_meet_view,e_intl_instantmatch_btn,click"

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    invoke-static/range {v0 .. v6}, Ll/sop;->l(Ll/sop;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static w(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;ZLl/y20;Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 13
    .line 14
    if-eq p3, v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    if-eqz p3, :cond_1

    .line 22
    .line 23
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p3, 0x0

    .line 29
    :goto_0
    invoke-static {p3}, Ll/fwl;->l(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    sget-object v0, Ll/sop;->INSTANCE:Ll/sop;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 41
    .line 42
    const/16 v5, 0x8

    .line 43
    .line 44
    const/4 v6, 0x0

    .line 45
    const-string v2, "p_intl_meet_view,e_intl_instantmatch_btn,click"

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    invoke-static/range {v0 .. v6}, Ll/sop;->l(Ll/sop;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->q:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    .line 59
    .line 60
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public final B(Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Lcom/p1/mobile/putong/data/User;ZZLl/y20;Ll/y20;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;",
            "Lcom/p1/mobile/putong/data/User;",
            "ZZ",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_action_btn()Lv/VImage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/zfo;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2, p3, p6}, Ll/zfo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/data/User;ZLl/y20;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match()Lv/VLinear;

    .line 14
    .line 15
    .line 16
    move-result-object p6

    .line 17
    new-instance v0, Ll/ago;

    .line 18
    .line 19
    invoke-direct {v0, p0, p2, p3, p7}, Ll/ago;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/data/User;ZLl/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p6, v0}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    new-instance p6, Ll/bgo;

    .line 26
    .line 27
    invoke-direct {p6, p0, p3, p5}, Ll/bgo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;ZLl/y20;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_image()Lv/VDraweeView;

    .line 31
    .line 32
    .line 33
    move-result-object p5

    .line 34
    invoke-static {p5, p6}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_header_pic()Lv/VDraweeView;

    .line 38
    .line 39
    .line 40
    move-result-object p5

    .line 41
    invoke-static {p5, p6}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_content()Lv/VLinear;

    .line 45
    .line 46
    .line 47
    move-result-object p5

    .line 48
    invoke-static {p5, p6}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_maskView()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p5

    .line 55
    xor-int/lit8 p6, p3, 0x1

    .line 56
    .line 57
    invoke-static {p5, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_maskView()Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p5

    .line 64
    const/4 p6, 0x0

    .line 65
    invoke-virtual {p5, p6}, Landroid/view/View;->setClickable(Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_maskView()Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p5

    .line 72
    invoke-virtual {p5, p6}, Landroid/view/View;->setFocusable(Z)V

    .line 73
    .line 74
    .line 75
    if-eqz p4, :cond_0

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_maskView()Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p5

    .line 81
    const-string p6, "#00000000"

    .line 82
    .line 83
    invoke-static {p6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result p6

    .line 87
    invoke-virtual {p5, p6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_maskView()Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p5

    .line 95
    const-string p6, "#88ffffff"

    .line 96
    .line 97
    invoke-static {p6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result p6

    .line 101
    invoke-virtual {p5, p6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 102
    .line 103
    .line 104
    :goto_0
    if-nez p3, :cond_1

    .line 105
    .line 106
    if-nez p4, :cond_1

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match()Lv/VLinear;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    const/high16 p4, 0x3f000000    # 0.5f

    .line 113
    .line 114
    invoke-virtual {p3, p4}, Landroid/view/View;->setAlpha(F)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_match()Lv/VLinear;

    .line 119
    .line 120
    .line 121
    move-result-object p3

    .line 122
    const/high16 p4, 0x3f800000    # 1.0f

    .line 123
    .line 124
    invoke-virtual {p3, p4}, Landroid/view/View;->setAlpha(F)V

    .line 125
    .line 126
    .line 127
    :goto_1
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 128
    .line 129
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_header_pic()Lv/VDraweeView;

    .line 130
    .line 131
    .line 132
    move-result-object p4

    .line 133
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 134
    .line 135
    .line 136
    move-result-object p5

    .line 137
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 138
    .line 139
    .line 140
    move-result-object p5

    .line 141
    invoke-virtual {p5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p5

    .line 145
    invoke-virtual {p3, p4, p5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 149
    .line 150
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_image()Lv/VDraweeView;

    .line 151
    .line 152
    .line 153
    move-result-object p4

    .line 154
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-virtual {p3, p4, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_title_big()Lv/VText;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    iget-object p3, p1, Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;->title:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    sget p3, Lcom/p1/mobile/putong/core/member/R$string;->u0:I

    .line 183
    .line 184
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    filled-new-array {p2}, [Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p2

    .line 192
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    .line 198
    .line 199
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->E(Ljava/util/List;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_subtitle()Lv/VText;

    .line 203
    .line 204
    .line 205
    move-result-object p2

    .line 206
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;->describe:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_action_btn()Lv/VImage;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_2

    .line 220
    .line 221
    sget p1, Ll/gbc0;->N:I

    .line 222
    .line 223
    goto :goto_2

    .line 224
    :cond_2
    sget p1, Ll/gbc0;->M:I

    .line 225
    .line 226
    :goto_2
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 227
    .line 228
    .line 229
    return-void
.end method

.method public final C(Ll/fko;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Ljava/lang/String;ZZLl/y20;Ll/y20;Ll/y20;)V
    .locals 9
    .param p1    # Ll/fko;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fko;",
            "Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;",
            "Ljava/lang/String;",
            "ZZ",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
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
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual/range {p8 .. p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->get_divider()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    xor-int/lit8 v1, p4, 0x1

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->q:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    .line 29
    .line 30
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 33
    .line 34
    invoke-virtual {v0, p3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    if-nez v3, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-virtual {v1, p3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    invoke-virtual {p1, v0, p3}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    new-instance v0, Ll/xfo;

    .line 59
    .line 60
    move-object v1, p0

    .line 61
    move-object v2, p2

    .line 62
    move v4, p4

    .line 63
    move v3, p5

    .line 64
    move-object v5, p6

    .line 65
    move-object/from16 v6, p7

    .line 66
    .line 67
    move-object/from16 v7, p8

    .line 68
    .line 69
    invoke-direct/range {v0 .. v7}, Ll/xfo;-><init>(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;ZZLl/y20;Ll/y20;Ll/y20;)V

    .line 70
    .line 71
    .line 72
    new-instance p0, Ll/yfo;

    .line 73
    .line 74
    invoke-direct {p0}, Ll/yfo;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void

    .line 85
    :cond_1
    move-object v1, p0

    .line 86
    move-object v2, p2

    .line 87
    move v5, p4

    .line 88
    move v4, p5

    .line 89
    move-object v6, p6

    .line 90
    move-object/from16 v7, p7

    .line 91
    .line 92
    move-object/from16 v8, p8

    .line 93
    .line 94
    invoke-virtual/range {v1 .. v8}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->B(Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Lcom/p1/mobile/putong/data/User;ZZLl/y20;Ll/y20;Ll/y20;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method public final get_action_btn()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->k:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_action_btn"

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

.method public final get_content()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->d:Lv/VLinear;

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

.method public final get_divider()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->b:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_divider"

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

.method public final get_header_pic()Lv/VDraweeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_header_pic"

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->l:Lv/VDraweeView;

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

.method public final get_like()Landroid/widget/RelativeLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->i:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_like"

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

.method public final get_maskView()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->p:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_maskView"

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

.method public final get_match()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->m:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_match"

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

.method public final get_match_icon()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->n:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_match_icon"

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

.method public final get_match_remaining_switch()Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->o:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_match_remaining_switch"

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

.method public final get_pic_tag_big()Lv/VLinear;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->f:Lv/VLinear;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_pic_tag_big"

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

.method public final get_pic_tag_big_pic_verify_logo()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->g:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_pic_tag_big_pic_verify_logo"

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

.method public final get_pic_tag_big_svip_tag()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->h:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_pic_tag_big_svip_tag"

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

.method public final get_root()Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_root"

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

.method public final get_subtitle()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->j:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_subtitle"

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

.method public final get_title_big()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->e:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_title_big"

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

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->z(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final set_action_btn(Lv/VImage;)V
    .locals 0
    .param p1    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->k:Lv/VImage;

    .line 5
    .line 6
    return-void
.end method

.method public final set_content(Lv/VLinear;)V
    .locals 0
    .param p1    # Lv/VLinear;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->d:Lv/VLinear;

    .line 5
    .line 6
    return-void
.end method

.method public final set_divider(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->b:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method

.method public final set_header_pic(Lv/VDraweeView;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->c:Lv/VDraweeView;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->l:Lv/VDraweeView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_like(Landroid/widget/RelativeLayout;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->i:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_maskView(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->p:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method

.method public final set_match(Lv/VLinear;)V
    .locals 0
    .param p1    # Lv/VLinear;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->m:Lv/VLinear;

    .line 5
    .line 6
    return-void
.end method

.method public final set_match_icon(Lv/VImage;)V
    .locals 0
    .param p1    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->n:Lv/VImage;

    .line 5
    .line 6
    return-void
.end method

.method public final set_match_remaining_switch(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->o:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_pic_tag_big(Lv/VLinear;)V
    .locals 0
    .param p1    # Lv/VLinear;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->f:Lv/VLinear;

    .line 5
    .line 6
    return-void
.end method

.method public final set_pic_tag_big_pic_verify_logo(Lv/VImage;)V
    .locals 0
    .param p1    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->g:Lv/VImage;

    .line 5
    .line 6
    return-void
.end method

.method public final set_pic_tag_big_svip_tag(Lv/VImage;)V
    .locals 0
    .param p1    # Lv/VImage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->h:Lv/VImage;

    .line 5
    .line 6
    return-void
.end method

.method public final set_root(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->a:Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_subtitle(Lv/VText;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->j:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_title_big(Lv/VText;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;->e:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cgo;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetLikedItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
