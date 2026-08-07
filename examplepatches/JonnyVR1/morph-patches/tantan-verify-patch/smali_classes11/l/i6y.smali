.class public final synthetic Ll/i6y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/q$a;

.field public final synthetic b:Landroid/util/Pair;

.field public final synthetic c:Ll/mtv;

.field public final synthetic d:Ll/ktx;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i6y;->a:Lcom/google/android/exoplayer2/q$a;

    iput-object p2, p0, Ll/i6y;->b:Landroid/util/Pair;

    iput-object p3, p0, Ll/i6y;->c:Ll/mtv;

    iput-object p4, p0, Ll/i6y;->d:Ll/ktx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i6y;->a:Lcom/google/android/exoplayer2/q$a;

    iget-object v1, p0, Ll/i6y;->b:Landroid/util/Pair;

    iget-object v2, p0, Ll/i6y;->c:Ll/mtv;

    iget-object p0, p0, Ll/i6y;->d:Ll/ktx;

    invoke-static {v0, v1, v2, p0}, Lcom/google/android/exoplayer2/q$a;->s(Lcom/google/android/exoplayer2/q$a;Landroid/util/Pair;Ll/mtv;Ll/ktx;)V

    return-void
.end method
