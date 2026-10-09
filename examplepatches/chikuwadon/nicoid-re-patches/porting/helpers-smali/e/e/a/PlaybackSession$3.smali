.class public final synthetic Le/e/a/PlaybackSession$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/SpeedSlider$Selection;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaybackSession;"
    method = "lambda$normalChoose$1"
    proto = "(Ljava/lang/Object;F)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaybackSession$3;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final selected(F)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/PlaybackSession$3;->f$0:Ljava/lang/Object;

    invoke-static {v0, p1}, Le/e/a/PlaybackSession;->lambda$normalChoose$1(Ljava/lang/Object;F)V

    return-void
.end method
