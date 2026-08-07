.class public final Ll/pwg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bgg0;


# direct methods
.method public constructor <init>(Ll/bgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pwg0;->a:Ll/bgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/pwg0;->a:Ll/bgg0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/wmg0;->a:Ll/aog0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v0, "ProxySudFSTAPPImpl"

    .line 9
    .line 10
    const-string v1, "onClickTimeoutContinueWait"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Ll/aog0;->a:Ll/dhg0;

    .line 16
    .line 17
    iget-object p1, p1, Ll/dhg0;->w:Ll/iug0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    const-string v0, "LoadGameStatsManager"

    .line 23
    .line 24
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p1, v0}, Ll/iug0;->e(Z)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/pwg0;->a:Ll/bgg0;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/bgg0;->a()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
