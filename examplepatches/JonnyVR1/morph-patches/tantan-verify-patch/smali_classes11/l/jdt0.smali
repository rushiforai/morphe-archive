.class public final Ll/jdt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/xct0;

.field public final synthetic b:Ll/vct0;


# direct methods
.method public constructor <init>(Ll/kdt0;Ll/xct0;Ll/vct0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/jdt0;->a:Ll/xct0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/jdt0;->b:Ll/vct0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdt0;->b:Ll/vct0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/vct0;->zza()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzb(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/jdt0;->a:Ll/xct0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/xct0;->zza(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
