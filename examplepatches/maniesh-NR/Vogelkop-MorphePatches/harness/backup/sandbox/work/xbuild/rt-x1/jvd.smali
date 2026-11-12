.class public final Ljvd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/touch/MessageDatabase_Impl;

.field public final b:Lnb2;


# direct methods
.method public constructor <init>(Lcom/opera/android/touch/MessageDatabase_Impl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljvd;->a:Lcom/opera/android/touch/MessageDatabase_Impl;

    new-instance p1, Lnb2;

    const/16 v0, 0xf

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Ljvd;->b:Lnb2;

    return-void
.end method
