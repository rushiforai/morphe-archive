.class public final Ll/sns0;
.super Ll/kms0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/vns0;


# direct methods
.method public synthetic constructor <init>(Ll/vns0;Ll/rns0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sns0;->a:Ll/vns0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/kms0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final T7(Ll/bms0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/sns0;->a:Ll/vns0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/vns0;->a(Ll/vns0;)Ll/byv0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {p0}, Ll/vns0;->a(Ll/vns0;)Ll/byv0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {p0, p1}, Ll/vns0;->e(Ll/vns0;Ll/bms0;)Ll/cms0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {v0, p0, p2}, Ll/byv0;->k(Ll/cms0;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
