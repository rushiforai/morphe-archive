.class public Ll/mq60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e2m;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Ljava/lang/CharSequence;

.field public f:Ljava/lang/CharSequence;

.field public g:Ljava/lang/CharSequence;

.field public h:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/mq60;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/mq60;->b:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Ll/mq60;->c:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/mq60;->d:Z

    .line 12
    .line 13
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/mq60;
    .locals 1

    .line 1
    new-instance v0, Ll/mq60;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mq60;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0, v0, p1}, Ll/mq60;->j(Lcom/p1/mobile/android/app/Act;Ll/mq60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mq60;->f:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mq60;->g:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mq60;->h:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mq60;->e:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mq60;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mq60;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mq60;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mq60;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final j(Lcom/p1/mobile/android/app/Act;Ll/mq60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    iget-object p0, p2, Ll/mq60;->e:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->X9:I

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput-object p0, p2, Ll/mq60;->e:Ljava/lang/CharSequence;

    .line 12
    .line 13
    :cond_0
    iget-object p0, p2, Ll/mq60;->f:Ljava/lang/CharSequence;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->R9:I

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iput-object p0, p2, Ll/mq60;->f:Ljava/lang/CharSequence;

    .line 24
    .line 25
    :cond_1
    iget-object p0, p2, Ll/mq60;->g:Ljava/lang/CharSequence;

    .line 26
    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    invoke-static {p3}, Ll/z090;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, p2, Ll/mq60;->g:Ljava/lang/CharSequence;

    .line 34
    .line 35
    :cond_2
    iget-object p0, p2, Ll/mq60;->h:Ljava/lang/CharSequence;

    .line 36
    .line 37
    if-nez p0, :cond_3

    .line 38
    .line 39
    const-string p0, ""

    .line 40
    .line 41
    iput-object p0, p2, Ll/mq60;->h:Ljava/lang/CharSequence;

    .line 42
    .line 43
    :cond_3
    return-void
.end method

.method public k(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mq60;->f:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/mq60;->b:Z

    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Ll/mq60;->f:Ljava/lang/CharSequence;

    .line 13
    .line 14
    return-void
.end method

.method public l(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mq60;->g:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/mq60;->a:Z

    .line 11
    .line 12
    :cond_0
    iput-object p1, p0, Ll/mq60;->g:Ljava/lang/CharSequence;

    .line 13
    .line 14
    return-void
.end method

.method public m(Ljava/lang/CharSequence;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mq60;->h:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    :cond_0
    const/4 p2, 0x1

    .line 12
    iput-boolean p2, p0, Ll/mq60;->c:Z

    .line 13
    .line 14
    :cond_1
    iput-object p1, p0, Ll/mq60;->h:Ljava/lang/CharSequence;

    .line 15
    .line 16
    return-void
.end method
