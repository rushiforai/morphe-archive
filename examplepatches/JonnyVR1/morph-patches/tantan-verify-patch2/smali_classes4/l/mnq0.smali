.class public final Ll/mnq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0015\u0010\u000b\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cR\"\u0010\u0012\u001a\u00020\u00048\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0008\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/mnq0;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;",
        "view",
        "",
        "b",
        "(Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;)V",
        "Lcom/p1/mobile/android/app/Frag;",
        "frag",
        "d",
        "(Lcom/p1/mobile/android/app/Frag;)V",
        "a",
        "Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;",
        "c",
        "()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;",
        "e",
        "youthVipBasePrivilegeView",
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
.field public a:Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;


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

.method public static a(Lcom/p1/mobile/android/app/Frag;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_youthvip_find_partner"

    .line 2
    .line 3
    const-string v0, "p_youthvip_page"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Wa()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    const-string p0, "\u4f60\u5df2\u4ece\u9752\u6625\u4e13\u533a\u6bd5\u4e1a\uff0c\u53bb\u5176\u4ed6\u9875\u9762\u8f6c\u8f6c\u5427~"

    .line 21
    .line 22
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-static {}, Ll/zwk;->e()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const-string p1, "http://m.staging2.p1staff.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/find-partner/index.html?speed=true&_bid=1004357&hideNavigationBar=1&hideNotch=1&from=youth_vip#/"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p1, "https://m.tantanapp.com/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/find-partner/index.html?speed=true&_bid=1004357&hideNavigationBar=1&hideNotch=1&from=youth_vip#/"

    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string v0, "tantan://webview?url="

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/mnq0;->e(Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mnq0;->a:Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "youthVipBasePrivilegeView"

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

.method public final d(Lcom/p1/mobile/android/app/Frag;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/android/app/Frag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mnq0;->a:Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_root_view()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/gbc0;->T5:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_texture()Lv/VDraweeView;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget v2, Ll/gbc0;->b6:I

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_icon()Landroid/widget/ImageView;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget v1, Ll/gbc0;->Y5:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_title()Landroid/widget/TextView;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "\u627e\u642d\u5b50\u4e13\u533a"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_subtitle()Landroid/widget/TextView;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "\u627e\u4eba\u4e00\u8d77\u5403\u996d\uff0c\u8fd0\u52a8"

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_model_icon()Landroid/widget/ImageView;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {}, Ll/c17;->u0()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_0

    .line 88
    .line 89
    sget v1, Ll/gbc0;->Z5:I

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_0
    sget v1, Ll/gbc0;->a6:I

    .line 93
    .line 94
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_go_btn()Landroid/widget/TextView;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const-string v1, "\u70b9\u51fb\u8fdb\u5165"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/mnq0;->c()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;->get_root_view()Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    new-instance v0, Ll/lnq0;

    .line 119
    .line 120
    invoke-direct {v0, p1}, Ll/lnq0;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 121
    .line 122
    .line 123
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    :cond_1
    return-void
.end method

.method public final e(Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mnq0;->a:Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipBasePrivilegeView;

    .line 5
    .line 6
    return-void
.end method
