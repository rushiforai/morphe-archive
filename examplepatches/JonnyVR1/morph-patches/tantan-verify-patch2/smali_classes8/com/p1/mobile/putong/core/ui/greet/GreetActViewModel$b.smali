.class public Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->A:Ll/tul;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/tul;->getTop()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    neg-int v0, v0

    .line 20
    int-to-float v0, v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->g:Lv/VList;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    sub-float/2addr v0, v1

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel$b;->a:Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 31
    .line 32
    sget v1, Ll/qa00;->t:I

    .line 33
    .line 34
    int-to-float v1, v1

    .line 35
    cmpg-float v0, v0, v1

    .line 36
    .line 37
    if-gtz v0, :cond_0

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    sget v0, Ll/qa00;->S:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->U(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    sget p0, Ll/qa00;->S:I

    .line 48
    .line 49
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->U(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
