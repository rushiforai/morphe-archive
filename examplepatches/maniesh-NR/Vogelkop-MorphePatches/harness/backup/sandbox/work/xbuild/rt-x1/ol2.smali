.class public final synthetic Lol2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lol2;->a:B

    iput-object p1, p0, Lol2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onDraw()V
    .registers 6

    iget-byte v0, p0, Lol2;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lol2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_64

    check-cast p0, Lev4;

    iput-boolean v1, p0, Lev4;->c:Z

    return-void

    :pswitch_e
    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez v0, :cond_15

    const/4 v0, 0x0

    :cond_15
    new-instance v1, Lqt3;

    const/16 v2, 0x8

    invoke-direct {v1, p0, v2}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_22
    check-cast p0, Ligi;

    iget-object v0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lft3;

    iget-object v0, v0, Lft3;->b:Lqim;

    iget-object v0, v0, Lqim;->g:Loz3;

    if-eqz v0, :cond_50

    iget-object v1, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v1, Lru9;

    iget-object v3, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "browser_actions_unused_button_hint_shown"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_50

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "customize_toolbar_ui_shown"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_50

    new-instance v1, Lkt3;

    invoke-direct {v1, p0, v2}, Lkt3;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_50
    return-void

    :pswitch_51
    check-cast p0, Lz43;

    iput-boolean v1, p0, Lz43;->a:Z

    iget-object p0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object p0, p0, Lgbf;->j:Lvbf;

    iput-boolean v1, p0, Lvbf;->F:Z

    return-void

    :pswitch_5e
    check-cast p0, Lql2;

    iput-boolean v2, p0, Lql2;->g:Z

    return-void

    nop

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_51
        :pswitch_22
        :pswitch_e
    .end packed-switch
.end method
