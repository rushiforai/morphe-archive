.class public final Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/q450;",
        "Ll/s450;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0008\u0018\u0000 \u00182\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0019B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0006\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\u0008\u001a\u00020\u0003H\u0014\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\'\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\u000c\u001a\u00020\n2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u001a\u0010\u0017\u001a\u00020\u00128\u0006X\u0086D\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;",
        "Lcom/p1/mobile/putong/app/PutongMvpFrag;",
        "Ll/q450;",
        "Ll/s450;",
        "<init>",
        "()V",
        "O4",
        "()Ll/q450;",
        "P4",
        "()Ll/s450;",
        "",
        "requestCode",
        "resultCode",
        "Landroid/content/Intent;",
        "data",
        "",
        "Q4",
        "(IILandroid/content/Intent;)Z",
        "",
        "B",
        "Ljava/lang/String;",
        "getUrl",
        "()Ljava/lang/String;",
        "url",
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
.field public static final Companion:Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final B:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;->Companion:Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "/business/meet/v-/2.x/sources/MeetVisitorPageMua.lua?_bid=1003470"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;->B:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;->O4()Ll/q450;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;->P4()Ll/s450;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O4()Ll/q450;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/q450;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/q450;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public P4()Ll/s450;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/s450;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/s450;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final Q4(IILandroid/content/Intent;)Z
    .locals 0
    .param p3    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/q450;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/q450;->h0(IILandroid/content/Intent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
