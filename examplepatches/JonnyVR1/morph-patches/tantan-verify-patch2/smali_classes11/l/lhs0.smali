.class public final Ll/lhs0;
.super Ll/mhs0;
.source "SourceFile"


# instance fields
.field public final a:Ll/myv0;

.field public final b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/myv0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/mhs0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lhs0;->a:Ll/myv0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lhs0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lhs0;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final x(Ll/p1m;)V
    .locals 0
    .param p1    # Ll/p1m;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Ll/lhs0;->a:Ll/myv0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/view/View;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/myv0;->a(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final zzb()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhs0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzc()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhs0;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zze()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhs0;->a:Ll/myv0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/myv0;->zzb()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzf()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lhs0;->a:Ll/myv0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/myv0;->zzc()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
