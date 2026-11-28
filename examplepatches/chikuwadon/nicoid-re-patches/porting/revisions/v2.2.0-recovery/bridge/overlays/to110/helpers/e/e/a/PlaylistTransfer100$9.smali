.class public final synthetic Le/e/a/PlaylistTransfer100$9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$pick$0"
    proto = "(Ljava/util/function/Consumer;Ljava/util/List;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/function/Consumer;

.field public final synthetic f$1:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Consumer;Ljava/util/List;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$9;->f$0:Ljava/util/function/Consumer;

    iput-object p2, p0, Le/e/a/PlaylistTransfer100$9;->f$1:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$9;->f$0:Ljava/util/function/Consumer;

    iget-object v1, p0, Le/e/a/PlaylistTransfer100$9;->f$1:Ljava/util/List;

    invoke-static {v0, v1, p1, p2}, Le/e/a/PlaylistTransfer100;->lambda$pick$0(Ljava/util/function/Consumer;Ljava/util/List;Landroid/content/DialogInterface;I)V

    return-void
.end method
