.class public Ll/sqh;
.super Ll/fph;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sqh$a;
    }
.end annotation


# static fields
.field public static L:Ljava/lang/String; = "p_poi_lighten_pop"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/fph;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j0(Ll/sqh;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sqh;->l0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k0(Ll/sqh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sqh;->m0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public J()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/sqh;->L:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public R()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->h:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/fph;->w:Landroid/widget/TextView;

    .line 8
    .line 9
    new-instance v1, Ll/qqh;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/qqh;-><init>(Ll/sqh;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fph;->C:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v1, p0, Ll/fph;->E:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->subTitle:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 11
    .line 12
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/fph;->H:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Ll/fph;->u:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public dismiss()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fph;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l0(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fph;->H(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/sqh;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object p1, p0, Ll/fph;->u:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/fph;->u:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    move-object v1, p1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    goto :goto_0

    .line 27
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget-object p1, p0, Ll/fph;->H:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const-string p0, "\u8bf7\u8f93\u5165\u60a8\u6b64\u523b\u7684\u60f3\u6cd5"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    iget-object p1, p0, Ll/fph;->H:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/fph;->H(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/sqh;->dismiss()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    const-string p1, "moment"

    .line 57
    .line 58
    invoke-static {p1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    new-instance v5, Ll/rqh;

    .line 63
    .line 64
    invoke-direct {v5, p0, v1}, Ll/rqh;-><init>(Ll/sqh;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const-string v3, "moment"

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    move-object v0, p0

    .line 71
    invoke-virtual/range {v0 .. v5}, Ll/fph;->G(Ljava/lang/String;Lcom/p1/mobile/putong/data/DetectCategoryType;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/fph;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
