.class public final synthetic Le/e/a/ShortImages$Job$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/ShortImages$Job;

.field public final synthetic f$1:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ShortImages$Job;Landroid/graphics/Bitmap;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ShortImages$Job$$ExternalSyntheticLambda0;->f$0:Le/e/a/ShortImages$Job;

    iput-object p2, p0, Le/e/a/ShortImages$Job$$ExternalSyntheticLambda0;->f$1:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/ShortImages$Job$$ExternalSyntheticLambda0;->f$0:Le/e/a/ShortImages$Job;

    iget-object v1, p0, Le/e/a/ShortImages$Job$$ExternalSyntheticLambda0;->f$1:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Le/e/a/ShortImages$Job;->lambda$run$0$e-e-a-ShortImages$Job(Landroid/graphics/Bitmap;)V

    return-void
.end method
