.class public final synthetic Ll/fbg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$l;

.field public final synthetic b:Lcom/google/android/exoplayer2/t;

.field public final synthetic c:Ll/dfj0;

.field public final synthetic d:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$k;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$l;Lcom/google/android/exoplayer2/t;Ll/dfj0;Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fbg0;->a:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$l;

    iput-object p2, p0, Ll/fbg0;->b:Lcom/google/android/exoplayer2/t;

    iput-object p3, p0, Ll/fbg0;->c:Ll/dfj0;

    iput-object p4, p0, Ll/fbg0;->d:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$k;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fbg0;->a:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$l;

    iget-object v1, p0, Ll/fbg0;->b:Lcom/google/android/exoplayer2/t;

    iget-object v2, p0, Ll/fbg0;->c:Ll/dfj0;

    iget-object p0, p0, Ll/fbg0;->d:Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$k;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$l;->y(Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$l;Lcom/google/android/exoplayer2/t;Ll/dfj0;Lcom/google/android/exoplayer2/ui/StyledPlayerControlView$k;Landroid/view/View;)V

    return-void
.end method
