.class public interface abstract Ll/qa5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:Ll/qa5;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/cph0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cph0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/qa5;->a:Ll/qa5;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract a()J
.end method

.method public abstract b()V
.end method

.method public abstract c(Landroid/os/Looper;Landroid/os/Handler$Callback;)Ll/sxk;
    .param p2    # Landroid/os/Handler$Callback;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract elapsedRealtime()J
.end method
