.class public final Lcj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public final d:Lz;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;ZLaj;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcj;->b:Z

    iput-boolean p1, p0, Lcj;->c:Z

    new-instance p2, Lz;

    new-instance v0, Lxa;

    invoke-direct {v0, p3, p0, p1}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, v0}, Lz;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcj;->d:Lz;

    return-void
.end method
