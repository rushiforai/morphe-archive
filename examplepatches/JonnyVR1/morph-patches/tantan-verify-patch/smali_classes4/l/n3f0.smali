.class public abstract Ll/n3f0;
.super Ljava/util/Observable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/n3f0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008&\u0018\u0000 \u00082\u00020\u0001:\u0001\u0006B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004H&\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\t"
    }
    d2 = {
        "Ll/n3f0;",
        "Ljava/util/Observable;",
        "<init>",
        "()V",
        "Lkotlin/Function0;",
        "",
        "a",
        "()Lkotlin/jvm/functions/Function0;",
        "Companion",
        "sharedlibrarymanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/n3f0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final b:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final c:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final d:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final e:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final f:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final g:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final h:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final i:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final j:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final k:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final l:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final m:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final n:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field

.field public static final o:I
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/n3f0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/n3f0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/n3f0;->Companion:Ll/n3f0$a;

    .line 8
    .line 9
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->RUNNING:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/lit8 v1, v1, 0x64

    .line 16
    .line 17
    sput v1, Ll/n3f0;->a:I

    .line 18
    .line 19
    sget-object v1, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->SUCCEEDED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    add-int/lit8 v2, v2, 0x64

    .line 26
    .line 27
    sput v2, Ll/n3f0;->b:I

    .line 28
    .line 29
    sget-object v2, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->FAILED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    add-int/lit8 v3, v3, 0x64

    .line 36
    .line 37
    sput v3, Ll/n3f0;->c:I

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/lit16 v3, v3, 0xc8

    .line 44
    .line 45
    sput v3, Ll/n3f0;->d:I

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    add-int/lit16 v3, v3, 0xc8

    .line 52
    .line 53
    sput v3, Ll/n3f0;->e:I

    .line 54
    .line 55
    invoke-virtual {v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    add-int/lit16 v3, v3, 0xc8

    .line 60
    .line 61
    sput v3, Ll/n3f0;->f:I

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    add-int/lit16 v3, v3, 0x12c

    .line 68
    .line 69
    sput v3, Ll/n3f0;->g:I

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    add-int/lit16 v3, v3, 0x12c

    .line 76
    .line 77
    sput v3, Ll/n3f0;->h:I

    .line 78
    .line 79
    invoke-virtual {v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    add-int/lit16 v3, v3, 0x12c

    .line 84
    .line 85
    sput v3, Ll/n3f0;->i:I

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    add-int/lit16 v3, v3, 0x190

    .line 92
    .line 93
    sput v3, Ll/n3f0;->j:I

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    add-int/lit16 v3, v3, 0x190

    .line 100
    .line 101
    sput v3, Ll/n3f0;->k:I

    .line 102
    .line 103
    invoke-virtual {v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    add-int/lit16 v3, v3, 0x190

    .line 108
    .line 109
    sput v3, Ll/n3f0;->l:I

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/lit16 v0, v0, 0x1f4

    .line 116
    .line 117
    sput v0, Ll/n3f0;->m:I

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/lit16 v0, v0, 0x1f4

    .line 124
    .line 125
    sput v0, Ll/n3f0;->n:I

    .line 126
    .line 127
    invoke-virtual {v2}, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->getValue()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/lit16 v0, v0, 0x1f4

    .line 132
    .line 133
    sput v0, Ll/n3f0;->o:I

    .line 134
    .line 135
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a()Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method
