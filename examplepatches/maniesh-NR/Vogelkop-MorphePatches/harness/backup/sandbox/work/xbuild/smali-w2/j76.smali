.class public final Lj76;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkd5;

.field public final b:Ljava/util/HashSet;

.field public final c:Ljava/util/HashSet;


# direct methods
.method public constructor <init>(Lkd5;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lj76;->b:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lj76;->c:Ljava/util/HashSet;

    iput-object p1, p0, Lj76;->a:Lkd5;

    return-void
.end method
