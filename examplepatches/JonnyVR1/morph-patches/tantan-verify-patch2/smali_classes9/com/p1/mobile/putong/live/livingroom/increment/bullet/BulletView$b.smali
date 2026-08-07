.class public Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 4
    .line 5
    sget v1, Ll/mdc0;->D0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 14
    .line 15
    sget v2, Ll/mdc0;->R3:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/widget/TextView;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 28
    .line 29
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ll/pf2;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-nez v2, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 37
    .line 38
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ll/pf2;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ll/pf2;->i()Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    invoke-static {v0, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    invoke-static {v1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    return-void
.end method
