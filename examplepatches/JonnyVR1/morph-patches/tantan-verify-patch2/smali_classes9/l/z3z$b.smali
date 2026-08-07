.class public Ll/z3z$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/z3z;->k(Lcom/p1/mobile/putong/core/data/Conversation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic b:Ll/z3z;


# direct methods
.method public constructor <init>(Ll/z3z;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/z3z$b;->b:Ll/z3z;

    .line 2
    .line 3
    iput-object p2, p0, Ll/z3z$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/z3z$b;->b:Ll/z3z;

    .line 2
    .line 3
    invoke-static {p1}, Ll/z3z;->a(Ll/z3z;)Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageChatFireSettingAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p2, p0, Ll/z3z$b;->b:Ll/z3z;

    .line 12
    .line 13
    invoke-static {p2}, Ll/z3z;->b(Ll/z3z;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    const-string p2, "on"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p2, "off"

    .line 23
    .line 24
    :goto_0
    const-string v0, "close_friend_switch_status"

    .line 25
    .line 26
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    filled-new-array {p2}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string v0, "e_close_friend_switch"

    .line 35
    .line 36
    invoke-static {v0, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/z3z$b;->b:Ll/z3z;

    .line 40
    .line 41
    invoke-static {p1}, Ll/z3z;->b(Ll/z3z;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    xor-int/lit8 p2, p2, 0x1

    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/z3z;->e(Ll/z3z;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/z3z$b;->b:Ll/z3z;

    .line 51
    .line 52
    invoke-static {p1}, Ll/z3z;->c(Ll/z3z;)Ll/y3z;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p2, p0, Ll/z3z$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 57
    .line 58
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v0, p0, Ll/z3z$b;->b:Ll/z3z;

    .line 61
    .line 62
    invoke-static {v0}, Ll/z3z;->d(Ll/z3z;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iget-object p0, p0, Ll/z3z$b;->b:Ll/z3z;

    .line 67
    .line 68
    invoke-static {p0}, Ll/z3z;->b(Ll/z3z;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    invoke-virtual {p1, p2, v0, p0}, Ll/y3z;->k0(Ljava/lang/String;ZZ)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
