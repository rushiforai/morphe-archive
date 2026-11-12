.class public final Ljqh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/redirect_store/RedirectStoreDatabase_Impl;

.field public final b:Lnb2;


# direct methods
.method public constructor <init>(Lcom/opera/android/redirect_store/RedirectStoreDatabase_Impl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljqh;->a:Lcom/opera/android/redirect_store/RedirectStoreDatabase_Impl;

    new-instance p1, Lnb2;

    const/16 v0, 0x11

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Ljqh;->b:Lnb2;

    return-void
.end method
