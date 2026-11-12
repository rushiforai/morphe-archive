.class public final Lb0c;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lv3m;

.field public d:B

.field public e:Lszb;

.field public f:Lszb;


# direct methods
.method public constructor <init>(Lo4m;Lv3m;)V
    .registers 4

    const/16 v0, 0x18

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    const/4 p1, 0x0

    iput-byte p1, p0, Lb0c;->d:B

    iput-object p2, p0, Lb0c;->c:Lv3m;

    return-void
.end method


# virtual methods
.method public final H0(Lszb;Z)V
    .registers 4

    iget-object v0, p0, Lb0c;->c:Lv3m;

    invoke-virtual {v0, p1}, Lv3m;->h(Lszb;)Z

    move-result v0

    if-nez v0, :cond_9

    const/4 p1, 0x0

    :cond_9
    iput-object p1, p0, Lb0c;->e:Lszb;

    iget-object v0, p0, Lb0c;->f:Lszb;

    if-eqz v0, :cond_10

    return-void

    :cond_10
    if-eqz p1, :cond_16

    const/4 p1, 0x1

    iput-byte p1, p0, Lb0c;->d:B

    goto :goto_1d

    :cond_16
    if-eqz p2, :cond_1a

    const/4 p1, 0x2

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    iput-byte p1, p0, Lb0c;->d:B

    :goto_1d
    invoke-virtual {p0}, Ln1;->v0()V

    return-void
.end method

.method public final I0(Lb2l;Ljava/lang/String;)V
    .registers 6

    const/4 v0, 0x0

    iput-object v0, p0, Lb0c;->e:Lszb;

    iput-object v0, p0, Lb0c;->f:Lszb;

    const/4 v1, 0x0

    iput-byte v1, p0, Lb0c;->d:B

    invoke-virtual {p0}, Ln1;->v0()V

    if-eqz p2, :cond_1d

    iget-object v2, p0, Lb0c;->c:Lv3m;

    invoke-virtual {v2, p2}, Lv3m;->b(Ljava/lang/String;)Lszb;

    move-result-object p2

    if-eqz p2, :cond_1d

    iput-object p2, p0, Lb0c;->f:Lszb;

    const/4 p2, 0x1

    iput-byte p2, p0, Lb0c;->d:B

    invoke-virtual {p0}, Ln1;->v0()V

    :cond_1d
    if-eqz p1, :cond_34

    invoke-static {p1}, Luy3;->F(Lb9l;)Luy3;

    move-result-object p1

    if-eqz p1, :cond_28

    iget-object p1, p1, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_29

    :cond_28
    move-object p1, v0

    :goto_29
    if-eqz p1, :cond_34

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    if-eqz p1, :cond_34

    iget-object p1, p1, Lyqa;->c:Ljava/lang/Object;

    move-object v0, p1

    check-cast v0, Lszb;

    :cond_34
    invoke-virtual {p0, v0, v1}, Lb0c;->H0(Lszb;Z)V

    return-void
.end method
