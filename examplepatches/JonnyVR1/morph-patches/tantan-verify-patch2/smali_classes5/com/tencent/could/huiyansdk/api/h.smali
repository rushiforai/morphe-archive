.class public Lcom/tencent/could/huiyansdk/api/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/component/common/ai/callback/CrashListener;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/api/j;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/api/j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/api/h;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCrash(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/h;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "CrashStage"

    .line 8
    .line 9
    const-string v2, "UncatchCrash"

    .line 10
    .line 11
    invoke-interface {v0, v1, v2, p1}, Lcom/tencent/could/huiyansdk/api/b;->onBuriedPointCallBack(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/api/h;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/api/j;->g:Lcom/tencent/could/huiyansdk/api/b;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const-string v1, "Crash"

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    const-wide/16 v3, 0x1

    .line 24
    .line 25
    move-object v5, p1

    .line 26
    invoke-interface/range {v0 .. v5}, Lcom/tencent/could/huiyansdk/api/b;->updateOperateInfo(Ljava/lang/String;IJLjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
