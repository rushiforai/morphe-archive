.class public final Lhl4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Landroidx/recyclerview/widget/RecyclerView;B)V
    .registers 3

    iput-byte p2, p0, Lhl4;->a:B

    iput-object p1, p0, Lhl4;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lhl4;->a:B

    iget-object p0, p0, Lhl4;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method
