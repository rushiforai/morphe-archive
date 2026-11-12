.class public final Lg5g;
.super Lm5g;
.source "SourceFile"


# instance fields
.field public final b:Lf5g;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Li5g;Li5g;Lu3g;ZZZZLqfb;)V
    .registers 20

    new-instance v0, Lf5g;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v0 .. v9}, Lf5g;-><init>(Landroid/view/ViewGroup;Li5g;Li5g;Lu3g;ZZZZLqfb;)V

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lg5g;->b:Lf5g;

    return-void
.end method
