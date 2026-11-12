.class public final Lcom/opera/android/oauth2/OperaAccessSandbox;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Li7f;

.field public final b:La55;

.field public final c:Lyf1;

.field public d:J

.field public e:B

.field public f:I


# direct methods
.method public constructor <init>(La55;Lyf1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->a:Li7f;

    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    iput-object p1, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->b:La55;

    iput-object p2, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->c:Lyf1;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    const/4 v0, 0x5

    iput-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v0, 0x2

    if-eq p1, v0, :cond_7

    const/4 v0, 0x1

    :cond_7
    iput v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->f:I

    new-instance p1, Lg7f;

    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->a:Li7f;

    invoke-direct {p1, p0}, Lg7f;-><init>(Li7f;)V

    :goto_10
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_20

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbhf;

    invoke-virtual {p0}, Lbhf;->a()V

    goto :goto_10

    :cond_20
    return-void
.end method

.method public final b()V
    .registers 2

    const/4 v0, 0x4

    iput-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v0, 0x0

    iput v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->f:I

    new-instance v0, Lg7f;

    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->a:Li7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_d
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_1d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbhf;

    invoke-virtual {p0}, Lbhf;->a()V

    goto :goto_d

    :cond_1d
    return-void
.end method

.method public final onStarted(I)V
    .registers 6

    iget-byte v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v1, 0x3

    if-ne v0, v1, :cond_f

    if-nez p1, :cond_b

    invoke-virtual {p0}, Lcom/opera/android/oauth2/OperaAccessSandbox;->b()V

    return-void

    :cond_b
    invoke-virtual {p0, p1}, Lcom/opera/android/oauth2/OperaAccessSandbox;->a(I)V

    return-void

    :cond_f
    iget-wide v0, p0, Lcom/opera/android/oauth2/OperaAccessSandbox;->d:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_1c

    if-nez p1, :cond_1c

    invoke-static {v0, v1}, LJ/N;->MiD6gAXx(J)V

    :cond_1c
    return-void
.end method
