.class public Ll/y60$a$a;
.super Ll/d70;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y60$a;->b(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/y60$a;


# direct methods
.method public constructor <init>(Ll/y60$a;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y60$a$a;->b:Ll/y60$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y60$a$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/d70;->onAdClicked()V

    .line 2
    .line 3
    .line 4
    const-string p0, "ixxn_ad_channel"

    .line 5
    .line 6
    const-string v0, "other"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "e_messages_ad"

    .line 17
    .line 18
    const-string v1, "p_messages_ad"

    .line 19
    .line 20
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public x(Ll/jtv;)V
    .locals 2
    .param p1    # Ll/jtv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/d70;->x(Ll/jtv;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "admob errorCode = "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ll/jtv;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Ll/o1j0;->m(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/y60$a$a;->a:Ll/gcg0;

    .line 26
    .line 27
    new-instance v0, Landroid/util/Pair;

    .line 28
    .line 29
    iget-object p0, p0, Ll/y60$a$a;->b:Ll/y60$a;

    .line 30
    .line 31
    iget-object p0, p0, Ll/y60$a;->a:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
