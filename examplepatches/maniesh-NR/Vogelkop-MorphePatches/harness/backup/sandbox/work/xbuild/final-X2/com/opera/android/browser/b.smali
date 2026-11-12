.class public final Lcom/opera/android/browser/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:J

.field public static final f:Lt6a;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lzun;

.field public final c:Z

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x5

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lcom/opera/android/browser/b;->e:J

    new-instance v0, Lt6a;

    invoke-direct {v0}, Lt6a;-><init>()V

    sput-object v0, Lcom/opera/android/browser/b;->f:Lt6a;

    return-void
.end method

.method public constructor <init>(Ltcl;Ljava/lang/String;Lp6l;Lzun;Z)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/opera/android/browser/b;->a:Ljava/lang/String;

    iput-object p4, p0, Lcom/opera/android/browser/b;->b:Lzun;

    iput-boolean p5, p0, Lcom/opera/android/browser/b;->c:Z

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p5

    invoke-virtual {p5}, Landroid/net/Uri;->isAbsolute()Z

    move-result p5

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p5, :cond_6f

    invoke-static {}, LJ/N;->MeR1QuE8()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    const-string p5, "User-Agent: "

    invoke-static {p5, p4}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    new-instance p5, Lyun;

    invoke-direct {p5, p0, v1}, Lyun;-><init>(Lcom/opera/android/browser/b;B)V

    check-cast p1, Lumi;

    invoke-virtual {p1, p5}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p5

    new-instance v2, Lyun;

    invoke-direct {v2, p0, v0}, Lyun;-><init>(Lcom/opera/android/browser/b;B)V

    invoke-virtual {p1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v2

    invoke-virtual {p5, v2}, Lnml;->b(Lnml;)V

    new-instance v2, Lyun;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v3}, Lyun;-><init>(Lcom/opera/android/browser/b;B)V

    invoke-static {p2, p4, v2}, Lcom/opera/android/browser/SimpleUrlLoader;->a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;

    move-result-object p2

    sget-object p4, Lp6l;->b:Lp6l;

    if-ne p3, p4, :cond_47

    move v1, v0

    :cond_47
    new-instance p3, Lwa;

    const/16 p4, 0x1a

    invoke-direct {p3, p5, p4}, Lwa;-><init>(Ljava/lang/Object;B)V

    new-instance p4, Lwa;

    const/16 p5, 0x1b

    invoke-direct {p4, p0, p5}, Lwa;-><init>(Ljava/lang/Object;B)V

    iget-wide v2, p2, Lcom/opera/android/browser/SimpleUrlLoader;->a:J

    invoke-static {v2, v3, v1, p3, p4}, LJ/N;->MpBW0XH2(JZLjava/lang/Object;Ljava/lang/Object;)V

    new-instance p2, Lttn;

    invoke-direct {p2, p0, v0}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, p2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance p1, Loml;

    invoke-direct {p1, p0}, Loml;-><init>(Lnml;)V

    const/4 p0, 0x0

    sget-wide p2, Lcom/opera/android/browser/b;->e:J

    invoke-static {p1, p0, p2, p3}, Lcoh;->k(Loml;Ljava/lang/Object;J)V

    return-void

    :cond_6f
    iget-boolean p1, p0, Lcom/opera/android/browser/b;->d:Z

    if-eqz p1, :cond_74

    return-void

    :cond_74
    iput-boolean v0, p0, Lcom/opera/android/browser/b;->d:Z

    invoke-interface {p4, v1}, Lzun;->f(Z)V

    return-void
.end method
