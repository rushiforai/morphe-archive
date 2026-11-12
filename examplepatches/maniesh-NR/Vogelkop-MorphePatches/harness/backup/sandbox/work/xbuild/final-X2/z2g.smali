.class public final Lz2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpke;
.implements Lp5j;


# instance fields
.field public final a:Lqke;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lox3;

.field public d:Z


# direct methods
.method public constructor <init>(Lqke;Lcom/opera/android/settings/SettingsManager;Lox3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz2g;->a:Lqke;

    iput-object p2, p0, Lz2g;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lz2g;->c:Lox3;

    const-string p3, "collect_partner_visits"

    invoke-virtual {p2, p3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p3

    iput-boolean p3, p0, Lz2g;->d:Z

    invoke-virtual {p1, p0}, Lqke;->W(Lpke;)V

    invoke-virtual {p2, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "collect_partner_visits"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p1, p0, Lz2g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lz2g;->d:Z

    :cond_10
    return-void
.end method

.method public final w(Lb2l;Loke;JZ)V
    .registers 6

    if-eqz p5, :cond_4f

    iget-boolean p3, p2, Loke;->d:Z

    if-nez p3, :cond_4f

    iget-boolean p2, p2, Loke;->c:Z

    if-nez p2, :cond_4f

    iget-boolean p2, p0, Lz2g;->d:Z

    if-eqz p2, :cond_4f

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Ly2g;->c:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p1}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 p3, -0x1

    if-nez p2, :cond_2d

    sget-object p2, Ly2g;->c:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnd7;

    if-nez p2, :cond_2f

    :cond_2d
    move p1, p3

    goto :goto_39

    :cond_2f
    sget-object p4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, p4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lnd7;->a(Ljava/lang/String;)I

    move-result p1

    :goto_39
    if-eq p1, p3, :cond_4f

    iget-object p0, p0, Lz2g;->c:Lox3;

    invoke-virtual {p0}, Lox3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Losf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lr95;

    const/4 p3, 0x6

    invoke-direct {p2, p3, p1}, Lr95;-><init>(BI)V

    invoke-virtual {p0, p2}, Losf;->a(Lkotlin/jvm/functions/Function1;)V

    :cond_4f
    return-void
.end method
