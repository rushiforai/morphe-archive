.class public final synthetic Lsz5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbg1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lsz5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte p0, p0, Lsz5;->a:B

    packed-switch p0, :pswitch_data_2c

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eq p0, v0, :cond_16

    const-string p0, "nothing"

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    :cond_16
    :pswitch_16
    return-void

    :pswitch_17
    check-cast p1, Landroid/content/SharedPreferences;

    const-string p0, "previous_show_time"

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_28

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-static {p1, p0}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    :cond_28
    return-void

    :pswitch_29
    check-cast p1, Landroid/content/SharedPreferences;

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_29
        :pswitch_17
        :pswitch_16
    .end packed-switch
.end method
