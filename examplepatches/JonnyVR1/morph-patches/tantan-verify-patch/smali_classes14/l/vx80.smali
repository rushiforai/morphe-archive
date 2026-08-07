.class public Ll/vx80;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ey80;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/kv80;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/vx80$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/vx80$a;-><init>(Ll/vx80;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vx80;->a:Ll/kv80;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vx80;->a:Ll/kv80;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zw80;->a(Ll/kv80;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/ey80;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/ey80;->e(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
