.class public final Lpqc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lid;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lcom/opera/android/BrowserActivity;

.field public final c:Let3;

.field public final d:Lfd;

.field public e:Z

.field public final f:Lzyk;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/BrowserActivity;Lkze;Let3;Lfd;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpqc;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lpqc;->b:Lcom/opera/android/BrowserActivity;

    iput-object p4, p0, Lpqc;->c:Let3;

    iput-object p5, p0, Lpqc;->d:Lfd;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lpqc;->e:Z

    new-instance p1, Lq4b;

    const/16 p4, 0x13

    invoke-direct {p1, p0, p4}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lpqc;->f:Lzyk;

    new-instance p1, Lrkc;

    const/4 p4, 0x3

    invoke-direct {p1, p0, p4}, Lrkc;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/4 p4, 0x2

    invoke-direct {p0, p1, p4}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p2, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Lyk5;Lpc;)Ljf;
    .registers 9

    sget-object p1, Loqc;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    aget p1, p1, p2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_25

    iget-boolean p1, p0, Lpqc;->e:Z

    if-eqz p1, :cond_25

    new-instance v0, Ljf;

    new-instance v1, Lnqc;

    const/4 p1, 0x0

    invoke-direct {v1, p0, p1}, Lnqc;-><init>(Lpqc;B)V

    new-instance v2, Lnqc;

    const/4 p1, 0x1

    invoke-direct {v2, p0, p1}, Lnqc;-><init>(Lpqc;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3c

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :cond_25
    const/4 p0, 0x0

    return-object p0
.end method
