.class public final Lapk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

.field public final b:Lnb2;

.field public final c:Lnb2;

.field public final d:Lnb2;

.field public final e:Lnb2;

.field public final f:Lnb2;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapk;->a:Lcom/opera/android/suggested_sites/SuggestedSitesDatabase_Impl;

    new-instance p1, Lnb2;

    const/16 v0, 0x12

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lapk;->b:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0x13

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lapk;->c:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0x14

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lapk;->d:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0x15

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lapk;->e:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0x16

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lapk;->f:Lnb2;

    return-void
.end method
