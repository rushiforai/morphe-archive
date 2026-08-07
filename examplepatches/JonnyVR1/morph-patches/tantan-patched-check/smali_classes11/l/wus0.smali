.class public final Ll/wus0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xct0;


# instance fields
.field public final synthetic a:Ll/vus0;


# direct methods
.method public constructor <init>(Ll/avs0;Ll/vus0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/wus0;->a:Ll/vus0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ll/ots0;

    .line 2
    .line 3
    const-string v0, "Getting a new session for JS Engine."

    .line 4
    .line 5
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/ots0;->zzj()Ll/dvs0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ll/wus0;->a:Ll/vus0;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/kdt0;->d(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
