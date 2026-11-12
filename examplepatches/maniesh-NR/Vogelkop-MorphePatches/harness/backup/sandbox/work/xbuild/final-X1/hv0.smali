.class public final Lhv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lid;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Lfd;

.field public final d:Lj4c;

.field public final e:Lcom/opera/android/settings/SettingsManager;

.field public final f:Ld8j;

.field public final g:Lpt3;

.field public final h:Lcom/opera/android/Lazy;

.field public i:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lfd;Lj4c;Lcom/opera/android/settings/SettingsManager;Ld8j;Lpt3;Lcom/opera/android/Lazy;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhv0;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lhv0;->b:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Lhv0;->c:Lfd;

    iput-object p4, p0, Lhv0;->d:Lj4c;

    iput-object p5, p0, Lhv0;->e:Lcom/opera/android/settings/SettingsManager;

    iput-object p6, p0, Lhv0;->f:Ld8j;

    iput-object p7, p0, Lhv0;->g:Lpt3;

    iput-object p8, p0, Lhv0;->h:Lcom/opera/android/Lazy;

    new-instance p1, Ls9;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Ls9;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lvme;

    const/16 p3, 0x13

    invoke-direct {p0, p3}, Lvme;-><init>(B)V

    invoke-static {p5, p2, p1, p0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final a(Lyk5;Lpc;)Ljf;
    .registers 9

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/16 p2, 0x9

    if-eq p1, p2, :cond_59

    packed-switch p1, :pswitch_data_7e

    goto :goto_7c

    :pswitch_c
    invoke-virtual {p0}, Lhv0;->b()Z

    move-result p1

    if-eqz p1, :cond_7c

    new-instance v0, Ljf;

    new-instance v1, Lgv0;

    const/4 p1, 0x4

    invoke-direct {v1, p0, p1}, Lgv0;-><init>(Lhv0;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3e

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :pswitch_23
    invoke-virtual {p0}, Lhv0;->b()Z

    move-result p1

    if-eqz p1, :cond_7c

    new-instance v0, Ljf;

    new-instance v1, Lgv0;

    const/4 p1, 0x3

    invoke-direct {v1, p0, p1}, Lgv0;-><init>(Lhv0;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3e

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :pswitch_3a
    invoke-virtual {p0}, Lhv0;->b()Z

    move-result p1

    if-eqz p1, :cond_7c

    iget-object p1, p0, Lhv0;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p1}, Lwxe;->J(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_7c

    new-instance v0, Ljf;

    new-instance v1, Lgv0;

    const/4 p1, 0x2

    invoke-direct {v1, p0, p1}, Lgv0;-><init>(Lhv0;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3e

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :cond_59
    invoke-virtual {p0}, Lhv0;->c()Z

    move-result p1

    if-eqz p1, :cond_7c

    new-instance v0, Ljf;

    new-instance v1, Lgv0;

    const/4 p1, 0x0

    invoke-direct {v1, p0, p1}, Lgv0;-><init>(Lhv0;B)V

    new-instance v2, Lgv0;

    const/4 p1, 0x1

    invoke-direct {v2, p0, p1}, Lgv0;-><init>(Lhv0;B)V

    iget-object p0, p0, Lhv0;->e:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "ai_assistant_menu_shortcut"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    const/16 v5, 0x1c

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :cond_7c
    :goto_7c
    const/4 p0, 0x0

    return-object p0

    :pswitch_data_7e
    .packed-switch 0x18
        :pswitch_3a
        :pswitch_23
        :pswitch_c
    .end packed-switch
.end method

.method public final b()Z
    .registers 2

    invoke-virtual {p0}, Lhv0;->c()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object p0, p0, Lhv0;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "ai_assistant_menu_shortcut"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final c()Z
    .registers 6

    iget-object v0, p0, Lhv0;->i:Ljava/lang/Boolean;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_9
    iget-object v0, p0, Lhv0;->d:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyk6;

    iget-object v1, v0, Lyk6;->i:Lkze;

    new-instance v2, Lz3;

    const/16 v3, 0xe

    invoke-direct {v2, p0, v3}, Lz3;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lpb;

    const/16 v4, 0x8

    invoke-direct {v3, v2, v4}, Lpb;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lhv0;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, p0, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p0, v0, Lyk6;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method
