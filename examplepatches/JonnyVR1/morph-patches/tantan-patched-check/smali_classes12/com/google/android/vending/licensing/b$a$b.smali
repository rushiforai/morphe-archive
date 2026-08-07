.class public Lcom/google/android/vending/licensing/b$a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/vending/licensing/b$a;->g2(ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/google/android/vending/licensing/b$a;


# direct methods
.method public constructor <init>(Lcom/google/android/vending/licensing/b$a;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/vending/licensing/b$a$b;->d:Lcom/google/android/vending/licensing/b$a;

    .line 2
    .line 3
    iput p2, p0, Lcom/google/android/vending/licensing/b$a$b;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/google/android/vending/licensing/b$a$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/google/android/vending/licensing/b$a$b;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a$b;->d:Lcom/google/android/vending/licensing/b$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/vending/licensing/b;->c(Lcom/google/android/vending/licensing/b;)Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/google/android/vending/licensing/b$a$b;->d:Lcom/google/android/vending/licensing/b$a;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/google/android/vending/licensing/b$a;->P2(Lcom/google/android/vending/licensing/b$a;)Ll/xdr;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a$b;->d:Lcom/google/android/vending/licensing/b$a;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/google/android/vending/licensing/b$a;->Y2(Lcom/google/android/vending/licensing/b$a;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a$b;->d:Lcom/google/android/vending/licensing/b$a;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/google/android/vending/licensing/b$a;->P2(Lcom/google/android/vending/licensing/b$a;)Ll/xdr;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Lcom/google/android/vending/licensing/b$a$b;->d:Lcom/google/android/vending/licensing/b$a;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 35
    .line 36
    invoke-static {v1}, Lcom/google/android/vending/licensing/b;->d(Lcom/google/android/vending/licensing/b;)Ljava/security/PublicKey;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget v2, p0, Lcom/google/android/vending/licensing/b$a$b;->a:I

    .line 41
    .line 42
    iget-object v3, p0, Lcom/google/android/vending/licensing/b$a$b;->b:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v4, p0, Lcom/google/android/vending/licensing/b$a$b;->c:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2, v3, v4}, Ll/xdr;->g(Ljava/security/PublicKey;ILjava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/google/android/vending/licensing/b$a$b;->d:Lcom/google/android/vending/licensing/b$a;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 52
    .line 53
    invoke-static {p0}, Lcom/google/android/vending/licensing/b$a;->P2(Lcom/google/android/vending/licensing/b$a;)Ll/xdr;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v0, p0}, Lcom/google/android/vending/licensing/b;->b(Lcom/google/android/vending/licensing/b;Ll/xdr;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method
