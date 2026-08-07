.class public final synthetic Ll/n5w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f3w0;


# instance fields
.field public final synthetic a:Ll/f5t0;


# direct methods
.method public synthetic constructor <init>(Ll/f5t0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n5w0;->a:Ll/f5t0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/n5w0;->a:Ll/f5t0;

    .line 2
    .line 3
    check-cast p1, Ll/o7t0;

    .line 4
    .line 5
    new-instance v0, Ll/j8t0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/f5t0;->zzc()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {p0}, Ll/f5t0;->zzb()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-direct {v0, v1, p0}, Ll/j8t0;-><init>(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, v0}, Ll/o7t0;->u6(Ll/i7t0;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
