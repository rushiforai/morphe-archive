.class public final synthetic Le/e/a/PlaybackSession$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaybackSession;"
    method = "lambda$normalChoose$2"
    proto = "(ILjava/lang/Object;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/PlaybackSession$4;->f$0:I

    iput-object p2, p0, Le/e/a/PlaybackSession$4;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget v0, p0, Le/e/a/PlaybackSession$4;->f$0:I

    iget-object v1, p0, Le/e/a/PlaybackSession$4;->f$1:Ljava/lang/Object;

    invoke-static {v0, v1, p1, p2}, Le/e/a/PlaybackSession;->lambda$normalChoose$2(ILjava/lang/Object;Landroid/content/DialogInterface;I)V

    return-void
.end method
