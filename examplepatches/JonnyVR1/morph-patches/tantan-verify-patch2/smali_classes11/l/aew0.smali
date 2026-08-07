.class public final Ll/aew0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# instance fields
.field public final synthetic a:Ll/cew0;

.field public final synthetic b:Ll/rdw0;


# direct methods
.method public constructor <init>(Ll/cew0;Ll/rdw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aew0;->a:Ll/cew0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/aew0;->b:Ll/rdw0;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aew0;->b:Ll/rdw0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/rdw0;->b(Ljava/lang/Throwable;)Ll/rdw0;

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-interface {v0, p1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/aew0;->a:Ll/cew0;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final zzb(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method
