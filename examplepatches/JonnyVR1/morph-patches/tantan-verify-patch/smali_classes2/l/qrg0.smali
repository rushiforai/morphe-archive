.class public final Ll/qrg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/iug0;


# direct methods
.method public constructor <init>(Ll/iug0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qrg0;->a:Ll/iug0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    const-string v0, "LoadGameStatsManager"

    .line 2
    .line 3
    const-string v1, "onPauseMG"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/qrg0;->a:Ll/iug0;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/iug0;->g:Z

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Ll/iug0;->e(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
