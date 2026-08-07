.class public Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/x6q;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch$a;
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(ILandroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataHighlightText;)V
    .locals 2

    .line 1
    iget v0, p2, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataHighlightText;->index:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    if-ge v0, p0, :cond_0

    .line 6
    .line 7
    iget v1, p2, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataHighlightText;->length:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    if-gt v0, p0, :cond_0

    .line 11
    .line 12
    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    .line 13
    .line 14
    const v0, -0x181e3

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iget v0, p2, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataHighlightText;->index:I

    .line 21
    .line 22
    iget p2, p2, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataHighlightText;->length:I

    .line 23
    .line 24
    add-int/2addr p2, v0

    .line 25
    const/16 v1, 0x21

    .line 26
    .line 27
    invoke-virtual {p1, p0, v0, p2, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->a:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->b:Lv/VText;

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 9

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->media:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->media:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->a:Lv/VDraweeView;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->media:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 61
    .line 62
    const/4 v7, 0x0

    .line 63
    const/4 v8, 0x0

    .line 64
    const/4 v5, 0x1

    .line 65
    const/4 v6, 0x0

    .line 66
    invoke-virtual/range {v2 .. v8}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->a:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 78
    .line 79
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->text:Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;->value:Ljava/lang/String;

    .line 82
    .line 83
    invoke-direct {v0, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->text:Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;

    .line 87
    .line 88
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;->value:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-nez v2, :cond_1

    .line 95
    .line 96
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->text:Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;->value:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgData;->text:Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChristmasMatchMsgDataText;->highlight:Ljava/util/List;

    .line 107
    .line 108
    new-instance v2, Ll/d4q;

    .line 109
    .line 110
    invoke-direct {v2, v1, v0}, Ll/d4q;-><init>(ILandroid/text/SpannableStringBuilder;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->b:Lv/VText;

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .line 120
    .line 121
    :catch_0
    :cond_2
    return-void
.end method

.method public message()Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;->v(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch$a;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemChristmasMatch;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
