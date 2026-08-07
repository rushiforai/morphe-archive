.class public Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->f(Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;Ll/z20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->k:Lv/VText;

    .line 12
    .line 13
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 19
    .line 20
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    :try_start_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-virtual {p1, v0, v3, v3}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->W(Lcom/p1/mobile/putong/data/User;IZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception p1

    .line 34
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->k:Lv/VText;

    .line 39
    .line 40
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 46
    .line 47
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->k:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View;

    .line 60
    .line 61
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiCard2View$a;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
