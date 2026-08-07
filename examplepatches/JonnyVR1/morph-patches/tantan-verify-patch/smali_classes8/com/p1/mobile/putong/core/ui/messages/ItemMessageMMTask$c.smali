.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->V(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MsgDataMMTask;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/util/Map;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->c:Ljava/util/Map;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;->P(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Lcom/p1/mobile/putong/data/User;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p1, "p_chat_view"

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->c:Ljava/util/Map;

    .line 15
    .line 16
    const-string v1, "e_spark_level_up"

    .line 17
    .line 18
    invoke-static {v1, p1, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "voice_mm_task_item"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/qzm0;->o(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Ll/d3z;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/d3z;->u0()Ll/azy;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/azy;->d0()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C5:I

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1, v0}, Ll/qzm0;->o(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$c;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    const-string v1, ""

    .line 84
    .line 85
    invoke-virtual {p1, p0, v0, v1}, Ll/xzm0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
