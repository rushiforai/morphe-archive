.class public final Ll82;
.super Lz7;
.source "SourceFile"


# instance fields
.field public final synthetic h:Lg92;

.field public final synthetic i:Ln82;


# direct methods
.method public constructor <init>(Ln82;Ljava/lang/String;Lg92;)V
    .registers 4

    iput-object p3, p0, Ll82;->h:Lg92;

    iput-object p1, p0, Ll82;->i:Ln82;

    const/4 p1, 0x1

    const-string p3, ""

    invoke-direct {p0, p2, p3, p1}, Lz7;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Ll82;->h:Lg92;

    if-eqz p0, :cond_b

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_b
    const-string p0, ""

    return-object p0
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final c(Lfvh;)V
    .registers 2

    invoke-super {p0, p1}, Lz7;->c(Lfvh;)V

    iget-object p0, p0, Ll82;->i:Ln82;

    invoke-virtual {p0, p1}, Ln82;->S(Lfvh;)V

    return-void
.end method
