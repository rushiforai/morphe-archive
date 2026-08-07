.class public Ll/p6a0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/atl;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/p6a0;->v()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/p6a0;


# direct methods
.method public constructor <init>(Ll/p6a0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p6a0$a;->a:Ll/p6a0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c0(IIIILandroid/view/View;)V
    .locals 0

    .line 1
    const/high16 p2, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/p6a0$a;->a:Ll/p6a0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    if-eqz p5, :cond_3

    .line 15
    .line 16
    invoke-virtual {p5}, Landroid/view/View;->isAttachedToWindow()Z

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    if-nez p4, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/high16 p4, 0x42300000    # 44.0f

    .line 24
    .line 25
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    iget-object p0, p0, Ll/p6a0$a;->a:Ll/p6a0;

    .line 30
    .line 31
    if-le p3, p4, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object p0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/p6a0$a;->a:Ll/p6a0;

    .line 46
    .line 47
    iget-object p0, p0, Ll/p6a0;->d:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->f(F)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
