.class public final Ll/a0u0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/b7w0;

.field public final b:Ll/q6w0;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V
    .locals 0
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a0u0;->a:Ll/b7w0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/a0u0;->b:Ll/q6w0;

    .line 7
    .line 8
    if-nez p3, :cond_0

    .line 9
    .line 10
    const-string p3, "com.google.ads.mediation.admob.AdMobAdapter"

    .line 11
    .line 12
    :cond_0
    iput-object p3, p0, Ll/a0u0;->c:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()Ll/q6w0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0u0;->b:Ll/q6w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/t6w0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0u0;->a:Ll/b7w0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/a7w0;->b:Ll/t6w0;

    .line 6
    .line 7
    return-object p0
.end method

.method public final c()Ll/b7w0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0u0;->a:Ll/b7w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0u0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
