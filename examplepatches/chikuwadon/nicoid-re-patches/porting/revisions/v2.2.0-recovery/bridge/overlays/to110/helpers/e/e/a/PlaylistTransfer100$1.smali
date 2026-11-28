.class public final synthetic Le/e/a/PlaylistTransfer100$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$pickPlaylist$1"
    proto = "([Ljava/lang/String;Ljava/util/function/Consumer;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:[Ljava/lang/String;

.field public final synthetic f$1:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;Ljava/util/function/Consumer;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$1;->f$0:[Ljava/lang/String;

    iput-object p2, p0, Le/e/a/PlaylistTransfer100$1;->f$1:Ljava/util/function/Consumer;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$1;->f$0:[Ljava/lang/String;

    iget-object v1, p0, Le/e/a/PlaylistTransfer100$1;->f$1:Ljava/util/function/Consumer;

    invoke-static {v0, v1, p1, p2}, Le/e/a/PlaylistTransfer100;->lambda$pickPlaylist$1([Ljava/lang/String;Ljava/util/function/Consumer;Landroid/content/DialogInterface;I)V

    return-void
.end method
