.class public final Lo2i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lid;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Likc;

.field public final c:Lew3;

.field public final d:Lfd;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Likc;Lew3;Lfd;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo2i;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lo2i;->b:Likc;

    iput-object p3, p0, Lo2i;->c:Lew3;

    iput-object p4, p0, Lo2i;->d:Lfd;

    invoke-virtual {p0}, Lo2i;->b()Z

    move-result p3

    iput-boolean p3, p0, Lo2i;->e:Z

    new-instance p3, Lrmg;

    const/16 p4, 0x13

    invoke-direct {p3, p0, p4}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/16 p4, 0x19

    invoke-direct {p0, p3, p4}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a(Lyk5;Lpc;)Ljf;
    .registers 9

    sget-object p1, Ln2i;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    aget p1, p1, p2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_25

    iget-boolean p1, p0, Lo2i;->e:Z

    if-eqz p1, :cond_25

    new-instance v0, Ljf;

    new-instance v1, Lm2i;

    const/4 p1, 0x0

    invoke-direct {v1, p0, p1}, Lm2i;-><init>(Lo2i;B)V

    new-instance v2, Lm2i;

    const/4 p1, 0x1

    invoke-direct {v2, p0, p1}, Lm2i;-><init>(Lo2i;B)V

    const/4 v4, 0x0

    const/16 v5, 0x3c

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    return-object v0

    :cond_25
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b()Z
    .registers 3

    iget-object p0, p0, Lo2i;->b:Likc;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lm18;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_1d

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1c

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1c

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1d

    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :cond_1c
    return v0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method
