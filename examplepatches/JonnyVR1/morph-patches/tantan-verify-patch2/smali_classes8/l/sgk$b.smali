.class public Ll/sgk$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sgk;->G(Landroid/view/View;Lcom/p1/mobile/putong/core/data/ChatGroupMember;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

.field public final synthetic c:Ll/sgk;


# direct methods
.method public constructor <init>(Ll/sgk;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sgk$b;->c:Ll/sgk;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sgk$b;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object p3, p0, Ll/sgk$b;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/sgk$b;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Ll/mgk;->d(Lcom/p1/mobile/putong/data/User;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 13
    .line 14
    iget-object v0, p0, Ll/sgk$b;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    const-string p1, "chat_group_anonymity"

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const-string p1, "chat_group"

    .line 38
    .line 39
    :goto_0
    iget-object v0, p0, Ll/sgk$b;->c:Ll/sgk;

    .line 40
    .line 41
    invoke-static {v0}, Ll/sgk;->E(Ll/sgk;)Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Ll/sgk$b;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0, v1, p1}, Ll/jek;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p0, p0, Ll/sgk$b;->c:Ll/sgk;

    .line 54
    .line 55
    invoke-static {p0}, Ll/sgk;->E(Ll/sgk;)Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
