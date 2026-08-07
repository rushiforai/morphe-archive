.class public Ll/cjg$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/osn0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cjg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/cjg;


# direct methods
.method public constructor <init>(Ll/cjg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjg$a;->a:Ll/cjg;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public p(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/cjg$a;->a:Ll/cjg;

    .line 2
    .line 3
    invoke-static {p0}, Ll/cjg;->e(Ll/cjg;)Ll/fjg;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/fjg;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
