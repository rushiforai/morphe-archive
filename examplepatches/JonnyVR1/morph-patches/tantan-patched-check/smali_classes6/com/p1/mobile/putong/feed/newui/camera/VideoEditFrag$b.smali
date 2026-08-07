.class public Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/kpw;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->n4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->c()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->T4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->T4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->isFile()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    new-instance v0, Ll/v9m;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/v9m;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    new-instance v0, Ll/jdl0;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Ll/jdl0;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Y4(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ll/qdl0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->c5(Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Ll/qdl0;->m0(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onProcessProgress(F)V
    .locals 0

    return-void
.end method
