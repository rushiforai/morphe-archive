.class public Lcom/p1/mobile/putong/core/newui/fake/b$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/fake/b;->E(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/fake/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/fake/b;Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->c:Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->a:Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->a:Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->a:Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;

    .line 10
    .line 11
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;->a(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->b:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->c:Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 19
    .line 20
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/fake/b;->m(Lcom/p1/mobile/putong/core/newui/fake/b;Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public onError()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->a:Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/b$b;->a:Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;->onError()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
