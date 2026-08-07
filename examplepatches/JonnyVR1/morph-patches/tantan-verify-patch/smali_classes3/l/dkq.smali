.class public Ll/dkq;
.super Ll/sq2;
.source "SourceFile"


# instance fields
.field public c:Ll/hk70;

.field public d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/hk70;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sq2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dkq;->c:Ll/hk70;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dkq;->d:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/sq2;->e(Landroid/graphics/Bitmap;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dkq;->c:Ll/hk70;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Ll/qf60;->b(Landroid/graphics/Bitmap;)Ll/qf60$b;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/qf60$b;->a()Ll/qf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/dkq;->c:Ll/hk70;

    .line 19
    .line 20
    iget-object p0, p0, Ll/dkq;->d:Ljava/lang/String;

    .line 21
    .line 22
    const v1, -0x232324

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v1}, Ll/qf60;->h(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-interface {v0, p0, p1}, Ll/hk70;->a(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method
