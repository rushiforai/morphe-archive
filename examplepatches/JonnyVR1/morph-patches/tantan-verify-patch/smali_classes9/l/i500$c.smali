.class public Ll/i500$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i500;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/i500;


# direct methods
.method public constructor <init>(Ll/i500;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i500$c;->a:Ll/i500;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i500$c;->a:Ll/i500;

    .line 2
    .line 3
    invoke-static {v0}, Ll/i500;->f(Ll/i500;)Ll/g500;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/u1z;->E1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/i500$c;->a:Ll/i500;

    .line 22
    .line 23
    invoke-static {v0}, Ll/i500;->f(Ll/i500;)Ll/g500;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/d3z;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getRecordLayout()Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v1, p0, Ll/i500$c;->a:Ll/i500;

    .line 50
    .line 51
    invoke-static {v1}, Ll/i500;->f(Ll/i500;)Ll/g500;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/g500;->b1()Ll/tnw;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ll/tnw;->n()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/record/view/RecordAnimLayout;->setSoundLevel(I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/i500$c;->a:Ll/i500;

    .line 67
    .line 68
    invoke-static {v0}, Ll/i500;->e(Ll/i500;)Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const-wide/16 v1, 0x32

    .line 73
    .line 74
    invoke-virtual {v0, p0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method
