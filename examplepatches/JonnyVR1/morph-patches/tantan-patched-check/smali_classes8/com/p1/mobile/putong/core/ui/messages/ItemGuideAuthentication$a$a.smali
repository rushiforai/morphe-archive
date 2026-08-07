.class public Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/uxj0;)V
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->InviationForAuthenticationTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->setLong(Ljava/lang/String;J)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 21
    .line 22
    const-string v0, "#33000000"

    .line 23
    .line 24
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a;->e:Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication;->g:Lv/VText;

    .line 36
    .line 37
    const-string p1, "\u9080\u8bf7\u5df2\u53d1\u9001"

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemGuideAuthentication$a$a;->a(Ll/uxj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
