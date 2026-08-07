.class public final Ll/d0h0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/oyg0;

.field public final b:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/d0h0;->b:Landroid/os/Handler;

    .line 14
    .line 15
    new-instance v1, Ll/oyg0;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Ll/oyg0;-><init>(Landroid/os/Handler;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/d0h0;->a:Ll/oyg0;

    .line 21
    .line 22
    return-void
.end method
