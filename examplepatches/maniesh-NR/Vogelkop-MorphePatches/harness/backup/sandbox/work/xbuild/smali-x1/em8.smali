.class public final Lem8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;

.field public final b:Lfm8;


# direct methods
.method public constructor <init>(Leq6;Lfm8;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lem8;->a:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lem8;->b:Lfm8;

    return-void
.end method
