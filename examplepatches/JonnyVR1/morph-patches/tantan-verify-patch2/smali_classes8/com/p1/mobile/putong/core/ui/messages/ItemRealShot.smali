.class public Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;
    }
.end annotation


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lcom/p1/mobile/putong/core/data/Message;

.field public f:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;

.field public g:Lv/VText;

.field public h:Landroid/widget/ImageView;

.field public i:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->i:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->i:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->i:I

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->k0(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 16
    .line 17
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 46
    .line 47
    invoke-interface {v0, v1, v2, p1}, Ll/r97;->J4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Media;)V

    .line 48
    .line 49
    .line 50
    new-instance p1, Ll/pf60;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 55
    .line 56
    const-string v1, "sender_user_id"

    .line 57
    .line 58
    invoke-direct {p1, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Ll/pf60;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    const-string v1, "message_id"

    .line 68
    .line 69
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "e_camera_chat_message"

    .line 77
    .line 78
    const-string v0, "p_chat_view"

    .line 79
    .line 80
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    new-instance v0, Ll/pf60;

    .line 9
    .line 10
    const-string v1, "sender_user_id"

    .line 11
    .line 12
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/pf60;

    .line 18
    .line 19
    const-string v2, "message_id"

    .line 20
    .line 21
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "e_camera_chat_message"

    .line 31
    .line 32
    const-string v2, "p_chat_view"

    .line 33
    .line 34
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->g:Lv/VText;

    .line 38
    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->Q4:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->d:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->m0(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;Lv/VDraweeView;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 86
    .line 87
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 88
    .line 89
    const-string v1, "raw"

    .line 90
    .line 91
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 98
    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    move-object v0, p1

    .line 102
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 107
    .line 108
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_2

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_2
    :goto_1
    return-void

    .line 116
    :cond_3
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->d:Lv/VDraweeView;

    .line 131
    .line 132
    const-string v1, "chat"

    .line 133
    .line 134
    invoke-virtual {v0, p0, p1, v1}, Ll/fsb0;->R0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
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

.method public j0(IZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;->RIGHT:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;->LEFT:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;

    .line 7
    .line 8
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->f:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;

    .line 9
    .line 10
    sget p1, Ll/edc0;->Z2:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lv/VDraweeView;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->d:Lv/VDraweeView;

    .line 19
    .line 20
    sget p1, Ll/edc0;->G3:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lv/VText;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->g:Lv/VText;

    .line 29
    .line 30
    sget p1, Ll/edc0;->G:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Landroid/widget/ImageView;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->h:Landroid/widget/ImageView;

    .line 39
    .line 40
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->h:Landroid/widget/ImageView;

    .line 55
    .line 56
    sget p2, Ll/ibc0;->R2:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->d:Lv/VDraweeView;

    .line 62
    .line 63
    new-instance p2, Ll/cfq;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Ll/cfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->d:Lv/VDraweeView;

    .line 72
    .line 73
    new-instance p2, Ll/dfq;

    .line 74
    .line 75
    invoke-direct {p2, p0}, Ll/dfq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)Z
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->i:I

    .line 3
    .line 4
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->d:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 11
    .line 12
    .line 13
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->i:I

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    add-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->j0(IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot$Shape;Lv/VDraweeView;)V
    .locals 3

    .line 1
    sget p1, Ll/qa00;->i:I

    .line 2
    .line 3
    int-to-float v0, p1

    .line 4
    int-to-float v1, p1

    .line 5
    int-to-float v2, p1

    .line 6
    int-to-float p1, p1

    .line 7
    invoke-static {v0, v1, v2, p1}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/am2;->l()Ll/xlj;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/xlj;->a()Ll/wlj;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/wlj;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/wlj;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p1, v0}, Ll/wlj;->y(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Ll/wlj;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->e:Lcom/p1/mobile/putong/core/data/Message;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_1

    .line 70
    .line 71
    sget p0, Ll/ibc0;->w0:I

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    sget p0, Ll/ibc0;->v0:I

    .line 75
    .line 76
    :goto_0
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget-object p2, Ll/h1e0;->g:Ll/h1e0;

    .line 81
    .line 82
    invoke-virtual {p1, p0, p2}, Ll/wlj;->F(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
