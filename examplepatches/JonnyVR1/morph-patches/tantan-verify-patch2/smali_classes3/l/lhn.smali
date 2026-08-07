.class public final Ll/lhn;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/lhn$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010!\n\u0002\u0008\u0005\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001\u0007B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u0003R,\u0010\u0014\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u000c\u0018\u00010\u000e8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0007\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013R\u001d\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00158\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/lhn;",
        "",
        "<init>",
        "()V",
        "",
        "id",
        "Ll/lhn$a;",
        "a",
        "(Ljava/lang/String;)Ll/lhn$a;",
        "",
        "e",
        "()Z",
        "",
        "d",
        "Lrx/subjects/b;",
        "Lrx/subjects/b;",
        "b",
        "()Lrx/subjects/b;",
        "setIntlFriendEditRedDotRefreshObs",
        "(Lrx/subjects/b;)V",
        "intlFriendEditRedDotRefreshObs",
        "",
        "Ljava/util/List;",
        "c",
        "()Ljava/util/List;",
        "intlFriendPurposeList",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Ll/lhn;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/lhn$a;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/lhn;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lhn;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/lhn;->INSTANCE:Ll/lhn;

    .line 7
    .line 8
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Ll/lhn;->a:Lrx/subjects/b;

    .line 13
    .line 14
    new-instance v1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object v1, Ll/lhn;->b:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/lhn;->d()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/lhn$a;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/lhn;->b:Ljava/util/List;

    .line 5
    .line 6
    check-cast p0, Ljava/lang/Iterable;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    move-object v1, v0

    .line 23
    check-cast v1, Ll/lhn$a;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/lhn$a;->c()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, 0x0

    .line 37
    :goto_0
    check-cast v0, Ll/lhn$a;

    .line 38
    .line 39
    return-object v0
.end method

.method public final b()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/lhn;->a:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/lhn$a;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Ll/lhn;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()V
    .locals 14

    .line 1
    sget-object p0, Ll/lhn;->b:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/lhn$a;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/common/R$string;->q0:I

    .line 6
    .line 7
    sget v3, Ll/cbc0;->z:I

    .line 8
    .line 9
    sget v4, Ll/cbc0;->A:I

    .line 10
    .line 11
    sget v6, Ll/cbc0;->D:I

    .line 12
    .line 13
    const/16 v7, 0x10

    .line 14
    .line 15
    const/4 v8, 0x0

    .line 16
    const-string v1, "long-term-partner"

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    invoke-direct/range {v0 .. v8}, Ll/lhn$a;-><init>(Ljava/lang/String;IIIZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    new-instance v1, Ll/lhn$a;

    .line 26
    .line 27
    sget v3, Lcom/p1/mobile/putong/common/R$string;->p0:I

    .line 28
    .line 29
    sget v4, Ll/cbc0;->B:I

    .line 30
    .line 31
    sget v7, Ll/cbc0;->C:I

    .line 32
    .line 33
    const/16 v8, 0x18

    .line 34
    .line 35
    const/4 v9, 0x0

    .line 36
    const-string v2, "long-but-short"

    .line 37
    .line 38
    const/4 v6, 0x0

    .line 39
    invoke-direct/range {v1 .. v9}, Ll/lhn$a;-><init>(Ljava/lang/String;IIIZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/lhn$a;

    .line 46
    .line 47
    sget v4, Lcom/p1/mobile/putong/common/R$string;->t0:I

    .line 48
    .line 49
    sget v5, Ll/cbc0;->K:I

    .line 50
    .line 51
    sget v6, Ll/cbc0;->L:I

    .line 52
    .line 53
    sget v8, Ll/cbc0;->M:I

    .line 54
    .line 55
    const/16 v9, 0x10

    .line 56
    .line 57
    const/4 v10, 0x0

    .line 58
    const-string v3, "short-term-fun"

    .line 59
    .line 60
    const/4 v7, 0x0

    .line 61
    invoke-direct/range {v2 .. v10}, Ll/lhn$a;-><init>(Ljava/lang/String;IIIZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    new-instance v3, Ll/lhn$a;

    .line 68
    .line 69
    sget v5, Lcom/p1/mobile/putong/common/R$string;->s0:I

    .line 70
    .line 71
    sget v6, Ll/cbc0;->N:I

    .line 72
    .line 73
    sget v9, Ll/cbc0;->O:I

    .line 74
    .line 75
    const/16 v10, 0x18

    .line 76
    .line 77
    const/4 v11, 0x0

    .line 78
    const-string v4, "short-but-long"

    .line 79
    .line 80
    const/4 v8, 0x0

    .line 81
    invoke-direct/range {v3 .. v11}, Ll/lhn$a;-><init>(Ljava/lang/String;IIIZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    new-instance v4, Ll/lhn$a;

    .line 88
    .line 89
    sget v6, Lcom/p1/mobile/putong/common/R$string;->o0:I

    .line 90
    .line 91
    sget v7, Ll/cbc0;->E:I

    .line 92
    .line 93
    sget v8, Ll/cbc0;->F:I

    .line 94
    .line 95
    sget v10, Ll/cbc0;->G:I

    .line 96
    .line 97
    const/16 v11, 0x10

    .line 98
    .line 99
    const/4 v12, 0x0

    .line 100
    const-string v5, "new-friends"

    .line 101
    .line 102
    const/4 v9, 0x0

    .line 103
    invoke-direct/range {v4 .. v12}, Ll/lhn$a;-><init>(Ljava/lang/String;IIIZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 104
    .line 105
    .line 106
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    new-instance v5, Ll/lhn$a;

    .line 110
    .line 111
    sget v7, Lcom/p1/mobile/putong/common/R$string;->r0:I

    .line 112
    .line 113
    sget v8, Ll/cbc0;->H:I

    .line 114
    .line 115
    sget v9, Ll/cbc0;->I:I

    .line 116
    .line 117
    sget v11, Ll/cbc0;->J:I

    .line 118
    .line 119
    const/16 v12, 0x10

    .line 120
    .line 121
    const/4 v13, 0x0

    .line 122
    const-string v6, "not-sure-yet"

    .line 123
    .line 124
    const/4 v10, 0x0

    .line 125
    invoke-direct/range {v5 .. v13}, Ll/lhn$a;-><init>(Ljava/lang/String;IIIZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 126
    .line 127
    .line 128
    invoke-interface {p0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    return-void
.end method

.method public final e()Z
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Ba()Ll/jxd0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    sget p0, Ll/uqb0;->t:I

    .line 22
    .line 23
    const v0, 0x381378

    .line 24
    .line 25
    .line 26
    if-gt p0, v0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method
