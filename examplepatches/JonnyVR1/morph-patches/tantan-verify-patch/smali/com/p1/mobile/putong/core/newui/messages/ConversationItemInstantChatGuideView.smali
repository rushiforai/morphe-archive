.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VImage;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Lcom/p1/mobile/android/app/Act;

.field public j:Lcom/p1/mobile/putong/core/data/Conversation;

.field public k:Lcom/p1/mobile/putong/data/User;

.field public l:Ljava/lang/Long;

.field public m:Ll/w30;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->l:Ljava/lang/Long;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x0

    .line 14
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->l:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, 0x0

    .line 16
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->l:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const-wide/16 p1, 0x0

    .line 18
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->l:Ljava/lang/Long;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->l(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->h()V

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pa6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g(Z)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p0, "\u5979\u6700\u8fd1\u770b\u8fc7\u4f60"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "\u4f60\u559c\u6b22\u4e86\u5979"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    if-eqz p1, :cond_2

    .line 18
    .line 19
    const-string p0, "\u4ed6\u6700\u8fd1\u770b\u8fc7\u4f60"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    const-string p0, "\u4f60\u559c\u6b22\u4e86\u4ed6"

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic h()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, p0, v1}, Ll/sd8;->o3(Ljava/lang/String;Z)Lrx/c;

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "e_odiamond_locked_match"

    .line 10
    .line 11
    const-string v0, "p_messages_view"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    new-instance v1, Ll/ma6;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ma6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;)V

    .line 23
    .line 24
    .line 25
    const-string p0, "p_messages,odiamond_sayhi"

    .line 26
    .line 27
    invoke-static {p1, v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/match/b;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->m:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->m:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-virtual {p1, p0, p2}, Ll/sd8;->o3(Ljava/lang/String;Z)Lrx/c;

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)Z
    .locals 3

    .line 1
    new-instance p1, Ll/w30$b;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "\u5220\u9664"

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v1, Ll/na6;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/na6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/oa6;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/oa6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->m:Ll/w30;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return p0
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    const/16 p0, 0x8

    invoke-virtual {p0, p0}, Landroid/view/View;->setVisibility(I)V

    const/4 p0, 0x0

    invoke-virtual {p0, p0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, p0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 10
    .line 11
    invoke-interface {p1, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->p()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->s()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->r()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final n(Z)V
    .locals 7

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->g(Z)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v4

    .line 10
    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const-string v1, "#9F6820"

    .line 18
    .line 19
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const-string v3, "#C58D32"

    .line 24
    .line 25
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    filled-new-array {v2, v3, v5}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const/4 v2, 0x3

    .line 38
    new-array v6, v2, [F

    .line 39
    .line 40
    fill-array-data v6, :array_0

    .line 41
    .line 42
    .line 43
    move-object v2, v1

    .line 44
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;

    .line 45
    .line 46
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    move-object v2, p0

    .line 51
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView$ShaderBLToTRSpan;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;ILjava/lang/String;[I[F)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    const/16 v3, 0x21

    .line 56
    .line 57
    invoke-virtual {v0, v1, p0, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Landroid/text/style/StyleSpan;

    .line 61
    .line 62
    const/4 v4, 0x1

    .line 63
    invoke-direct {v1, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1, p0, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 67
    .line 68
    .line 69
    const-string p0, " \u00b7 "

    .line 70
    .line 71
    invoke-virtual {v0, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 72
    .line 73
    .line 74
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 75
    .line 76
    const-string v1, "#C28B31"

    .line 77
    .line 78
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    invoke-direct {p0, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 83
    .line 84
    .line 85
    add-int/lit8 v1, p1, 0x3

    .line 86
    .line 87
    invoke-virtual {v0, p0, p1, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 88
    .line 89
    .line 90
    new-instance p0, Landroid/text/style/StyleSpan;

    .line 91
    .line 92
    invoke-direct {p0, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, p0, p1, v1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 96
    .line 97
    .line 98
    const-string p0, "\u70b9\u51fb\u6309\u94ae\u9a6c\u4e0a\u914d\u5bf9"

    .line 99
    .line 100
    invoke-virtual {v0, p0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 101
    .line 102
    .line 103
    iget-object p0, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->g:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :array_0
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3f000000    # 0.5f
        0x3f4ccccd    # 0.8f
    .end array-data
.end method

.method public final o()V
    .locals 3

    return-void

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->e:Lv/VImage;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Ll/dbc0;->Yj:I

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->e:Lv/VImage;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    :goto_0
    invoke-static {}, Ll/nrb0;->b()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->e:Lv/VImage;

    .line 44
    .line 45
    invoke-interface {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->c:Lv/VText;

    .line 8
    .line 9
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->c:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->o()V

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/sd8;->x3(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->q(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->d:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->e:Lv/VImage;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->f:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    const/4 v1, 0x0

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 69
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C2:Ll/sd8;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/sd8;->x3(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->n(Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public final q(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 55
    .line 56
    iget p1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 57
    .line 58
    packed-switch p1, :pswitch_data_0

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :pswitch_0
    sget v1, Ll/dbc0;->S5:I

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :pswitch_1
    sget v1, Ll/dbc0;->R5:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :pswitch_2
    sget v1, Ll/dbc0;->Q5:I

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :pswitch_3
    sget v1, Ll/dbc0;->P5:I

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :pswitch_4
    sget v1, Ll/dbc0;->O5:I

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :pswitch_5
    sget v1, Ll/dbc0;->N5:I

    .line 78
    .line 79
    :goto_0
    if-eqz v1, :cond_1

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->f:Lv/VDraweeView;

    .line 82
    .line 83
    const/4 v0, 0x1

    .line 84
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->f:Lv/VDraweeView;

    .line 90
    .line 91
    invoke-virtual {p1, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 92
    .line 93
    .line 94
    :cond_1
    :goto_1
    return-void

    .line 95
    :pswitch_data_0
    .packed-switch 0x1e
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final r()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->l:Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0x12c

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->l:Ljava/lang/Long;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;->k:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    const-string p0, "e_odiamond_locked_match"

    .line 38
    .line 39
    const-string v0, "p_messages_view"

    .line 40
    .line 41
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public final s()V
    .locals 1

    .line 1
    new-instance v0, Ll/ka6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ka6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/la6;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/la6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
