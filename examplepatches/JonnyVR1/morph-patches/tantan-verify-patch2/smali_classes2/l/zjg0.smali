.class public final Ll/zjg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/view/SudGameViewLifecycleListener;


# instance fields
.field public final synthetic a:Ll/dhg0;


# direct methods
.method public constructor <init>(Ll/dhg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zjg0;->a:Ll/dhg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zjg0;->a:Ll/dhg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v0, "LoadGameStatsManager"

    .line 9
    .line 10
    const-string v1, "gameViewOnAttachedToWindow"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/iug0;->q:Z

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Ll/iug0;->e(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final onDetachedFromWindow()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zjg0;->a:Ll/dhg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v0, "LoadGameStatsManager"

    .line 9
    .line 10
    const-string v1, "gameViewOnDetachedFromWindow"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Ll/iug0;->q:Z

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/iug0;->e(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
