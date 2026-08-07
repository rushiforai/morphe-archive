.class public final Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J#\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0007\u00a2\u0006\u0004\u0008\t\u0010\nR\u0014\u0010\u000b\u001a\u00020\u00068\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;",
        "",
        "<init>",
        "()V",
        "",
        "reportOpenState",
        "",
        "from",
        "Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;",
        "a",
        "(ZLjava/lang/String;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;",
        "FROM_MEET",
        "Ljava/lang/String;",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;-><init>()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;ZLjava/lang/String;ILjava/lang/Object;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const-string p2, ""

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;->a(ZLjava/lang/String;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public final a(ZLjava/lang/String;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;
    .locals 2
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "from"

    .line 18
    .line 19
    invoke-virtual {v0, v1, p2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    const-string p2, "odiamond_weekly_report_open"

    .line 23
    .line 24
    invoke-virtual {v0, p2, p1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method
