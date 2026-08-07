.class public final Ll/afm0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/afm0$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0005\u0018\u0000 \u00042\u00020\u0001:\u0001\u0005B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006"
    }
    d2 = {
        "Ll/afm0;",
        "",
        "<init>",
        "()V",
        "Companion",
        "a",
        "b_core_base"
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
.field public static final Companion:Ll/afm0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/afm0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/afm0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/afm0;->Companion:Ll/afm0$a;

    .line 8
    .line 9
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

.method public static final a()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/afm0;->Companion:Ll/afm0$a;

    invoke-virtual {v0}, Ll/afm0$a;->a()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    move-result-object v0

    return-object v0
.end method

.method public static final b()I
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/afm0;->Companion:Ll/afm0$a;

    invoke-virtual {v0}, Ll/afm0$a;->c()I

    move-result v0

    return v0
.end method

.method public static final c()I
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/afm0;->Companion:Ll/afm0$a;

    invoke-virtual {v0}, Ll/afm0$a;->d()I

    move-result v0

    return v0
.end method

.method public static final d()I
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/afm0;->Companion:Ll/afm0$a;

    invoke-virtual {v0}, Ll/afm0$a;->e()I

    move-result v0

    return v0
.end method

.method public static final e()I
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/afm0;->Companion:Ll/afm0$a;

    invoke-virtual {v0}, Ll/afm0$a;->f()I

    move-result v0

    return v0
.end method
