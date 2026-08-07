.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->d:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->c:Ljava/util/Map;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->b:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->c:Ljava/util/Map;

    .line 15
    .line 16
    const-string v1, "e_spark_level_up"

    .line 17
    .line 18
    invoke-static {v1, p1, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageMMTask$b;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, ""

    .line 30
    .line 31
    const-string v1, "from_entrance_type"

    .line 32
    .line 33
    invoke-static {p0, p1, v0, v1}, Ll/r600;->t(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
