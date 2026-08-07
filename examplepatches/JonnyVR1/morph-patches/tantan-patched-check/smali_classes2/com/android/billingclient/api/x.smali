.class public final synthetic Lcom/android/billingclient/api/x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/android/billingclient/api/e0;

.field public final synthetic b:Ll/x06;

.field public final synthetic c:Ll/y06;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/e0;Ll/x06;Ll/y06;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/billingclient/api/x;->a:Lcom/android/billingclient/api/e0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/billingclient/api/x;->b:Ll/x06;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/billingclient/api/x;->c:Ll/y06;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/x;->a:Lcom/android/billingclient/api/e0;

    iget-object v1, p0, Lcom/android/billingclient/api/x;->b:Ll/x06;

    iget-object p0, p0, Lcom/android/billingclient/api/x;->c:Ll/y06;

    invoke-virtual {v0, v1, p0}, Lcom/android/billingclient/api/e0;->O0(Ll/x06;Ll/y06;)V

    return-void
.end method
