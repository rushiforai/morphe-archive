.class public final synthetic Ll/p6y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/q$a;

.field public final synthetic b:Landroid/util/Pair;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p6y;->a:Lcom/google/android/exoplayer2/q$a;

    iput-object p2, p0, Ll/p6y;->b:Landroid/util/Pair;

    iput p3, p0, Ll/p6y;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p6y;->a:Lcom/google/android/exoplayer2/q$a;

    iget-object v1, p0, Ll/p6y;->b:Landroid/util/Pair;

    iget p0, p0, Ll/p6y;->c:I

    invoke-static {v0, v1, p0}, Lcom/google/android/exoplayer2/q$a;->u(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;I)V

    return-void
.end method
