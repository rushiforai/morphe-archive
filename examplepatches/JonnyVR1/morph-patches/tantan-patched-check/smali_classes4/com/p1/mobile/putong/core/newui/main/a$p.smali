.class public Lcom/p1/mobile/putong/core/newui/main/a$p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/main/a;->H7()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Ll/pf60<",
        "Ll/vg60<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;",
        "Lcom/p1/mobile/putong/newui/main/base/TabName;",
        ">;",
        "Ll/vg60<",
        "Lcom/p1/mobile/putong/core/data/Conversation;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a$p;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/pf60;)Ll/vg60;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            ">;)",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/a$p;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/a;->V5(Lcom/p1/mobile/putong/core/newui/main/a;)Ll/kcg0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p0, Ll/vg60;

    .line 19
    .line 20
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/pf60;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a$p;->a(Ll/pf60;)Ll/vg60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
