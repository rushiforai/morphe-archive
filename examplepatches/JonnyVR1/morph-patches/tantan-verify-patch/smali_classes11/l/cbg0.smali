.class public final synthetic Ll/cbg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$e;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$e;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cbg0;->a:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$e;

    iput p2, p0, Ll/cbg0;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cbg0;->a:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$e;

    iget p0, p0, Ll/cbg0;->b:I

    invoke-static {v0, p0, p1}, Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$e;->y(Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$e;ILandroid/view/View;)V

    return-void
.end method
