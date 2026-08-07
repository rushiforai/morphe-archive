.class public final Ll/gfu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public a:Ll/olu0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/olu0;Ll/olu0;)V
    .locals 1

    .line 1
    check-cast p0, Ll/gfu0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/gfu0;->a:Ll/olu0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/gfu0;->a:Ll/olu0;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final zza()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gfu0;->a:Ll/olu0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method
