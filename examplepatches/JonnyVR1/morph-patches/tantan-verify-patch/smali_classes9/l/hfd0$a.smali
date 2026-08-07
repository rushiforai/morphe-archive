.class public Ll/hfd0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hfd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/hfd0;


# direct methods
.method public constructor <init>(Ll/hfd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hfd0$a;->a:Ll/hfd0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hfd0$a;->a:Ll/hfd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hfd0;->L3(Ll/hfd0;)Lv/VFrame;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/hfd0$a;->a:Ll/hfd0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/hfd0;->L3(Ll/hfd0;)Lv/VFrame;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    cmpl-float p0, p0, v0

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    return-object p0
.end method

.method public b()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hfd0$a;->a:Ll/hfd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/hfd0;->K3(Ll/hfd0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public c(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hfd0$a;->a:Ll/hfd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Ll/hfd0;->M3(Ll/hfd0;Ljava/lang/Float;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hfd0$a;->a:Ll/hfd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Ll/hfd0;->N3(Ll/hfd0;Ljava/lang/Integer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
