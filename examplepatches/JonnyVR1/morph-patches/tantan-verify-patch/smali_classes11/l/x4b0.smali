.class public final synthetic Ll/x4b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/source/n;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/source/n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x4b0;->a:Lcom/google/android/exoplayer2/source/n;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x4b0;->a:Lcom/google/android/exoplayer2/source/n;

    invoke-static {p0}, Lcom/google/android/exoplayer2/source/n;->u(Lcom/google/android/exoplayer2/source/n;)V

    return-void
.end method
