.class public final synthetic Ldf5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ler9;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Ldf5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ls14;)V
    .registers 2

    const/4 p1, 0x2

    iput-byte p1, p0, Ldf5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte p0, p0, Ldf5;->a:B

    const/16 v0, 0x492

    const/16 v1, 0x80

    const/16 v2, 0x100

    const/16 v3, 0x10

    const/16 v4, 0x20

    const/4 v5, 0x4

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    packed-switch p0, :pswitch_data_170

    check-cast p1, Landroid/content/Context;

    check-cast p2, Landroid/content/pm/ResolveInfo;

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    check-cast p4, Ljava/lang/CharSequence;

    check-cast p5, Lxjl;

    iget-wide v0, p5, Lxjl;->a:J

    invoke-static {v0, v1}, Lxjl;->f(J)I

    move-result p3

    iget-wide v0, p5, Lxjl;->a:J

    invoke-static {v0, v1}, Lxjl;->e(J)I

    move-result p5

    invoke-interface {p4, p3, p5}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    new-instance p4, Landroid/content/Intent;

    invoke-direct {p4}, Landroid/content/Intent;-><init>()V

    const-string p5, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {p4, p5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p4

    const-string p5, "text/plain"

    invoke-virtual {p4, p5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p4

    const-string p5, "android.intent.extra.PROCESS_TEXT_READONLY"

    invoke-virtual {p4, p5, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p0

    iget-object p2, p2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p4, p2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p2, p2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {p0, p4, p2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string p2, "android.intent.extra.PROCESS_TEXT"

    invoke-virtual {p0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_61
    move-object v1, p1

    check-cast v1, Ltpc;

    check-cast p2, Lcse;

    move-object v2, p3

    check-cast v2, Ljava/lang/String;

    check-cast p4, Lv0f;

    check-cast p5, Lv0f;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_7b

    if-eq p0, v8, :cond_79

    if-ne p0, v6, :cond_79

    const/4 p0, 0x0

    goto :goto_8f

    :cond_79
    move v3, v7

    goto :goto_7c

    :cond_7b
    move v3, v8

    :goto_7c
    new-instance v0, Lmoc;

    sget-object p0, Lv0f;->c:Lv0f;

    if-ne p4, p0, :cond_84

    move v4, v8

    goto :goto_85

    :cond_84
    move v4, v7

    :goto_85
    if-ne p5, p0, :cond_89

    move v5, v8

    goto :goto_8a

    :cond_89
    move v5, v7

    :goto_8a
    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Lmoc;-><init>(Ltpc;Ljava/lang/String;ZZZZ)V

    move-object p0, v0

    :goto_8f
    return-object p0

    :pswitch_90
    check-cast p1, Lxfl;

    check-cast p2, Llfl;

    check-cast p3, Lkotlin/jvm/functions/Function0;

    check-cast p4, Lih5;

    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p0

    and-int/lit8 p5, p0, 0x6

    if-nez p5, :cond_ba

    and-int/lit8 p5, p0, 0x8

    if-nez p5, :cond_ae

    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p1}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p5

    goto :goto_b5

    :cond_ae
    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result p5

    :goto_b5
    if-nez p5, :cond_b8

    move v5, v6

    :cond_b8
    or-int/2addr v5, p0

    goto :goto_bb

    :cond_ba
    move v5, p0

    :goto_bb
    and-int/lit8 p5, p0, 0x30

    if-nez p5, :cond_d6

    and-int/lit8 p5, p0, 0x40

    if-nez p5, :cond_cb

    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p2}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p5

    goto :goto_d2

    :cond_cb
    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result p5

    :goto_d2
    if-eqz p5, :cond_d5

    move v3, v4

    :cond_d5
    or-int/2addr v5, v3

    :cond_d6
    and-int/lit16 p0, p0, 0x180

    if-nez p0, :cond_e5

    move-object p0, p4

    check-cast p0, Lvt9;

    invoke-virtual {p0, p3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_e4

    move v1, v2

    :cond_e4
    or-int/2addr v5, v1

    :cond_e5
    and-int/lit16 p0, v5, 0x493

    if-eq p0, v0, :cond_ea

    move v7, v8

    :cond_ea
    and-int/lit8 p0, v5, 0x1

    check-cast p4, Lvt9;

    invoke-virtual {p4, p0, v7}, Lvt9;->N(IZ)Z

    move-result p0

    if-eqz p0, :cond_fa

    and-int/lit16 v5, v5, 0x3fe

    invoke-static {p1, p2, p3, p4, v5}, Lsw6;->c(Lxfl;Llfl;Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_fd

    :cond_fa
    invoke-virtual {p4}, Lvt9;->Q()V

    :goto_fd
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_100
    check-cast p1, Lxfl;

    check-cast p2, Llfl;

    check-cast p3, Lkotlin/jvm/functions/Function0;

    check-cast p4, Lih5;

    check-cast p5, Ljava/lang/Integer;

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result p0

    and-int/lit8 p5, p0, 0x6

    if-nez p5, :cond_12a

    and-int/lit8 p5, p0, 0x8

    if-nez p5, :cond_11e

    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p1}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p5

    goto :goto_125

    :cond_11e
    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result p5

    :goto_125
    if-nez p5, :cond_128

    move v5, v6

    :cond_128
    or-int/2addr v5, p0

    goto :goto_12b

    :cond_12a
    move v5, p0

    :goto_12b
    and-int/lit8 p5, p0, 0x30

    if-nez p5, :cond_146

    and-int/lit8 p5, p0, 0x40

    if-nez p5, :cond_13b

    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p2}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result p5

    goto :goto_142

    :cond_13b
    move-object p5, p4

    check-cast p5, Lvt9;

    invoke-virtual {p5, p2}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result p5

    :goto_142
    if-eqz p5, :cond_145

    move v3, v4

    :cond_145
    or-int/2addr v5, v3

    :cond_146
    and-int/lit16 p0, p0, 0x180

    if-nez p0, :cond_155

    move-object p0, p4

    check-cast p0, Lvt9;

    invoke-virtual {p0, p3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_154

    move v1, v2

    :cond_154
    or-int/2addr v5, v1

    :cond_155
    and-int/lit16 p0, v5, 0x493

    if-eq p0, v0, :cond_15a

    move v7, v8

    :cond_15a
    and-int/lit8 p0, v5, 0x1

    check-cast p4, Lvt9;

    invoke-virtual {p4, p0, v7}, Lvt9;->N(IZ)Z

    move-result p0

    if-eqz p0, :cond_16a

    and-int/lit16 v5, v5, 0x3fe

    invoke-static {p1, p2, p3, p4, v5}, Lsw6;->c(Lxfl;Llfl;Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_16d

    :cond_16a
    invoke-virtual {p4}, Lvt9;->Q()V

    :goto_16d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_170
    .packed-switch 0x0
        :pswitch_100
        :pswitch_90
        :pswitch_61
    .end packed-switch
.end method
