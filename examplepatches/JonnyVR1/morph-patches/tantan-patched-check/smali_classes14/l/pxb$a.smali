.class public Ll/pxb$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tvb$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pxb;->l(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pxb;


# direct methods
.method public constructor <init>(Ll/pxb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pxb$a;->a:Ll/pxb;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/net/Uri;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pxb$a;->a:Ll/pxb;

    .line 2
    .line 3
    invoke-static {p0}, Ll/pxb;->i(Ll/pxb;)Lv/VProgressBar;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pxb$a;->a:Ll/pxb;

    .line 2
    .line 3
    invoke-static {v0}, Ll/pxb;->i(Ll/pxb;)Lv/VProgressBar;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    instance-of p1, p1, Lcom/p1/mobile/android/ui/cropiwa/TooLargeException;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/account/R$string;->d0:I

    .line 16
    .line 17
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget p1, Lcom/p1/mobile/putong/account/R$string;->R:I

    .line 22
    .line 23
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Ll/pxb$a;->a:Ll/pxb;

    .line 27
    .line 28
    invoke-static {p0}, Ll/pxb;->f(Ll/pxb;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CropperAct;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    return-void
.end method
