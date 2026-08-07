.class public final synthetic Ll/l8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/l8f;->a:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/l8f;->a:Z

    check-cast p1, Lcom/google/android/exoplayer2/t$d;

    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/i;->D(ZLcom/google/android/exoplayer2/t$d;)V

    return-void
.end method
