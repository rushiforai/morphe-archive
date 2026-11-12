.class public Lcom/google/android/datatransport/cct/CctBackendFactory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lc06;)Lo5m;
    .registers 4

    new-instance p0, Lvp4;

    move-object v0, p1

    check-cast v0, Lbn2;

    iget-object v0, v0, Lbn2;->a:Landroid/content/Context;

    check-cast p1, Lbn2;

    iget-object v1, p1, Lbn2;->b:Lt55;

    iget-object p1, p1, Lbn2;->c:Lt55;

    invoke-direct {p0, v0, v1, p1}, Lvp4;-><init>(Landroid/content/Context;Lt55;Lt55;)V

    return-object p0
.end method
