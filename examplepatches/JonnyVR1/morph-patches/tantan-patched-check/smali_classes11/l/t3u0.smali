.class public final Ll/t3u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/u3u0;


# direct methods
.method public constructor <init>(Ll/u3u0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t3u0;->a:Ll/u3u0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Lorg/checkerframework/checker/nullness/compatqual/NullableDecl;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p0, p0, Ll/t3u0;->a:Ll/u3u0;

    .line 4
    .line 5
    invoke-static {p0}, Ll/u3u0;->b(Ll/u3u0;)Ll/h7u0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/h7u0;->zza()V

    .line 10
    .line 11
    .line 12
    return-void
.end method
