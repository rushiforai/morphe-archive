.class public final synthetic Ll/y4b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/n;

.field public final synthetic b:Ll/mke0;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/n;Ll/mke0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y4b0;->a:Lcom/google/android/exoplayer2/source/n;

    iput-object p2, p0, Ll/y4b0;->b:Ll/mke0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y4b0;->a:Lcom/google/android/exoplayer2/source/n;

    iget-object p0, p0, Ll/y4b0;->b:Ll/mke0;

    invoke-static {v0, p0}, Lcom/google/android/exoplayer2/source/n;->v(Lcom/google/android/exoplayer2/source/n;Ll/mke0;)V

    return-void
.end method
