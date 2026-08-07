.class public Ll/ykl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/uhl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ykl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ykl;


# direct methods
.method public constructor <init>(Ll/ykl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ykl$a;->a:Ll/ykl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C()Lcom/p1/mobile/android/app/Frag;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ykl$a;->a:Ll/ykl;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ykl;->a(Ll/ykl;)Ll/ell;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public D()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ykl$a;->a:Ll/ykl;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ykl;->a(Ll/ykl;)Ll/ell;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public E(Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/ykl$a;->a:Ll/ykl;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ykl;->a(Ll/ykl;)Ll/ell;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/ell;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public G()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ykl$a;->a:Ll/ykl;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ykl;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
