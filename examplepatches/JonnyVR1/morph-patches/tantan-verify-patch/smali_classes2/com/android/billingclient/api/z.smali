.class public final synthetic Lcom/android/billingclient/api/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/android/billingclient/api/e0;

.field public final synthetic b:Ll/c10;

.field public final synthetic c:Ll/d10;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/e0;Ll/c10;Ll/d10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/billingclient/api/z;->a:Lcom/android/billingclient/api/e0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/billingclient/api/z;->b:Ll/c10;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/billingclient/api/z;->c:Ll/d10;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/z;->a:Lcom/android/billingclient/api/e0;

    iget-object v1, p0, Lcom/android/billingclient/api/z;->b:Ll/c10;

    iget-object p0, p0, Lcom/android/billingclient/api/z;->c:Ll/d10;

    invoke-virtual {v0, v1, p0}, Lcom/android/billingclient/api/e0;->N0(Ll/c10;Ll/d10;)V

    return-void
.end method
