.class public final Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/aln;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008(\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u001f\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\'\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u001f\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0019\u001a\u00020\u00182\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0010\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0017\u0010\u001e\u001a\u00020\u000b2\u0006\u0010\u001d\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ!\u0010 \u001a\u00020\u00122\u0006\u0010\u0019\u001a\u00020\u00182\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0010H\u0016\u00a2\u0006\u0004\u0008 \u0010\u001cJ\u000f\u0010!\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008!\u0010\u000fJ\u000f\u0010#\u001a\u00020\"H\u0016\u00a2\u0006\u0004\u0008#\u0010$J\u000f\u0010\u0004\u001a\u00020%H\u0016\u00a2\u0006\u0004\u0008\u0004\u0010&J\r\u0010\'\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\'\u0010\u000fJ\r\u0010(\u001a\u00020\u000b\u00a2\u0006\u0004\u0008(\u0010\u000fR\"\u0010\u0004\u001a\u00020\u00038\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008)\u0010*\u001a\u0004\u0008+\u0010,\"\u0004\u0008-\u0010\u0006R\"\u00104\u001a\u00020.8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0015\u0010/\u001a\u0004\u00080\u00101\"\u0004\u00082\u00103R\"\u0010;\u001a\u0002058\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00086\u00107\u001a\u0004\u0008\u0011\u00108\"\u0004\u00089\u0010:R\"\u0010?\u001a\u00020.8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008<\u0010/\u001a\u0004\u0008=\u00101\"\u0004\u0008>\u00103R\"\u0010E\u001a\u00020\u00078\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u001b\u0010@\u001a\u0004\u0008A\u0010B\"\u0004\u0008C\u0010DR\"\u0010H\u001a\u00020.8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010/\u001a\u0004\u0008F\u00101\"\u0004\u0008G\u00103R\"\u0010P\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008J\u0010K\u001a\u0004\u0008L\u0010M\"\u0004\u0008N\u0010OR\"\u0010X\u001a\u00020Q8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008R\u0010S\u001a\u0004\u0008T\u0010U\"\u0004\u0008V\u0010WR\"\u0010_\u001a\u00020Y8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u0016\u0010Z\u001a\u0004\u0008[\u0010\\\"\u0004\u0008]\u0010^R\"\u0010b\u001a\u00020\u00078\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008(\u0010@\u001a\u0004\u0008`\u0010B\"\u0004\u0008a\u0010DR\"\u0010e\u001a\u00020.8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\u000c\u0010/\u001a\u0004\u0008c\u00101\"\u0004\u0008d\u00103R\"\u0010i\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008f\u0010K\u001a\u0004\u0008g\u0010M\"\u0004\u0008h\u0010OR\"\u0010m\u001a\u00020Q8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008j\u0010S\u001a\u0004\u0008k\u0010U\"\u0004\u0008l\u0010WR\"\u0010q\u001a\u00020Y8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008n\u0010Z\u001a\u0004\u0008o\u0010\\\"\u0004\u0008p\u0010^R\"\u0010u\u001a\u00020\u00078\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008r\u0010@\u001a\u0004\u0008s\u0010B\"\u0004\u0008t\u0010DR\"\u0010x\u001a\u00020.8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008`\u0010/\u001a\u0004\u0008v\u00101\"\u0004\u0008w\u00103R\"\u0010{\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008o\u0010K\u001a\u0004\u0008y\u0010M\"\u0004\u0008z\u0010OR\"\u0010~\u001a\u00020Q8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008\'\u0010S\u001a\u0004\u0008|\u0010U\"\u0004\u0008}\u0010WR$\u0010\u0081\u0001\u001a\u00020Y8\u0006@\u0006X\u0086.\u00a2\u0006\u0013\n\u0004\u0008A\u0010Z\u001a\u0004\u0008\u007f\u0010\\\"\u0005\u0008\u0080\u0001\u0010^R)\u0010\u0088\u0001\u001a\u00030\u0082\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0006\u0008\u0083\u0001\u0010\u0084\u0001\u001a\u0005\u0008f\u0010\u0085\u0001\"\u0006\u0008\u0086\u0001\u0010\u0087\u0001R$\u0010\u008a\u0001\u001a\u00020Q8\u0006@\u0006X\u0086.\u00a2\u0006\u0013\n\u0004\u0008[\u0010S\u001a\u0004\u0008j\u0010U\"\u0005\u0008\u0089\u0001\u0010WR$\u0010\u008c\u0001\u001a\u00020Q8\u0006@\u0006X\u0086.\u00a2\u0006\u0013\n\u0004\u0008\u0011\u0010S\u001a\u0004\u0008n\u0010U\"\u0005\u0008\u008b\u0001\u0010WR%\u0010\u008f\u0001\u001a\u00020I8\u0006@\u0006X\u0086.\u00a2\u0006\u0014\n\u0004\u0008s\u0010K\u001a\u0005\u0008\u008d\u0001\u0010M\"\u0005\u0008\u008e\u0001\u0010OR)\u0010\u0096\u0001\u001a\u00030\u0090\u00018\u0006@\u0006X\u0086.\u00a2\u0006\u0017\n\u0005\u0008\u007f\u0010\u0091\u0001\u001a\u0006\u0008\u0092\u0001\u0010\u0093\u0001\"\u0006\u0008\u0094\u0001\u0010\u0095\u0001R\u0018\u0010\u001d\u001a\u00020\u00028\u0002@\u0002X\u0082.\u00a2\u0006\u0008\n\u0006\u0008\u0092\u0001\u0010\u0097\u0001\u00a8\u0006\u0098\u0001"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;",
        "Ll/iam;",
        "Ll/aln;",
        "Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;",
        "act",
        "<init>",
        "(Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;)V",
        "Lv/VFrame;",
        "view",
        "",
        "gender",
        "",
        "k",
        "(Lv/VFrame;Ljava/lang/String;)V",
        "z",
        "()V",
        "Landroid/view/ViewGroup;",
        "v",
        "Landroid/view/View;",
        "ic",
        "",
        "b",
        "i",
        "(Landroid/view/ViewGroup;Landroid/view/View;Z)V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "parent",
        "e",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "presenter",
        "f",
        "(Ll/aln;)V",
        "inflateView",
        "destroy",
        "Landroid/content/Context;",
        "C0",
        "()Landroid/content/Context;",
        "Lcom/p1/mobile/android/app/Act;",
        "()Lcom/p1/mobile/android/app/Act;",
        "r",
        "j",
        "a",
        "Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;",
        "getAct",
        "()Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;",
        "setAct",
        "Lv/VLinear;",
        "Lv/VLinear;",
        "get_root",
        "()Lv/VLinear;",
        "set_root",
        "(Lv/VLinear;)V",
        "_root",
        "Lv/navigationbar/VNavigationBar;",
        "c",
        "Lv/navigationbar/VNavigationBar;",
        "()Lv/navigationbar/VNavigationBar;",
        "set_navigation_bar",
        "(Lv/navigationbar/VNavigationBar;)V",
        "_navigation_bar",
        "d",
        "get_gender",
        "set_gender",
        "_gender",
        "Lv/VFrame;",
        "s",
        "()Lv/VFrame;",
        "set_male",
        "(Lv/VFrame;)V",
        "_male",
        "get_male_gender",
        "set_male_gender",
        "_male_gender",
        "Lv/VIcon;",
        "g",
        "Lv/VIcon;",
        "get_male_gender_ic_male_gender_icon",
        "()Lv/VIcon;",
        "set_male_gender_ic_male_gender_icon",
        "(Lv/VIcon;)V",
        "_male_gender_ic_male_gender_icon",
        "Lv/VText;",
        "h",
        "Lv/VText;",
        "get_male_gender_tv_male_gender_text",
        "()Lv/VText;",
        "set_male_gender_tv_male_gender_text",
        "(Lv/VText;)V",
        "_male_gender_tv_male_gender_text",
        "Lv/VImage;",
        "Lv/VImage;",
        "u",
        "()Lv/VImage;",
        "set_male_ic",
        "(Lv/VImage;)V",
        "_male_ic",
        "p",
        "set_female",
        "_female",
        "get_female_gender",
        "set_female_gender",
        "_female_gender",
        "l",
        "get_female_gender_ic_female_gender_icon",
        "set_female_gender_ic_female_gender_icon",
        "_female_gender_ic_female_gender_icon",
        "m",
        "get_female_gender_tv_female_gender_text",
        "set_female_gender_tv_female_gender_text",
        "_female_gender_tv_female_gender_text",
        "n",
        "q",
        "set_female_ic",
        "_female_ic",
        "o",
        "w",
        "set_nonbinary",
        "_nonbinary",
        "get_nonbinary_gender",
        "set_nonbinary_gender",
        "_nonbinary_gender",
        "get_nonbinary_gender_ic_nonbinary_gender_icon",
        "set_nonbinary_gender_ic_nonbinary_gender_icon",
        "_nonbinary_gender_ic_nonbinary_gender_icon",
        "get_nonbinary_gender_tv_nonbinary_gender_text",
        "set_nonbinary_gender_tv_nonbinary_gender_text",
        "_nonbinary_gender_tv_nonbinary_gender_text",
        "x",
        "set_nonbinary_ic",
        "_nonbinary_ic",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "t",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "()Landroidx/constraintlayout/widget/ConstraintLayout;",
        "set_add_more_gender_entrance",
        "(Landroidx/constraintlayout/widget/ConstraintLayout;)V",
        "_add_more_gender_entrance",
        "set_add_more_gender_entrance_tv_more_gender",
        "_add_more_gender_entrance_tv_more_gender",
        "set_add_more_gender_entrance_tv_more_gender_add",
        "_add_more_gender_entrance_tv_more_gender_add",
        "get_add_more_gender_entrance_ic_more_gender",
        "set_add_more_gender_entrance_ic_more_gender",
        "_add_more_gender_entrance_ic_more_gender",
        "Lv/VButton;",
        "Lv/VButton;",
        "y",
        "()Lv/VButton;",
        "set_save_",
        "(Lv/VButton;)V",
        "_save_",
        "Ll/aln;",
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
.field public a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Lv/VLinear;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lv/VLinear;

.field public e:Lv/VFrame;

.field public f:Lv/VLinear;

.field public g:Lv/VIcon;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VFrame;

.field public k:Lv/VLinear;

.field public l:Lv/VIcon;

.field public m:Lv/VText;

.field public n:Lv/VImage;

.field public o:Lv/VFrame;

.field public p:Lv/VLinear;

.field public q:Lv/VIcon;

.field public r:Lv/VText;

.field public s:Lv/VImage;

.field public t:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VIcon;

.field public x:Lv/VButton;

.field public y:Ll/aln;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;

    .line 8
    .line 9
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "presenter"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/aln;->l0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Ljava/lang/String;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const-string v1, "presenter"

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object p2, v0

    .line 12
    :cond_0
    invoke-virtual {p2}, Ll/aln;->j0()Lcom/p1/mobile/putong/data/IntlGender;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {p2, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_2

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 27
    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    move-object p2, v0

    .line 34
    :cond_1
    const-string v2, ""

    .line 35
    .line 36
    invoke-virtual {p2, v2}, Ll/aln;->r0(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 40
    .line 41
    if-nez p2, :cond_3

    .line 42
    .line 43
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    move-object v0, p2

    .line 48
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v0, p1}, Ll/aln;->q0(Lcom/p1/mobile/putong/data/IntlGender;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->z()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 2
    .line 3
    const-string v0, "presenter"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object p1, v1

    .line 12
    :cond_0
    invoke-virtual {p1}, Ll/aln;->i0()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_6

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 19
    .line 20
    if-eqz p1, :cond_6

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_6

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 29
    .line 30
    if-eqz p1, :cond_6

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/IntlMoreGender;->clone()Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    iget-object v2, p1, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 40
    .line 41
    if-nez v2, :cond_5

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 44
    .line 45
    if-nez v2, :cond_1

    .line 46
    .line 47
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    move-object v2, v1

    .line 51
    :cond_1
    invoke-virtual {v2}, Ll/aln;->i0()Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    move-object v2, v1

    .line 61
    :goto_0
    if-eqz v2, :cond_5

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 64
    .line 65
    if-nez v2, :cond_3

    .line 66
    .line 67
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    move-object v2, v1

    .line 71
    :cond_3
    invoke-virtual {v2}, Ll/aln;->i0()Lcom/p1/mobile/putong/data/User;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-eqz v0, :cond_4

    .line 76
    .line 77
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 78
    .line 79
    :cond_4
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v0}, Lcom/p1/mobile/putong/data/IntlGender;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/IntlGender;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p1, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 88
    .line 89
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget-object v1, Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlAddGenderDetailsAct;->Companion:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlAddGenderDetailsAct$a;

    .line 94
    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlAddGenderDetailsAct$a;->a(Landroid/content/Context;Lcom/p1/mobile/putong/data/IntlMoreGender;)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const/4 p1, 0x2

    .line 104
    invoke-virtual {v0, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 105
    .line 106
    .line 107
    :cond_6
    return-void
.end method

.method private final i(Landroid/view/ViewGroup;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->setSelected(Z)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Ll/fln;->b(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public f(Ll/aln;)V
    .locals 0
    .param p1    # Ll/aln;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/aln;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->f(Ll/aln;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public final j()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "presenter"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    invoke-virtual {v0}, Ll/aln;->k0()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->m()Lv/VText;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    sget v5, Ll/c9c0;->b:I

    .line 29
    .line 30
    :goto_0
    invoke-virtual {v4, v5}, Landroid/content/Context;->getColor(I)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    sget v5, Ll/c9c0;->h:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :goto_1
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->n()Lv/VText;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->m()Lv/VText;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    if-nez v0, :cond_4

    .line 53
    .line 54
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 55
    .line 56
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 57
    .line 58
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 59
    .line 60
    if-nez v4, :cond_2

    .line 61
    .line 62
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    move-object v4, v1

    .line 66
    :cond_2
    invoke-virtual {v4}, Ll/aln;->j0()Lcom/p1/mobile/putong/data/IntlGender;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 71
    .line 72
    if-nez p0, :cond_3

    .line 73
    .line 74
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    move-object v1, p0

    .line 79
    :goto_2
    invoke-virtual {v1}, Ll/aln;->k0()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {v0, v4, p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->Lr(Lcom/p1/mobile/putong/data/IntlGender;Ljava/lang/String;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    goto :goto_3

    .line 88
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->a:Lcom/p1/mobile/putong/core/ui/settings/intlGender/IntlGenderDetailsAct;

    .line 89
    .line 90
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Vf:I

    .line 91
    .line 92
    invoke-virtual {p0, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    :goto_3
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final k(Lv/VFrame;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/eln;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/eln;-><init>(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final l()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->t:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_add_more_gender_entrance"

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

.method public final m()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->u:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_add_more_gender_entrance_tv_more_gender"

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

.method public final n()Lv/VText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->v:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_add_more_gender_entrance_tv_more_gender_add"

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

.method public final p()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->j:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_female"

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

.method public final q()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->n:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_female_ic"

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

.method public final r()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->v()Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/bln;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/bln;-><init>(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->s()Lv/VFrame;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "male"

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->k(Lv/VFrame;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->p()Lv/VFrame;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "female"

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->k(Lv/VFrame;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->w()Lv/VFrame;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "nonbinary"

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->k(Lv/VFrame;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->l()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/cln;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/cln;-><init>(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y()Lv/VButton;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/dln;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/dln;-><init>(Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->z()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final s()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->e:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_male"

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

.method public final u()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->i:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_male_ic"

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

.method public final v()Lv/navigationbar/VNavigationBar;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->c:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_navigation_bar"

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

.method public final w()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->o:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_nonbinary"

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

.method public final x()Lv/VImage;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->s:Lv/VImage;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_nonbinary_ic"

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

.method public final y()Lv/VButton;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->x:Lv/VButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_save_"

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

.method public final z()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->s()Lv/VFrame;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->u()Lv/VImage;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    const-string v4, "presenter"

    .line 13
    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    move-object v2, v3

    .line 20
    :cond_0
    invoke-virtual {v2}, Ll/aln;->j0()Lcom/p1/mobile/putong/data/IntlGender;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v5, "male"

    .line 25
    .line 26
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-direct {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->i(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->p()Lv/VFrame;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->q()Lv/VImage;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 42
    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    move-object v2, v3

    .line 49
    :cond_1
    invoke-virtual {v2}, Ll/aln;->j0()Lcom/p1/mobile/putong/data/IntlGender;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v5, "female"

    .line 54
    .line 55
    invoke-static {v2, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-direct {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->i(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->w()Lv/VFrame;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->x()Lv/VImage;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->y:Ll/aln;

    .line 71
    .line 72
    if-nez v2, :cond_2

    .line 73
    .line 74
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    move-object v3, v2

    .line 79
    :goto_0
    invoke-virtual {v3}, Ll/aln;->j0()Lcom/p1/mobile/putong/data/IntlGender;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const-string v3, "nonbinary"

    .line 84
    .line 85
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-direct {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->i(Landroid/view/ViewGroup;Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/intlGender/a;->j()V

    .line 93
    .line 94
    .line 95
    return-void
.end method
