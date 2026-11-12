.class public final Lspk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Lrpk;

.field public c:I

.field public final d:I

.field public e:D


# direct methods
.method public constructor <init>(Ljava/util/List;Lrpk;Lr7h;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lspk;->c:I

    iput-object p1, p0, Lspk;->a:Ljava/util/List;

    iput-object p2, p0, Lspk;->b:Lrpk;

    iget p1, p3, Lr7h;->a:I

    iput p1, p0, Lspk;->d:I

    iget-wide p1, p3, Lr7h;->b:D

    iput-wide p1, p0, Lspk;->e:D

    return-void
.end method
