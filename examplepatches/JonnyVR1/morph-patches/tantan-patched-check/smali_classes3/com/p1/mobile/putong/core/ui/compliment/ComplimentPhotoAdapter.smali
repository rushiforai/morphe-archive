.class public final Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$a;,
        Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;,
        Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;,
        Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010!\n\u0002\u0010\u0000\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0018\u00002\u000c\u0012\u0008\u0012\u00060\u0002R\u00020\u00000\u0001:\u0004):\'+B5\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u0007\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0015\u0010\u000f\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\r\u0010\u0011\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0015\u0010\u0015\u001a\u00020\t2\u0006\u0010\u0014\u001a\u00020\u0013\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J#\u0010\u001a\u001a\u00060\u0002R\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0019\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ#\u0010\u001d\u001a\u00020\t2\n\u0010\u001c\u001a\u00060\u0002R\u00020\u00002\u0006\u0010\u000e\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ1\u0010\"\u001a\u00020\t2\n\u0010\u001c\u001a\u00060\u0002R\u00020\u00002\u0006\u0010\u000e\u001a\u00020\u00082\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020 0\u001fH\u0016\u00a2\u0006\u0004\u0008\"\u0010#J\u000f\u0010$\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008$\u0010\u0012J\u000f\u0010%\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008%\u0010&R\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\'\u0010(R\u0014\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008)\u0010*R \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0008\u0012\u0004\u0012\u00020\t0\u00078\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008+\u0010,R\u0014\u0010\u000b\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008-\u0010.R\u001a\u00102\u001a\u0008\u0012\u0004\u0012\u00020/0\u001f8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00080\u00101R\u001a\u00104\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u001f8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00083\u00101R\u0016\u00106\u001a\u00020\u00088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00085\u0010.R\u0016\u00109\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00087\u00108\u00a8\u0006;"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;",
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/data/User;",
        "user",
        "Lkotlin/Function1;",
        "",
        "",
        "onPhotoClick",
        "initialPhotoIndex",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lkotlin/jvm/functions/Function1;I)V",
        "position",
        "G",
        "(I)V",
        "C",
        "()I",
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;",
        "mode",
        "H",
        "(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;)V",
        "Landroid/view/ViewGroup;",
        "parent",
        "viewType",
        "F",
        "(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;",
        "holder",
        "D",
        "(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;I)V",
        "",
        "",
        "payloads",
        "E",
        "(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;ILjava/util/List;)V",
        "getItemCount",
        "A",
        "()V",
        "a",
        "Lcom/p1/mobile/android/app/Act;",
        "b",
        "Lcom/p1/mobile/putong/data/User;",
        "c",
        "Lkotlin/jvm/functions/Function1;",
        "d",
        "I",
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;",
        "e",
        "Ljava/util/List;",
        "items",
        "f",
        "originalIndices",
        "g",
        "selectedPosition",
        "h",
        "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;",
        "currentTabMode",
        "TabMode",
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
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/data/User;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:I

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public g:I

.field public h:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lkotlin/jvm/functions/Function1;I)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->b:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->c:Lkotlin/jvm/functions/Function1;

    .line 18
    .line 19
    iput p4, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->d:I

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->e:Ljava/util/List;

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->f:Ljava/util/List;

    .line 34
    .line 35
    sget-object p1, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;->COMPLIMENT:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->h:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->A()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static final synthetic y(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;)Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->h:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic z(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;)Lkotlin/jvm/functions/Function1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->c:Lkotlin/jvm/functions/Function1;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final A()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->b:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_2

    .line 18
    .line 19
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    goto/16 :goto_2

    .line 26
    .line 27
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->d:I

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    if-ltz v2, :cond_3

    .line 35
    .line 36
    if-ge v2, v1, :cond_3

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->e:Ljava/util/List;

    .line 39
    .line 40
    new-instance v4, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;

    .line 41
    .line 42
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    invoke-direct {v4, v2}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;-><init>(Lcom/p1/mobile/putong/data/Picture;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->f:Ljava/util/List;

    .line 62
    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->d:I

    .line 64
    .line 65
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-object v1, v0

    .line 73
    check-cast v1, Ljava/util/Collection;

    .line 74
    .line 75
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    :goto_0
    if-ge v3, v1, :cond_4

    .line 80
    .line 81
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->d:I

    .line 82
    .line 83
    if-eq v3, v2, :cond_2

    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->e:Ljava/util/List;

    .line 86
    .line 87
    new-instance v4, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;

    .line 88
    .line 89
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 94
    .line 95
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;-><init>(Lcom/p1/mobile/putong/data/Picture;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->f:Ljava/util/List;

    .line 109
    .line 110
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_3
    move-object v1, v0

    .line 121
    check-cast v1, Ljava/util/Collection;

    .line 122
    .line 123
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    :goto_1
    if-ge v3, v1, :cond_4

    .line 128
    .line 129
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->e:Ljava/util/List;

    .line 130
    .line 131
    new-instance v4, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;

    .line 132
    .line 133
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v5

    .line 137
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 138
    .line 139
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 144
    .line 145
    .line 146
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;-><init>(Lcom/p1/mobile/putong/data/Picture;)V

    .line 147
    .line 148
    .line 149
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->f:Ljava/util/List;

    .line 153
    .line 154
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    add-int/lit8 v3, v3, 0x1

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_4
    :goto_2
    return-void
.end method

.method public final C()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->f:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/util/Collection;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->g:I

    .line 10
    .line 11
    if-ltz v1, :cond_0

    .line 12
    .line 13
    if-ge v1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->f:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Number;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public D(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;I)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;

    .line 11
    .line 12
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->g:I

    .line 13
    .line 14
    if-ne p2, p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->b(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$b;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;ILjava/util/List;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;ILjava/util/List;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->g:I

    .line 18
    .line 19
    if-ne p2, p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->c(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public F(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    sget v0, Ll/kec0;->y1:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance p2, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-direct {p2, p0, p1}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;-><init>(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    return-object p2
.end method

.method public final G(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->g:I

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->g:I

    .line 4
    .line 5
    sget-object p1, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$a;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->g:I

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final H(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->h:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;

    .line 5
    .line 6
    if-eq v0, p1, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->h:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$TabMode;

    .line 9
    .line 10
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->g:I

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$a;

    .line 13
    .line 14
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->D(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;ILjava/util/List;)V
    .locals 0

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;

    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->E(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;ILjava/util/List;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;->F(Landroid/view/ViewGroup;I)Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
