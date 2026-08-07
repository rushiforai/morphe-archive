.class public final Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;
.super Lcom/p1/mobile/putong/core/PutongFragAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \n2\u00020\u0001:\u0001\u000bB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\t\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;",
        "Lcom/p1/mobile/putong/core/PutongFragAct;",
        "<init>",
        "()V",
        "",
        "pageId",
        "()Ljava/lang/String;",
        "Lcom/p1/mobile/android/app/Frag;",
        "Y1",
        "()Lcom/p1/mobile/android/app/Frag;",
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
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/PutongFragAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final Z1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct$a;

    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct$a;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public Y1()Lcom/p1/mobile/android/app/Frag;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksFrag;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksFrag$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "from"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksAct;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/16 v5, 0x8

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, 0x0

    .line 22
    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksFrag$a;->b(Lcom/p1/mobile/putong/core/ui/vip/picks/act/PicksFrag$a;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;ILjava/lang/Object;)Lcom/p1/mobile/android/app/Frag;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "p_picks_view"

    .line 2
    .line 3
    return-object p0
.end method
