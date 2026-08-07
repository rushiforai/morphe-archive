.class public Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;
.super Ll/ipf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->g4(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;->b:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/ipf0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V
    .locals 4
    .param p1    # Ll/mvc0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lv/smart_refresh/constant/RefreshState;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ipf0;->f(Ll/mvc0;Lv/smart_refresh/constant/RefreshState;Lv/smart_refresh/constant/RefreshState;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lv/smart_refresh/constant/RefreshState;->None:Lv/smart_refresh/constant/RefreshState;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    if-ne p3, p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;->b:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 10
    .line 11
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->j5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;->b:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->d5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/lang/Runnable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;->b:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;->b:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;->d5(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag;)Ljava/lang/Runnable;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-wide/16 v2, 0x7d0

    .line 36
    .line 37
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStatusSquareTabFrag$b;->a:Landroid/view/View;

    .line 41
    .line 42
    if-eq p3, p1, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p2, 0x0

    .line 46
    :goto_0
    invoke-static {p0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
