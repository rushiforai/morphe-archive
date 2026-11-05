.class public final synthetic Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/PixelCopy$OnPixelCopyFinishedListener;


# instance fields
.field public final synthetic f$0:Le/e/a/PopupFrame233$State;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/view/View;

.field public final synthetic f$3:Ljava/lang/Object;

.field public final synthetic f$4:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Le/e/a/PopupFrame233$State;ILandroid/view/View;Ljava/lang/Object;Landroid/graphics/Bitmap;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$0:Le/e/a/PopupFrame233$State;

    iput p2, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$1:I

    iput-object p3, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$2:Landroid/view/View;

    iput-object p4, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$3:Ljava/lang/Object;

    iput-object p5, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$4:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final onPixelCopyFinished(I)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$0:Le/e/a/PopupFrame233$State;

    iget v1, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$1:I

    iget-object v2, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$2:Landroid/view/View;

    iget-object v3, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$3:Ljava/lang/Object;

    iget-object v4, p0, Le/e/a/PopupFrame233$$ExternalSyntheticLambda1;->f$4:Landroid/graphics/Bitmap;

    move v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/PopupFrame233;->lambda$0(Le/e/a/PopupFrame233$State;ILandroid/view/View;Ljava/lang/Object;Landroid/graphics/Bitmap;I)V

    return-void
.end method
