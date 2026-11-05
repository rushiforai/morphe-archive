.class public final Le/e/a/ModernControls$Open;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

.field public mode:I


# direct methods
.method public constructor <init>(Lcom/sauzask/nicoid/NicoidVideoFragment;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernControls$Open;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iput p2, p0, Le/e/a/ModernControls$Open;->mode:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Le/e/a/ModernControls$Open;->fragment:Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget v1, p0, Le/e/a/ModernControls$Open;->mode:I

    invoke-static {v0, v1}, Le/e/a/PlaybackSession;->normalChoose(Ljava/lang/Object;I)V

    return-void
.end method
