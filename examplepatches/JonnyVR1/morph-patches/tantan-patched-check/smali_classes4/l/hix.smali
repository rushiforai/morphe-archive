.class public final Ll/hix;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\u0007\u001a\u0006\u0012\u0002\u0008\u00030\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001b\u0010\n\u001a\u0006\u0012\u0002\u0008\u00030\t2\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Ll/hix;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
        "frag",
        "Ll/u1b0;",
        "a",
        "(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)Ll/u1b0;",
        "Ll/v1b0;",
        "b",
        "(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)Ll/v1b0;",
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


# static fields
.field public static final INSTANCE:Ll/hix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/hix;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/hix;->INSTANCE:Ll/hix;

    .line 7
    .line 8
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

.method public static final a(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)Ll/u1b0;
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
            ")",
            "Ll/u1b0<",
            "*>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/d79;->g0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/ikx;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/ikx;-><init>(Ll/ner;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    invoke-static {}, Ll/d79;->h0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Ll/enx;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/enx;-><init>(Ll/ner;)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    new-instance v0, Ll/so30;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/so30;-><init>(Ll/ner;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public static final b(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)Ll/v1b0;
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;",
            ")",
            "Ll/v1b0<",
            "*>;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/d79;->g0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;-><init>(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    invoke-static {}, Ll/d79;->h0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    new-instance v0, Ll/xnx;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/xnx;-><init>(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    new-instance v0, Ll/xp30;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/xp30;-><init>(Lcom/p1/mobile/putong/core/newui/profile/ProfileFrag;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method
