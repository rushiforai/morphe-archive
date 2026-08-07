.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;

.field public d:Lv/VLinear;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VText;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->j:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->j:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->j:Z

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->R(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;)Z

    move-result p0

    return p0
.end method

.method public static R(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->E2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string p0, "\u5bf9\u65b9\u5df2\u6ce8\u9500"

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->W8()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    const-string p0, "\u529f\u80fd\u5df2\u4e0b\u7ebf"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return v0

    .line 47
    :cond_2
    const/4 p0, 0x0

    .line 48
    return p0
.end method


# virtual methods
.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/eaq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ll/g900;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 8

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    if-eqz p1, :cond_3

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 16
    .line 17
    iget-object v3, v0, Ll/clz;->c:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/MsgDataMMTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lcom/p1/mobile/putong/core/data/MsgDataMMTask;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    :goto_0
    move-object v5, v0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    goto :goto_0

    .line 45
    :goto_1
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    new-instance v6, Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 54
    .line 55
    .line 56
    iget v0, v5, Lcom/p1/mobile/putong/core/data/MsgDataMMTask;->level:I

    .line 57
    .line 58
    const-string v1, "spark_level"

    .line 59
    .line 60
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    const/4 v7, 0x1

    .line 68
    if-ne v0, v7, :cond_0

    .line 69
    .line 70
    invoke-virtual {p0, p1, v4, v5, v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->T(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V

    .line 71
    .line 72
    .line 73
    const-string p1, "https://fe-static.tancdn.com/v1/raw/753e736a-14c5-4112-880a-34506bf8892614.svga"

    .line 74
    .line 75
    move-object v1, p0

    .line 76
    goto :goto_2

    .line 77
    :cond_0
    const/4 v1, 0x2

    .line 78
    if-ne v0, v1, :cond_1

    .line 79
    .line 80
    move-object v1, p0

    .line 81
    move-object v2, p1

    .line 82
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->V(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V

    .line 83
    .line 84
    .line 85
    const-string p1, "https://fe-static.tancdn.com/v1/raw/c192eff9-8ece-4fe3-8fbd-d3aaa5e275af14.svga"

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_1
    move-object v1, p0

    .line 89
    move-object v2, p1

    .line 90
    const/4 p0, 0x3

    .line 91
    if-lt v0, p0, :cond_2

    .line 92
    .line 93
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->W(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V

    .line 94
    .line 95
    .line 96
    const-string p1, "https://fe-static.tancdn.com/v1/raw/8be24bd9-1be1-470d-a176-a75236f70aa914.svga"

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_2
    const-string p1, ""

    .line 100
    .line 101
    :goto_2
    iget-object p0, p2, Ll/g900;->r:Ll/n100;

    .line 102
    .line 103
    invoke-virtual {v1, p0, p3, v6}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->Y(Ll/n100;Lcom/p1/mobile/putong/core/data/Message;Ljava/util/Map;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_3

    .line 108
    .line 109
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-nez p0, :cond_3

    .line 114
    .line 115
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0, v7}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-virtual {p0, v7}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    iget-object p1, v1, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 136
    .line 137
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->X()V

    .line 141
    .line 142
    .line 143
    :cond_3
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/MsgDataMMTask;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->f:Lv/VText;

    .line 2
    .line 3
    iget p3, p3, Lcom/p1/mobile/putong/core/data/MsgDataMMTask;->mmCnt:I

    .line 4
    .line 5
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    const-string v1, "\u5df2\u4e92\u53d1%s\u6761\u6d88\u606f\uff0c\u6210\u529f\u70b9\u4eae\u706b\u82b1"

    .line 14
    .line 15
    invoke-static {v1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->g:Lv/VText;

    .line 23
    .line 24
    const-string v0, "\u804a\u5f97\u8d8a\u591a\u706b\u82b1\u8d8a\u65fa\u76db\uff0c\u5173\u7cfb\u66f4\u5bc6\u5207"

    .line 25
    .line 26
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->i:Lv/VText;

    .line 30
    .line 31
    const-string v0, "\u53bb\u770b\u770b"

    .line 32
    .line 33
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->i:Lv/VText;

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$e;

    .line 39
    .line 40
    invoke-direct {v0, p0, p1, p2, p4}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$e;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p3, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/MsgDataMMTask;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->f:Lv/VText;

    .line 2
    .line 3
    iget v1, p4, Lcom/p1/mobile/putong/core/data/MsgDataMMTask;->mmCnt:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "\u4f60\u4eec\u5df2\u4e92\u53d1%s\u6761\u6d88\u606f"

    .line 14
    .line 15
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/MsgDataMMTask;->taskNames:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v1, "change_answer"

    .line 29
    .line 30
    const-string v2, "change_pic"

    .line 31
    .line 32
    const-string v3, "voice"

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    move v4, v0

    .line 38
    :goto_0
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    if-ge v4, v5, :cond_1

    .line 43
    .line 44
    invoke-interface {p4, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    check-cast v5, Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v5, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-eqz v6, :cond_0

    .line 55
    .line 56
    invoke-static {p2, v0}, Ll/uxy;->f(Ljava/lang/String;Z)Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-eqz v5, :cond_3

    .line 61
    .line 62
    move-object p2, v2

    .line 63
    goto :goto_1

    .line 64
    :cond_0
    invoke-static {v5, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    if-eqz v6, :cond_2

    .line 69
    .line 70
    :cond_1
    move-object p2, v3

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    invoke-static {v5, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    if-eqz v5, :cond_3

    .line 77
    .line 78
    invoke-static {p2, v0, p3}, Ll/uxy;->h(Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    if-eqz v5, :cond_3

    .line 83
    .line 84
    move-object p2, v1

    .line 85
    goto :goto_1

    .line 86
    :cond_3
    add-int/lit8 v4, v4, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :goto_1
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    const-string v0, "second_spark_task"

    .line 94
    .line 95
    if-eqz p4, :cond_4

    .line 96
    .line 97
    const-string p2, "exchange_photo"

    .line 98
    .line 99
    invoke-interface {p5, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;

    .line 103
    .line 104
    invoke-direct {p2, p0, p1, p3, p5}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)V

    .line 105
    .line 106
    .line 107
    const-string p1, "\u4e92\u76f8\u4ea4\u6362\u4e00\u5f20\u5168\u8eab\u7167\uff0c\u4e86\u89e3\u771f\u5b9e\u7684\u4e00\u9762"

    .line 108
    .line 109
    const-string p3, "\u7acb\u5373\u4ea4\u6362"

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_4
    invoke-static {p2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result p4

    .line 116
    if-eqz p4, :cond_5

    .line 117
    .line 118
    const-string p2, "voice_chat"

    .line 119
    .line 120
    invoke-interface {p5, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;

    .line 124
    .line 125
    invoke-direct {p2, p0, p1, p3, p5}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)V

    .line 126
    .line 127
    .line 128
    const-string p1, "\u8bed\u97f3\u804a\u5929\uff0c\u542c\u542c\u5bf9\u65b9\u7684\u58f0\u97f3"

    .line 129
    .line 130
    const-string p3, "\u53d1\u8d77\u9080\u8bf7"

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_5
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    if-eqz p2, :cond_6

    .line 138
    .line 139
    const-string p2, "exchange_answer"

    .line 140
    .line 141
    invoke-interface {p5, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$d;

    .line 145
    .line 146
    invoke-direct {p2, p0, p1, p3, p5}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$d;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)V

    .line 147
    .line 148
    .line 149
    const-string p1, "\u804a\u804a\u4f60\u4eec\u7684\u611f\u60c5\u7ecf\u5386\uff0c\u52a0\u6df1\u5bf9\u5f7c\u6b64\u7684\u4e86\u89e3"

    .line 150
    .line 151
    const-string p3, "\u4ea4\u6362\u7b54\u6848"

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_6
    const-string p1, ""

    .line 155
    .line 156
    const/4 p2, 0x0

    .line 157
    move-object p3, p1

    .line 158
    :goto_2
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->g:Lv/VText;

    .line 159
    .line 160
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    .line 162
    .line 163
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->i:Lv/VText;

    .line 164
    .line 165
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->i:Lv/VText;

    .line 169
    .line 170
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final W(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/data/MsgDataMMTask;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->f:Lv/VText;

    .line 2
    .line 3
    iget p4, p4, Lcom/p1/mobile/putong/core/data/MsgDataMMTask;->mmCnt:I

    .line 4
    .line 5
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    const-string v1, "\u4e92\u53d1%s\u6761\u6d88\u606f\uff0c\u6210\u4e3a\u5bc6\u53cb\u5566"

    .line 14
    .line 15
    invoke-static {v1, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->g:Lv/VText;

    .line 23
    .line 24
    const-string v0, "\u4f60\u4eec\u7684\u6d88\u606f\u5df2\u81ea\u52a8\u7f6e\u9876"

    .line 25
    .line 26
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->i:Lv/VText;

    .line 30
    .line 31
    const-string v0, "\u66f4\u6539\u8bbe\u7f6e"

    .line 32
    .line 33
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->i:Lv/VText;

    .line 37
    .line 38
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;

    .line 39
    .line 40
    move-object v1, p0

    .line 41
    move-object v2, p1

    .line 42
    move-object v5, p2

    .line 43
    move-object v3, p3

    .line 44
    move-object v4, p5

    .line 45
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final X()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->j:Z

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final Y(Ll/n100;Lcom/p1/mobile/putong/core/data/Message;Ljava/util/Map;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n100;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "ITEM_MESSAGE_MM_TASKe_spark_level_up"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ll/n100;->a(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_0
    invoke-virtual {p1, p0}, Ll/n100;->b(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const-string p0, "e_spark_level_up"

    .line 36
    .line 37
    const-string p1, "p_chat_view"

    .line 38
    .line 39
    invoke-static {p0, p1, p3}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
