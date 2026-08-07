.class public Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct$b;->a:Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct$b;->a:Lcom/p1/mobile/putong/core/ui/debug/LabelDemoAct;

    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b;->E(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
