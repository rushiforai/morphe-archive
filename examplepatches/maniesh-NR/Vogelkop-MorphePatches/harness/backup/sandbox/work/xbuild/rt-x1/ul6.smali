.class public final synthetic Lul6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvl6;


# direct methods
.method public synthetic constructor <init>(Lvl6;B)V
    .registers 3

    iput-byte p2, p0, Lul6;->a:B

    iput-object p1, p0, Lul6;->b:Lvl6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lul6;->a:B

    iget-object p0, p0, Lul6;->b:Lvl6;

    packed-switch v0, :pswitch_data_52

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_32

    iget-object p1, p0, Lvl6;->c:Ljava/lang/Object;

    check-cast p1, Lru9;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-object v2, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "default_browser.first_set.timestamp"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_32

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v2, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v2, v3, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_32
    const/4 p1, 0x0

    iput-object p1, p0, Lvl6;->e:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_38
    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lvl6;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyl6;

    invoke-virtual {p0}, Lyl6;->d()Lsl6;

    move-result-object p0

    invoke-virtual {p0}, Lsl6;->b()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method
