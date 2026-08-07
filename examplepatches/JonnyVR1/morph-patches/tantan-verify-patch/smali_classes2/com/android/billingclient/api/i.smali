.class public final synthetic Lcom/android/billingclient/api/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/android/billingclient/api/b;

.field public final synthetic b:Ll/x06;

.field public final synthetic c:Ll/y06;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/b;Ll/x06;Ll/y06;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/billingclient/api/i;->a:Lcom/android/billingclient/api/b;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/billingclient/api/i;->b:Ll/x06;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/billingclient/api/i;->c:Ll/y06;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/i;->a:Lcom/android/billingclient/api/b;

    iget-object v1, p0, Lcom/android/billingclient/api/i;->b:Ll/x06;

    iget-object p0, p0, Lcom/android/billingclient/api/i;->c:Ll/y06;

    invoke-virtual {v0, v1, p0}, Lcom/android/billingclient/api/b;->K0(Ll/x06;Ll/y06;)Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0
.end method
