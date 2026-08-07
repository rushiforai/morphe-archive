.class public final synthetic Ll/y21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b7h0;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/y21;->a:I

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ll/y21;->a:I

    invoke-static {p0}, Lcom/google/android/exoplayer2/mediacodec/a$b;->b(I)Landroid/os/HandlerThread;

    move-result-object p0

    return-object p0
.end method
