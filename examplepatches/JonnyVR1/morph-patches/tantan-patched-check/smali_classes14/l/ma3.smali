.class public final Ll/ma3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ma3$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0005\u0018\u0000 \u00042\u00020\u0001:\u0001\u0005B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006"
    }
    d2 = {
        "Ll/ma3;",
        "",
        "<init>",
        "()V",
        "Companion",
        "a",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/ma3$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/ma3$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/ma3$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    .line 8
    .line 9
    new-instance v0, Ll/la3;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/la3;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/ma3;->a:Ll/x20;

    .line 15
    .line 16
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

.method public static a()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->K1:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static final synthetic b()Ll/x20;
    .locals 1

    .line 1
    sget-object v0, Ll/ma3;->a:Ll/x20;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final c()Ll/x20;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    invoke-virtual {v0}, Ll/ma3$a;->a()Ll/x20;

    move-result-object v0

    return-object v0
.end method

.method public static final d(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 1
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    invoke-virtual {v0, p0, p1}, Ll/ma3$a;->b(Lcom/p1/mobile/android/app/Act;Z)V

    return-void
.end method

.method public static final e(Lcom/p1/mobile/android/app/Act;ZLl/x20;Z)V
    .locals 1
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    invoke-virtual {v0, p0, p1, p2, p3}, Ll/ma3$a;->c(Lcom/p1/mobile/android/app/Act;ZLl/x20;Z)V

    return-void
.end method

.method public static final f(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 6
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Ll/ma3$a;->d(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLcom/p1/mobile/putong/core/data/Privilege;)V

    return-void
.end method

.method public static final g(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/pcj;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    invoke-virtual {v0, p0, p1, p2}, Ll/ma3$a;->f(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    return-void
.end method

.method public static final h(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLjava/lang/String;)V
    .locals 6
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/ma3;->Companion:Ll/ma3$a;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Ll/ma3$a;->g(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLjava/lang/String;)V

    return-void
.end method
