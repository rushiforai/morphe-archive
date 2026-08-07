.class public final synthetic Lcom/android/billingclient/api/r0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/android/billingclient/api/b;

.field public final synthetic b:Ll/d10;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/b;Ll/d10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/billingclient/api/r0;->a:Lcom/android/billingclient/api/b;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/billingclient/api/r0;->b:Ll/d10;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/android/billingclient/api/r0;->a:Lcom/android/billingclient/api/b;

    iget-object p0, p0, Lcom/android/billingclient/api/r0;->b:Ll/d10;

    invoke-virtual {v0, p0}, Lcom/android/billingclient/api/b;->d0(Ll/d10;)V

    return-void
.end method
