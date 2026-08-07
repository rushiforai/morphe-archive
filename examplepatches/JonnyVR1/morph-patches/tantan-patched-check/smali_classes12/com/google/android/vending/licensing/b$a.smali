.class public Lcom/google/android/vending/licensing/b$a;
.super Lcom/google/android/vending/licensing/a$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/vending/licensing/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/xdr;

.field public b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/google/android/vending/licensing/b;


# direct methods
.method public constructor <init>(Lcom/google/android/vending/licensing/b;Ll/xdr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/vending/licensing/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/google/android/vending/licensing/b$a;->a:Ll/xdr;

    .line 7
    .line 8
    new-instance p2, Lcom/google/android/vending/licensing/b$a$a;

    .line 9
    .line 10
    invoke-direct {p2, p0, p1}, Lcom/google/android/vending/licensing/b$a$a;-><init>(Lcom/google/android/vending/licensing/b$a;Lcom/google/android/vending/licensing/b;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/google/android/vending/licensing/b$a;->b:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/vending/licensing/b$a;->m4()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic P2(Lcom/google/android/vending/licensing/b$a;)Ll/xdr;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/vending/licensing/b$a;->a:Ll/xdr;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y2(Lcom/google/android/vending/licensing/b$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/vending/licensing/b$a;->P3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final P3()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/vending/licensing/b;->e(Lcom/google/android/vending/licensing/b;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/google/android/vending/licensing/b$a;->b:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g2(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/vending/licensing/b;->e(Lcom/google/android/vending/licensing/b;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/google/android/vending/licensing/b$a$b;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/vending/licensing/b$a$b;-><init>(Lcom/google/android/vending/licensing/b$a;ILjava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final m4()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/vending/licensing/b;->e(Lcom/google/android/vending/licensing/b;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/google/android/vending/licensing/b$a;->b:Ljava/lang/Runnable;

    .line 8
    .line 9
    const-wide/16 v1, 0x2710

    .line 10
    .line 11
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
