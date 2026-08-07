.class public Lcom/google/android/vending/licensing/b$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/vending/licensing/b$a;-><init>(Lcom/google/android/vending/licensing/b;Ll/xdr;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/vending/licensing/b;

.field public final synthetic b:Lcom/google/android/vending/licensing/b$a;


# direct methods
.method public constructor <init>(Lcom/google/android/vending/licensing/b$a;Lcom/google/android/vending/licensing/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/vending/licensing/b$a$a;->b:Lcom/google/android/vending/licensing/b$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/vending/licensing/b$a$a;->a:Lcom/google/android/vending/licensing/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a$a;->b:Lcom/google/android/vending/licensing/b$a;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/vending/licensing/b$a;->P2(Lcom/google/android/vending/licensing/b$a;)Ll/xdr;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v1, v0}, Lcom/google/android/vending/licensing/b;->a(Lcom/google/android/vending/licensing/b;Ll/xdr;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/google/android/vending/licensing/b$a$a;->b:Lcom/google/android/vending/licensing/b$a;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/google/android/vending/licensing/b$a;->c:Lcom/google/android/vending/licensing/b;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/google/android/vending/licensing/b$a;->P2(Lcom/google/android/vending/licensing/b$a;)Ll/xdr;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {v0, p0}, Lcom/google/android/vending/licensing/b;->b(Lcom/google/android/vending/licensing/b;Ll/xdr;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
