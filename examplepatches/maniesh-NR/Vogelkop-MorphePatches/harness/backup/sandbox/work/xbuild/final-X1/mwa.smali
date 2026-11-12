.class public final synthetic Lmwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lowa;


# direct methods
.method public synthetic constructor <init>(Lowa;B)V
    .registers 3

    iput-byte p2, p0, Lmwa;->a:B

    iput-object p1, p0, Lmwa;->b:Lowa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 9

    iget-byte v0, p0, Lmwa;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lmwa;->b:Lowa;

    packed-switch v0, :pswitch_data_96

    check-cast p1, Lhwa;

    iget-object v0, p0, Lowa;->h:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ldeg;

    iget-object v3, p0, Lowa;->i:Lnwa;

    invoke-virtual {v2, v3}, Ldeg;->b(Lacl;)V

    iget-object p0, p0, Lowa;->a:Landroid/content/Context;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldeg;

    if-eqz p1, :cond_23

    iget-object v1, p1, Lhwa;->a:Landroid/net/Uri;

    :cond_23
    const/high16 p1, 0x43000000    # 128.0f

    invoke-static {p0, p1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    invoke-virtual {v0, v1}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p1

    iget-object v0, p1, Ldwh;->b:Lgvh;

    invoke-virtual {v0, p0, p0}, Lgvh;->b(II)V

    sget-object p0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, p0}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    invoke-virtual {p1}, Ldwh;->b()V

    invoke-virtual {p1}, Ldwh;->j()V

    invoke-virtual {p1, v3}, Ldwh;->f(Lacl;)V

    return-void

    :pswitch_41
    check-cast p1, Lvjd;

    iget-object p0, p0, Lowa;->g:Ljwa;

    new-instance v0, Lhwa;

    iget-object v2, p1, Lvjd;->m:Landroid/net/Uri;

    invoke-direct {v0, v2}, Lhwa;-><init>(Landroid/net/Uri;)V

    filled-new-array {v0}, [Lhwa;

    move-result-object v2

    invoke-static {v2}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    iget-object p1, p1, Lvjd;->I:Landroid/os/Bundle;

    if-eqz p1, :cond_5e

    const-string v1, "com.opera.android.media.AI_POD_ICONS"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    :cond_5e
    const/4 p1, 0x0

    if-eqz v1, :cond_83

    array-length v3, v1

    if-eqz v3, :cond_83

    array-length v3, v1

    move v4, p1

    :goto_66
    if-ge v4, v3, :cond_83

    aget-object v5, v1, v4

    if-eqz v5, :cond_80

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    iget-object v6, v0, Lhwa;->a:Landroid/net/Uri;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_80

    new-instance v6, Lhwa;

    invoke-direct {v6, v5}, Lhwa;-><init>(Landroid/net/Uri;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_80
    add-int/lit8 v4, v4, 0x1

    goto :goto_66

    :cond_83
    iget-object v0, p0, Ljwa;->c:Ljava/util/List;

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_95

    iput-object v2, p0, Ljwa;->c:Ljava/util/List;

    iput p1, p0, Ljwa;->d:I

    invoke-virtual {p0}, Ljwa;->a()V

    invoke-virtual {p0}, Ljwa;->b()V

    :cond_95
    return-void

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_41
    .end packed-switch
.end method
