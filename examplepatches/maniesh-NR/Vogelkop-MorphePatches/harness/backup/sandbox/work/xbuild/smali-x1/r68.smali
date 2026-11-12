.class public final Lr68;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lxnh;

.field public final b:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>(Lxnh;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lr68;->b:Landroid/util/SparseArray;

    iput-object p1, p0, Lr68;->a:Lxnh;

    return-void
.end method
