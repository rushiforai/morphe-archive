.class public final Lx5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lz5l;


# direct methods
.method public constructor <init>(Lz5l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx5l;->a:Lz5l;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    iget-object p0, p0, Lx5l;->a:Lz5l;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
