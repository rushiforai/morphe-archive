.class public final La7o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Ly6o;

.field public final c:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/view/View;Ly6o;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La7o;->a:Landroid/view/View;

    iput-object p2, p0, La7o;->b:Ly6o;

    iput-object p3, p0, La7o;->c:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, La7o;->a:Landroid/view/View;

    return-object p0
.end method
