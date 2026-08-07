.class public final synthetic Ll/osd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/ui/DefaultTimeBar;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/ui/DefaultTimeBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/osd;->a:Lcom/google/android/exoplayer2/ui/DefaultTimeBar;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/osd;->a:Lcom/google/android/exoplayer2/ui/DefaultTimeBar;

    invoke-static {p0}, Lcom/google/android/exoplayer2/ui/DefaultTimeBar;->d(Lcom/google/android/exoplayer2/ui/DefaultTimeBar;)V

    return-void
.end method
