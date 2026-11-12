.class public final Lp03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr03;


# instance fields
.field public a:I

.field public b:Z

.field public c:Lix5;

.field public final synthetic d:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lp03;->d:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lzcl;Lbx7;)Z
    .registers 15

    iget v0, p2, Lzcl;->a:I

    iput v0, p0, Lp03;->a:I

    new-instance v5, Lqie;

    invoke-direct {v5, p0, p3}, Lqie;-><init>(Lp03;Lbx7;)V

    iget-byte v0, p0, Lp03;->d:B

    const/4 v1, 0x6

    const/4 v7, 0x0

    const/4 v8, 0x1

    packed-switch v0, :pswitch_data_78

    invoke-static {p1}, Lw7d;->z(Landroid/content/Context;)I

    move-result v0

    if-ne v0, v1, :cond_20

    goto :goto_1e

    :pswitch_18
    invoke-static {p1}, Lw7d;->z(Landroid/content/Context;)I

    move-result v0

    if-ne v0, v1, :cond_20

    :goto_1e
    move v0, v8

    goto :goto_21

    :cond_20
    move v0, v7

    :goto_21
    const/4 v1, 0x2

    if-ne v0, v1, :cond_25

    return v7

    :cond_25
    const/16 v9, 0xf

    const/4 v10, 0x7

    if-ne v0, v8, :cond_33

    new-instance p1, Lvr9;

    invoke-direct {p1, v9, p0, p3, v7}, Lvr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-static {v10, p1}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    return v8

    :cond_33
    new-instance v1, Lll4;

    const/4 v6, 0x1

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v6}, Lll4;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lvr9;

    invoke-direct {p0, v9, v2, v5, v7}, Lvr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    sget-object p1, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->m:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    if-nez p1, :cond_4c

    new-instance p1, Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    invoke-direct {p1}, Lorg/chromium/content/browser/BrowserStartupControllerImpl;-><init>()V

    sput-object p1, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->m:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    :cond_4c
    move-object p2, p1

    iget-boolean p3, p1, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->f:Z

    if-eqz p3, :cond_59

    iget-boolean p1, p1, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->g:Z

    if-eqz p1, :cond_59

    invoke-static {v10, v1}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    return v8

    :cond_59
    if-nez p2, :cond_62

    new-instance p2, Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    invoke-direct {p2}, Lorg/chromium/content/browser/BrowserStartupControllerImpl;-><init>()V

    sput-object p2, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->m:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    :cond_62
    iget-boolean p1, p2, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->i:Z

    if-eqz p1, :cond_6f

    iget-boolean p1, p2, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->f:Z

    if-nez p1, :cond_6f

    iget-boolean p1, p2, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->g:Z

    if-eqz p1, :cond_6f

    move v7, v8

    :cond_6f
    new-instance p1, Lwm3;

    invoke-direct {p1, v2, v7, v1, p0}, Lwm3;-><init>(Lp03;ZLll4;Lvr9;)V

    invoke-static {v10, p1}, Lorg/chromium/base/task/PostTask;->c(ILjava/lang/Runnable;)V

    return v8

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final b(Landroid/content/Context;Lzcl;)Z
    .registers 3

    const/4 p1, 0x1

    iput-boolean p1, p0, Lp03;->b:Z

    sget-object p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->m:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    if-nez p0, :cond_e

    new-instance p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    invoke-direct {p0}, Lorg/chromium/content/browser/BrowserStartupControllerImpl;-><init>()V

    sput-object p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->m:Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    :cond_e
    return p1
.end method
