.class public final Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ]\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u0011\u001a\u00020\r2\u0010\u0008\u0002\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u00122\n\u0008\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;",
        "",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
        "inAppNotification",
        "",
        "currentOrientation",
        "",
        "c",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;I)Ljava/lang/String;",
        "Landroidx/fragment/app/Fragment;",
        "fragment",
        "",
        "isTablet",
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "resourceProvider",
        "supportsStreamMedia",
        "Lkotlin/Function0;",
        "",
        "onActionClick",
        "lockedMediaUrl",
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "a",
        "(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;IZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;ZLkotlin/jvm/functions/Function0;Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field static final synthetic a:Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;

    invoke-direct {v0}, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;-><init>()V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;->a:Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;IZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;ZLkotlin/jvm/functions/Function0;Ljava/lang/String;ILjava/lang/Object;)Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;
    .locals 11

    .line 1
    move/from16 v0, p9

    .line 2
    .line 3
    and-int/lit8 v1, v0, 0x20

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    move v8, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move/from16 v8, p6

    .line 11
    .line 12
    :goto_0
    and-int/lit8 v1, v0, 0x40

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    move-object v9, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    move-object/from16 v9, p7

    .line 20
    .line 21
    :goto_1
    and-int/lit16 v0, v0, 0x80

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    move-object v10, v2

    .line 26
    move-object v3, p1

    .line 27
    move-object v4, p2

    .line 28
    move v5, p3

    .line 29
    move v6, p4

    .line 30
    move-object/from16 v7, p5

    .line 31
    .line 32
    move-object v2, p0

    .line 33
    goto :goto_2

    .line 34
    :cond_2
    move-object/from16 v10, p8

    .line 35
    .line 36
    move-object v2, p0

    .line 37
    move-object v3, p1

    .line 38
    move-object v4, p2

    .line 39
    move v5, p3

    .line 40
    move v6, p4

    .line 41
    move-object/from16 v7, p5

    .line 42
    .line 43
    :goto_2
    invoke-virtual/range {v2 .. v10}, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;->a(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;IZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;ZLkotlin/jvm/functions/Function0;Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method


# virtual methods
.method public final a(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;IZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;ZLkotlin/jvm/functions/Function0;Ljava/lang/String;)Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;
    .locals 2
    .param p1    # Landroidx/fragment/app/Fragment;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/Fragment;",
            "Lcom/clevertap/android/sdk/inapp/CTInAppNotification;",
            "IZ",
            "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
            "Z",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
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
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    if-eqz p8, :cond_2

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->u()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Iterable;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    move-object v1, v0

    .line 33
    check-cast v1, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->c()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v1, p8}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v0, 0x0

    .line 47
    :goto_0
    check-cast v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    invoke-virtual {p2, p3}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->q(I)Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->u()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    move-object v0, p0

    .line 67
    check-cast v0, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 68
    .line 69
    if-nez v0, :cond_3

    .line 70
    .line 71
    sget-object p0, Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;->INSTANCE:Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;

    .line 72
    .line 73
    return-object p0

    .line 74
    :cond_3
    :goto_1
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->g()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_4

    .line 79
    .line 80
    new-instance p0, Lcom/clevertap/android/sdk/inapp/media/InAppImageHandler;

    .line 81
    .line 82
    invoke-direct {p0, v0, p5}, Lcom/clevertap/android/sdk/inapp/media/InAppImageHandler;-><init>(Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;)V

    .line 83
    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_4
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->f()Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_5

    .line 91
    .line 92
    new-instance p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;

    .line 93
    .line 94
    invoke-direct {p0, v0, p5}, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;-><init>(Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;)V

    .line 95
    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->h()Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_6

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->e()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_7

    .line 109
    .line 110
    :cond_6
    if-eqz p6, :cond_7

    .line 111
    .line 112
    new-instance p0, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;

    .line 113
    .line 114
    invoke-direct {p0, p1, v0, p4, p7}, Lcom/clevertap/android/sdk/inapp/media/InAppStreamMediaHandler;-><init>(Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;ZLkotlin/jvm/functions/Function0;)V

    .line 115
    .line 116
    .line 117
    return-object p0

    .line 118
    :cond_7
    sget-object p0, Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;->INSTANCE:Lcom/clevertap/android/sdk/inapp/media/NoOpMediaHandler;

    .line 119
    .line 120
    return-object p0
.end method

.method public final c(Lcom/clevertap/android/sdk/inapp/CTInAppNotification;I)Ljava/lang/String;
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotification;
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
    invoke-virtual {p1, p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->q(I)Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->u()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 19
    .line 20
    :cond_0
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->c()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method
