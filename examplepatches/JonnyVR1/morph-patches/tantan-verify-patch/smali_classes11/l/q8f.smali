.class public final synthetic Ll/q8f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqr$a;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/q8f;->a:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/q8f;->a:I

    check-cast p1, Lcom/google/android/exoplayer2/t$d;

    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/i;->I(ILcom/google/android/exoplayer2/t$d;)V

    return-void
.end method
