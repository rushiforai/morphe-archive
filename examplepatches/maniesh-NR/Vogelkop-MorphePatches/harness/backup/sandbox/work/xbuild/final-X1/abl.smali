.class public final Labl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfr;

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:I

.field public final f:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lfr;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Labl;->a:Lfr;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Labl;->f:Ljava/util/ArrayList;

    return-void
.end method
