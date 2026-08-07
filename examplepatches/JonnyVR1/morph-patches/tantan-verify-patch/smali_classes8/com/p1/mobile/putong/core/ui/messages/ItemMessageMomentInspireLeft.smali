.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# static fields
.field public static final j:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/data/Message;

.field public h:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x43520000    # 210.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->j:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->d(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->e(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V

    return-void
.end method

.method private setClickEvent(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->e:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ll/faq;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/faq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->f:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/gaq;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/gaq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i:Z

    .line 34
    .line 35
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->g:Lcom/p1/mobile/putong/core/data/Message;

    .line 36
    .line 37
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->h:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    if-nez p1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->g(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->h:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 56
    .line 57
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->setClickEvent(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 58
    .line 59
    .line 60
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i:Z

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->h:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_0
    move-exception p0

    .line 71
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    :goto_0
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/haq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->h(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;

    .line 13
    .line 14
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->schema:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->cancelSchema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;

    .line 10
    .line 11
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->cancelSchema:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/core/data/MessageView;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/data/MessageView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageView;->cancelText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->f:Lv/VText;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->f:Lv/VText;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->cancelText:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->f(Lcom/p1/mobile/putong/core/data/MessageView;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 9
    .line 10
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MessageView;->isTextOnly:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->d:Lv/VText;

    .line 15
    .line 16
    const v1, 0x7fffffff

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->d:Lv/VText;

    .line 23
    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageView;->text:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->e:Lv/VText;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->button:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->b:Lv/VDraweeView;

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->b:Lv/VDraweeView;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->d:Lv/VText;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageView;->text:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->d:Lv/VText;

    .line 63
    .line 64
    const/4 v1, 0x3

    .line 65
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->e:Lv/VText;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageView;->button:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->b:Lv/VDraweeView;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->view:Lcom/p1/mobile/putong/core/data/MessageView;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageView;->image:Ljava/lang/String;

    .line 84
    .line 85
    sget v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->j:I

    .line 86
    .line 87
    invoke-virtual {v0, p0, p1, v1, v1}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string p1, "e_boost_pop_use"

    .line 44
    .line 45
    const-string v0, "p_chat_view"

    .line 46
    .line 47
    invoke-static {p1, v0, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;->eventExtra:Ljava/util/Map;

    .line 34
    .line 35
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string p1, "e_boost_pop_use"

    .line 44
    .line 45
    const-string v1, "p_chat_view"

    .line 46
    .line 47
    invoke-static {p1, v1, v0}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->i:Z

    .line 52
    .line 53
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x41000000    # 8.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-float v0, v0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {v1, v0, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->b:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/wlj;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->d:Lv/VText;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMomentInspireLeft;->e:Lv/VText;

    .line 46
    .line 47
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
