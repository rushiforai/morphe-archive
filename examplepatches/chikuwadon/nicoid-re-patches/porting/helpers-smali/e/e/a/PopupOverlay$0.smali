.class public final synthetic Le/e/a/PopupOverlay$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PopupOverlay;"
    method = "lambda$attach$0"
    proto = "(Landroid/view/View;Landroid/view/View;IIIIIIII)V"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PopupOverlay$0;->f$0:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 20

    .line 0
    iget-object v0, p0, Le/e/a/PopupOverlay$0;->f$0:Landroid/view/View;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-static/range {v0 .. v9}, Le/e/a/PopupOverlay;->lambda$attach$0(Landroid/view/View;Landroid/view/View;IIIIIIII)V

    return-void
.end method
