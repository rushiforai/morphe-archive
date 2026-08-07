.class public final synthetic Ll/niw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/siw0;


# direct methods
.method public synthetic constructor <init>(Ll/siw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/niw0;->a:Ll/siw0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/niw0;->a:Ll/siw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/siw0;->d()Lcom/google/android/gms/internal/ads/n;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
