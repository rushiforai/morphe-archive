.class public abstract Lb9j;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:La5n;


# direct methods
.method public constructor <init>(La5n;)V
    .registers 3

    invoke-interface {p1}, La5n;->getRoot()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lb9j;->b:La5n;

    return-void
.end method
