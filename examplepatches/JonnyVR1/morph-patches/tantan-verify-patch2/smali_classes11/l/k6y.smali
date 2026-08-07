.class public final synthetic Ll/k6y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/q$a;

.field public final synthetic b:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k6y;->a:Lcom/google/android/exoplayer2/q$a;

    iput-object p2, p0, Ll/k6y;->b:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k6y;->a:Lcom/google/android/exoplayer2/q$a;

    iget-object p0, p0, Ll/k6y;->b:Landroid/util/Pair;

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/q$a;->x(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;)V

    return-void
.end method
