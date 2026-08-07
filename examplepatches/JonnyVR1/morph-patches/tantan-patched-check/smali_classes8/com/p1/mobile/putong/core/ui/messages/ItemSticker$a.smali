.class public Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->J()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 8
    .line 9
    const v0, 0x9d87

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g6:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 26
    .line 27
    new-instance v0, Ll/kgq;

    .line 28
    .line 29
    invoke-direct {v0}, Ll/kgq;-><init>()V

    .line 30
    .line 31
    .line 32
    const-wide/16 v1, 0x32

    .line 33
    .line 34
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->e(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/mof0;->z()Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic e(Ll/uxj0;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->f(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->f(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->f(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_0

    .line 58
    .line 59
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 62
    .line 63
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->f(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->h6:I

    .line 89
    .line 90
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 91
    .line 92
    .line 93
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 94
    .line 95
    new-instance p1, Ll/jgq;

    .line 96
    .line 97
    invoke-direct {p1}, Ll/jgq;-><init>()V

    .line 98
    .line 99
    .line 100
    const-wide/16 v0, 0x32

    .line 101
    .line 102
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    const-string v0, "e_add_stickers"

    .line 2
    .line 3
    const-string v1, "p_chat_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_0

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->userStickers:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/p1/mobile/putong/core/data/UserSticker;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/UserSticker;->favoriteStickers:Ljava/util/List;

    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    const/16 v1, 0x12c

    .line 100
    .line 101
    if-lt v0, v1, :cond_0

    .line 102
    .line 103
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->m6:I

    .line 104
    .line 105
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/z;->T:Lcom/p1/mobile/putong/core/api/z$c;

    .line 122
    .line 123
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;

    .line 124
    .line 125
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;->f(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/z$c;->O(Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/hgq;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/hgq;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemSticker$a;)V

    .line 140
    .line 141
    .line 142
    new-instance p0, Ll/igq;

    .line 143
    .line 144
    invoke-direct {p0}, Ll/igq;-><init>()V

    .line 145
    .line 146
    .line 147
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    return-void
.end method
