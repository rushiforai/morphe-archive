.class public final Lmy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lid;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lfd;

.field public final c:Ldw3;

.field public final d:Lzyk;

.field public final e:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lfd;->e:Ljf;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lfd;Ldw3;Ldw3;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmy0;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lmy0;->b:Lfd;

    iput-object p3, p0, Lmy0;->c:Ldw3;

    new-instance p1, Lx2;

    const/16 p2, 0x8

    invoke-direct {p1, p4, p0, p2}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lmy0;->d:Lzyk;

    new-instance p1, Lpa;

    const/16 p2, 0x10

    invoke-direct {p1, p0, p2}, Lpa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lmy0;->e:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lyk5;Lpc;)Ljf;
    .registers 9

    sget-object p1, Lly0;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    aget p1, p1, p2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_39

    invoke-virtual {p0}, Lmy0;->b()Z

    move-result p1

    if-eqz p1, :cond_39

    new-instance v0, Ljf;

    new-instance v1, Lwhf;

    const/4 p1, 0x4

    invoke-direct {v1, p0, p1}, Lwhf;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lmy0;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lekc;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Li0a;

    const/4 p1, 0x0

    if-eqz p0, :cond_30

    iget-boolean p0, p0, Li0a;->b:Z

    if-ne p0, p2, :cond_30

    move v4, p2

    goto :goto_31

    :cond_30
    move v4, p1

    :goto_31
    const/16 v5, 0x16

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :cond_39
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b()Z
    .registers 2

    iget-object v0, p0, Lmy0;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lekc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li0a;

    if-eqz v0, :cond_2c

    iget-boolean v0, v0, Li0a;->a:Z

    if-eqz v0, :cond_2c

    iget-object p0, p0, Lmy0;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lekc;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/CharSequence;

    if-eqz p0, :cond_2c

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-eqz p0, :cond_2c

    const/4 p0, 0x1

    return p0

    :cond_2c
    const/4 p0, 0x0

    return p0
.end method
