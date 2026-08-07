.class public Ll/wxf$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wxf;->f(Lcom/p1/mobile/android/app/Act;Lv/VText;ILjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ll/wxf;


# direct methods
.method public constructor <init>(Ll/wxf;Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wxf$a;->c:Ll/wxf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wxf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Ll/wxf$a;->b:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_fake_avatar_star_caseshow"

    .line 2
    .line 3
    const-string v0, "p_fake_avatar_star"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/wxf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 19
    .line 20
    iget-object p0, p0, Ll/wxf$a;->b:Ljava/lang/Runnable;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {p1, v0, p0, v1}, Ll/ks90;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/Runnable;Ll/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
