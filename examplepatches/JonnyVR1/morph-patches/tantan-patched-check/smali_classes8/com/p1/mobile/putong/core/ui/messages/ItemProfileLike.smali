.class public Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# static fields
.field public static j:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

.field public h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

.field public i:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->i:Ljava/util/Set;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->onFinishInflate()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->i:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 18
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->i:Ljava/util/Set;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d()V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static synthetic c(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method private synthetic d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/l51;->q(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private e(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->i:Ljava/util/Set;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->i:Ljava/util/Set;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    new-instance v0, Ll/pf60;

    .line 46
    .line 47
    const-string v1, "other_user_id"

    .line 48
    .line 49
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ll/pf60;

    .line 55
    .line 56
    const-string v2, "profile_module"

    .line 57
    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->getModuleName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-direct {v1, v2, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Ll/pf60;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 68
    .line 69
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->hasComment:Z

    .line 70
    .line 71
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    const-string v2, "have_comment"

    .line 76
    .line 77
    invoke-direct {p0, v2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    filled-new-array {v0, v1, p0}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "e_profile_like_message"

    .line 85
    .line 86
    const-string v0, "p_chat_view"

    .line 87
    .line 88
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method private getModuleName()Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

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
    const-string p0, "NA"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const-string v1, "mbti"

    .line 26
    .line 27
    const-string v2, "game"

    .line 28
    .line 29
    const-string v3, "pet"

    .line 30
    .line 31
    const/4 v4, -0x1

    .line 32
    sparse-switch v0, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :sswitch_0
    const-string v0, "life_pic"

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 v4, 0x5

    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    const/4 v4, 0x4

    .line 55
    goto :goto_0

    .line 56
    :sswitch_2
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v4, 0x3

    .line 64
    goto :goto_0

    .line 65
    :sswitch_3
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 v4, 0x2

    .line 73
    goto :goto_0

    .line 74
    :sswitch_4
    const-string v0, "question"

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v4, 0x1

    .line 84
    goto :goto_0

    .line 85
    :sswitch_5
    const-string v0, "aboutMe"

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 v4, 0x0

    .line 95
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 96
    .line 97
    .line 98
    const-string p0, "unknown"

    .line 99
    .line 100
    return-object p0

    .line 101
    :pswitch_0
    const-string p0, "photo"

    .line 102
    .line 103
    return-object p0

    .line 104
    :pswitch_1
    return-object v1

    .line 105
    :pswitch_2
    return-object v2

    .line 106
    :pswitch_3
    return-object v3

    .line 107
    :pswitch_4
    const-string p0, "answer"

    .line 108
    .line 109
    return-object p0

    .line 110
    :pswitch_5
    const-string p0, "self_introduction"

    .line 111
    .line 112
    return-object p0

    .line 113
    :sswitch_data_0
    .sparse-switch
        -0x473581fb -> :sswitch_5
        -0x457dc41a -> :sswitch_4
        0x1b11f -> :sswitch_3
        0x304bf2 -> :sswitch_2
        0x330aca -> :sswitch_1
        0x3937b1c7 -> :sswitch_0
    .end sparse-switch

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setContent(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_8

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto/16 :goto_4

    .line 21
    .line 22
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    const/4 v0, 0x0

    .line 40
    :goto_0
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 43
    .line 44
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 45
    .line 46
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 54
    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    goto/16 :goto_3

    .line 58
    .line 59
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->c:Lv/VDraweeView;

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->e:Lv/VText;

    .line 70
    .line 71
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 72
    .line 73
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->title:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->f:Lv/VText;

    .line 79
    .line 80
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 81
    .line 82
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    const/4 v3, 0x1

    .line 89
    xor-int/2addr v2, v3

    .line 90
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_3

    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->f:Lv/VText;

    .line 104
    .line 105
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 106
    .line 107
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 115
    .line 116
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->comment:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 122
    .line 123
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    .line 127
    .line 128
    const-string v2, "aboutMe"

    .line 129
    .line 130
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-nez v2, :cond_6

    .line 135
    .line 136
    const-string v2, "question"

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-nez v0, :cond_4

    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->c:Lv/VDraweeView;

    .line 145
    .line 146
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 150
    .line 151
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->c:Lv/VDraweeView;

    .line 152
    .line 153
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->picture:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0, p0, p1, v1}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_5

    .line 174
    .line 175
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 176
    .line 177
    sget v0, Ll/ibc0;->Q5:I

    .line 178
    .line 179
    invoke-static {p1, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 180
    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 188
    .line 189
    sget v1, Ll/ibc0;->y:I

    .line 190
    .line 191
    invoke-static {p1, v0, v1}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 195
    .line 196
    sget v0, Ll/ibc0;->P5:I

    .line 197
    .line 198
    invoke-static {p1, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 199
    .line 200
    .line 201
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 202
    .line 203
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 204
    .line 205
    .line 206
    goto :goto_3

    .line 207
    :cond_6
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_7

    .line 220
    .line 221
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 222
    .line 223
    sget v0, Ll/ibc0;->O5:I

    .line 224
    .line 225
    invoke-static {p1, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 234
    .line 235
    sget v1, Ll/ibc0;->x:I

    .line 236
    .line 237
    invoke-static {p1, v0, v1}, Ll/bnl0;->A0(Landroid/content/Context;Landroid/view/View;I)V

    .line 238
    .line 239
    .line 240
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 241
    .line 242
    sget v0, Ll/ibc0;->N5:I

    .line 243
    .line 244
    invoke-static {p1, v0}, Ll/bnl0;->N(Landroid/widget/ImageView;I)V

    .line 245
    .line 246
    .line 247
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 248
    .line 249
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 250
    .line 251
    .line 252
    :goto_3
    return-void

    .line 253
    :cond_8
    :goto_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 254
    .line 255
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method private setWarmingUp(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 11

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 35
    .line 36
    instance-of p1, p1, Ll/tvz;

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 47
    .line 48
    check-cast p1, Ll/tvz;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/clz;->l3()Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget v0, p1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 55
    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->first:Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;

    .line 57
    .line 58
    iget v1, v1, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;->value:I

    .line 59
    .line 60
    if-le v0, v1, :cond_1

    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->i(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    sget v4, Ll/qa00;->i:I

    .line 69
    .line 70
    const/4 v7, 0x0

    .line 71
    const/4 v8, 0x0

    .line 72
    const/4 v5, -0x1

    .line 73
    const/4 v6, 0x0

    .line 74
    invoke-static/range {v2 .. v8}, Ll/zfm;->b(Landroid/view/View;IIIIII)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 78
    .line 79
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper;->i(Lcom/p1/mobile/putong/core/ui/messages/helper/MessageWarmingUpHelper$WarmingUpLevel;)I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    const/4 v9, 0x0

    .line 84
    const/4 v10, 0x0

    .line 85
    const/4 v7, -0x1

    .line 86
    move v6, v4

    .line 87
    move-object v4, p0

    .line 88
    invoke-static/range {v4 .. v10}, Ll/zfm;->b(Landroid/view/View;IIIIII)V

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    :catch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->h:Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->setContent(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 38
    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->e(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->setWarmingUp(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 3
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
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ieq;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ieq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;)V

    .line 14
    .line 15
    .line 16
    sget p0, Ll/ibc0;->x1:I

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v1, p0, v2}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {p0}, [Ll/ovb0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public U(Ll/pol;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 2
    .line 3
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemText;->y(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/ui/messages/a$a;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 7
    .line 8
    new-instance p3, Ll/jeq;

    .line 9
    .line 10
    invoke-direct {p3}, Ll/jeq;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 17
    .line 18
    new-instance p3, Ll/keq;

    .line 19
    .line 20
    invoke-direct {p3}, Ll/keq;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->A(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->setWarmingUp(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/edc0;->Z:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;

    .line 13
    .line 14
    sget v0, Ll/edc0;->a0:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 23
    .line 24
    sget v0, Ll/edc0;->h0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->c:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/edc0;->k1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VImage;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->d:Lv/VImage;

    .line 43
    .line 44
    sget v0, Ll/edc0;->Q4:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->e:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/edc0;->r0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VText;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->f:Lv/VText;

    .line 63
    .line 64
    sget v0, Ll/edc0;->A4:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->g:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 73
    .line 74
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_0

    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->e:Lv/VText;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Ll/g9c0;->g:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->f:Lv/VText;

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    sget v1, Ll/g9c0;->i:I

    .line 110
    .line 111
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    .line 117
    .line 118
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/dox;->d(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput v0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->j:I

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemProfileLike;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLinearMaxWidth;->setMaxWidth(I)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
