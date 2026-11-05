.class final Le/e/a/FlatUi191$FlatOutline;
.super Landroid/view/ViewOutlineProvider;
.source "FlatUi191.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FlatUi191;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlatOutline"
.end annotation


# instance fields
.field final source:Landroid/view/ViewOutlineProvider;


# direct methods
.method constructor <init>(Landroid/view/ViewOutlineProvider;)V
    .registers 2

    .line 16
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    iput-object p1, p0, Le/e/a/FlatUi191$FlatOutline;->source:Landroid/view/ViewOutlineProvider;

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .registers 4

    .line 16
    iget-object v0, p0, Le/e/a/FlatUi191$FlatOutline;->source:Landroid/view/ViewOutlineProvider;

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewOutlineProvider;->getOutline(Landroid/view/View;Landroid/graphics/Outline;)V

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/graphics/Outline;->setAlpha(F)V

    return-void
.end method
