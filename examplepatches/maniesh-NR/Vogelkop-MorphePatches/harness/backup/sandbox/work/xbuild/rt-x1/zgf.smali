.class public final Lzgf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/util/SparseArray;

.field public final b:Lumi;

.field public final c:Lj4c;


# direct methods
.method public constructor <init>(Lumi;Lj4c;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lzgf;->a:Landroid/util/SparseArray;

    iput-object p1, p0, Lzgf;->b:Lumi;

    iput-object p2, p0, Lzgf;->c:Lj4c;

    return-void
.end method
