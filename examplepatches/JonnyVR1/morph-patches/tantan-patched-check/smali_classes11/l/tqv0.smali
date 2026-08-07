.class public final Ll/tqv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vuv0;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ll/sqv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tqv0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tqv0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tqv0;->c:Landroid/os/Bundle;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    const-string v0, "consent_string"

    .line 4
    .line 5
    iget-object v1, p0, Ll/tqv0;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "fc_consent"

    .line 11
    .line 12
    iget-object v1, p0, Ll/tqv0;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string v0, "iab_consent_info"

    .line 18
    .line 19
    iget-object p0, p0, Ll/tqv0;->c:Landroid/os/Bundle;

    .line 20
    .line 21
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
