.class public abstract Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;
    }
.end annotation


# static fields
.field public static final j:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

.field public volatile d:Z

.field public final e:[F

.field public final f:[F

.field public final g:[F

.field public final h:[F

.field public final i:[F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$a;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    const-string v2, "paramsWidth"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->j:Landroid/util/Property;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "CNMTLayout"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string p1, ""

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v1, v0, [F

    .line 17
    .line 18
    fill-array-data v1, :array_0

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 22
    .line 23
    new-array v1, v0, [F

    .line 24
    .line 25
    fill-array-data v1, :array_1

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->f:[F

    .line 29
    .line 30
    new-array v1, v0, [F

    .line 31
    .line 32
    fill-array-data v1, :array_2

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->g:[F

    .line 36
    .line 37
    const/high16 v1, 0x41700000    # 15.0f

    .line 38
    .line 39
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    int-to-float v2, v2

    .line 44
    new-array v3, v0, [F

    .line 45
    .line 46
    aput v2, v3, p1

    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    const/4 v4, 0x0

    .line 50
    aput v4, v3, v2

    .line 51
    .line 52
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->h:[F

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    neg-int v1, v1

    .line 59
    int-to-float v1, v1

    .line 60
    new-array v0, v0, [F

    .line 61
    .line 62
    aput v1, v0, p1

    .line 63
    .line 64
    aput v4, v0, v2

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->i:[F

    .line 67
    .line 68
    return-void

    .line 69
    :array_0
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data

    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    .line 69
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 70
    const-string p1, "CNMTLayout"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->a:Ljava/lang/String;

    .line 71
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    const/4 p1, 0x0

    .line 72
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    const/4 p2, 0x2

    .line 73
    new-array v0, p2, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 74
    new-array v0, p2, [F

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->f:[F

    .line 75
    new-array v0, p2, [F

    fill-array-data v0, :array_2

    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->g:[F

    const/high16 v0, 0x41700000    # 15.0f

    .line 76
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v1

    int-to-float v1, v1

    new-array v2, p2, [F

    aput v1, v2, p1

    const/4 v1, 0x1

    const/4 v3, 0x0

    aput v3, v2, v1

    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->h:[F

    .line 77
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    new-array p2, p2, [F

    aput v0, p2, p1

    aput v3, p2, v1

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->i:[F

    return-void

    :array_0
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 78
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 79
    const-string p1, "CNMTLayout"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->a:Ljava/lang/String;

    .line 80
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    const/4 p1, 0x0

    .line 81
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    const/4 p2, 0x2

    .line 82
    new-array p3, p2, [F

    fill-array-data p3, :array_0

    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 83
    new-array p3, p2, [F

    fill-array-data p3, :array_1

    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->f:[F

    .line 84
    new-array p3, p2, [F

    fill-array-data p3, :array_2

    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->g:[F

    const/high16 p3, 0x41700000    # 15.0f

    .line 85
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result v0

    int-to-float v0, v0

    new-array v1, p2, [F

    aput v0, v1, p1

    const/4 v0, 0x1

    const/4 v2, 0x0

    aput v2, v1, v0

    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->h:[F

    .line 86
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    neg-int p3, p3

    int-to-float p3, p3

    new-array p2, p2, [F

    aput p3, p2, p1

    aput v2, p2, v0

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->i:[F

    return-void

    :array_0
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->S(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->K()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->M(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lv/VText;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->L(Lv/VText;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->G()V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract C(Ljava/lang/Runnable;)V
.end method

.method public final E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 7
    .line 8
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->D:I

    .line 9
    .line 10
    if-ne p1, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "new_match"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->E:I

    .line 16
    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    const-string p0, "no_chat_reminder"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 23
    .line 24
    if-ne p1, v0, :cond_3

    .line 25
    .line 26
    const-string p0, "no_chat_default"

    .line 27
    .line 28
    :cond_3
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->N(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic G()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic K()V
    .locals 1

    .line 1
    new-instance v0, Ll/qi2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qi2;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->C(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic L(Lv/VText;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "other_user_id"

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_newuser_icebreak_lead2"

    .line 14
    .line 15
    const-string v1, "p_messages_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    const-string v0, "text"

    .line 25
    .line 26
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {v0, p0, p2, v1}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance p1, Ll/oi2;

    .line 64
    .line 65
    invoke-direct {p1}, Ll/oi2;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string p1, "showNewMatchUserGuidePop"

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->j8:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/adc0;->I0:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/TextView;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p1, "\u4ed6"

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    :goto_0
    const-string p1, "\u5979"

    .line 37
    .line 38
    :goto_1
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v2, "\u4f60\u7684\u65b0\u914d\u5bf9\u88ab\u6298\u53e0\u5728\u8fd9\u91cc\u5566\n\u8ddf%s\u6253\u4e2a\u62db\u547c\u5427\uff01"

    .line 43
    .line 44
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    sget p1, Ll/adc0;->Db:I

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lv/VText;

    .line 58
    .line 59
    new-instance v1, Ll/si2;

    .line 60
    .line 61
    invoke-direct {v1, p0, p1}, Ll/si2;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lv/VText;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    const-string v1, "[\u563f\u54c8]\u4f60\u597d"

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-direct {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 79
    .line 80
    .line 81
    const-string v1, "\u70b9\u51fb\u5feb\u6377\u8868\u60c5\u6253\u4e2a\u62db\u547c\n\u66f4\u5bb9\u6613\u5f97\u5230\u56de\u590d\u54e6\uff01"

    .line 82
    .line 83
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sget v2, Ll/c9c0;->I:I

    .line 92
    .line 93
    invoke-static {v1, v2}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    filled-new-array {v1}, [I

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const/4 v1, 0x1

    .line 106
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    const/4 v0, 0x0

    .line 115
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    sget v1, Ll/qa00;->h:I

    .line 120
    .line 121
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    sget v1, Ll/qa00;->j:I

    .line 126
    .line 127
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->v(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-wide/16 v1, 0x1388

    .line 132
    .line 133
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    sget v1, Ll/zvk;->A:I

    .line 138
    .line 139
    sget v2, Ll/zvk;->E:I

    .line 140
    .line 141
    or-int/2addr v1, v2

    .line 142
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    const-string v2, "showNewMatchUserGuidePop"

    .line 151
    .line 152
    invoke-virtual {v1, p1, p0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    const-string p0, "p_messages_view"

    .line 156
    .line 157
    new-array p1, v0, [Ll/sfj0$a;

    .line 158
    .line 159
    const-string v0, "e_newuser_icebreak_lead2"

    .line 160
    .line 161
    invoke-static {v0, p0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public final N(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    .line 12
    .line 13
    new-instance v0, Ll/pi2;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/pi2;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->C()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-gt v1, p1, :cond_1

    .line 27
    .line 28
    const-wide/16 v1, 0x64

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const-wide/16 v1, 0x3e8

    .line 32
    .line 33
    :goto_0
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_3

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->isAnonymous()Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getAnonymousUrl()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p2, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 50
    .line 51
    invoke-static {p1}, Ll/vx6;->a(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0, p2, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    :goto_0
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 68
    .line 69
    sget p1, Ll/dbc0;->i0:I

    .line 70
    .line 71
    invoke-virtual {p0, p2, p1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public abstract P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
.end method

.method public Q(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->d:Ljava/util/Set;

    .line 6
    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->d:Ljava/util/Set;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v1, "moments_user_id"

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    new-array v1, v1, [Ll/sfj0$a;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, [Ll/sfj0$a;

    .line 54
    .line 55
    const-string v1, "e_new_match_notification"

    .line 56
    .line 57
    const-string v2, "p_messages_view"

    .line 58
    .line 59
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    new-instance v0, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    const-string v1, "other_user_id"

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    const-string p0, "no_chat_entrance_type"

    .line 89
    .line 90
    invoke-static {p0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    new-array p0, p0, [Ll/sfj0$a;

    .line 102
    .line 103
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    check-cast p0, [Ll/sfj0$a;

    .line 108
    .line 109
    const-string p1, "e_nochat_match_entrance"

    .line 110
    .line 111
    invoke-static {p1, v2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 112
    .line 113
    .line 114
    :cond_1
    :goto_0
    return-void
.end method

.method public R()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    long-to-double v1, v1

    .line 14
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 15
    .line 16
    sub-double/2addr v1, v3

    .line 17
    invoke-static {}, Ll/gra;->I3()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const-wide v3, 0x4194997000000000L    # 8.64E7

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    cmpg-double v0, v1, v3

    .line 29
    .line 30
    if-ltz v0, :cond_1

    .line 31
    .line 32
    const-wide v3, 0x41c2064200000000L    # 6.048E8

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    cmpl-double v0, v1, v3

    .line 38
    .line 39
    if-gtz v0, :cond_1

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->z1:Ll/jxd0;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->z1:Ll/jxd0;

    .line 75
    .line 76
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    new-instance v2, Ll/ri2;

    .line 86
    .line 87
    invoke-direct {v2, p0, v0}, Ll/ri2;-><init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;Lcom/p1/mobile/putong/data/User;)V

    .line 88
    .line 89
    .line 90
    const-wide/16 v3, 0x64

    .line 91
    .line 92
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 93
    .line 94
    .line 95
    :cond_1
    :goto_0
    return-void
.end method

.method public final S(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NewMatchBackSp;->new_()Lcom/p1/mobile/putong/core/data/NewMatchBackSp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/data/NewMatchBackSp;->num:I

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/NewMatchBackSp;->lastUpdateTime:J

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/NewMatchBackSp;->userId:Ljava/lang/String;

    .line 15
    .line 16
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->E0:Ll/wyd0;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/NewMatchBackSp;->toJson()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method
