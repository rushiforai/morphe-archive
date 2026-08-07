.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;IZ)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->h(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->c:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    int-to-float p1, p2

    .line 25
    const/high16 p2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    mul-float/2addr p1, p2

    .line 28
    const/high16 p2, 0x42c80000    # 100.0f

    .line 29
    .line 30
    div-float/2addr p1, p2

    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 32
    .line 33
    invoke-static {p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->h(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ll/y20;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    if-eqz p3, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->f(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->s(IF)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->i(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ll/z20;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->i(Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;)Ll/z20;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView$a;->a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountFilterMenuView;->p:Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->getProgress()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {v0, p0, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;)V
    .locals 0

    .line 1
    return-void
.end method
