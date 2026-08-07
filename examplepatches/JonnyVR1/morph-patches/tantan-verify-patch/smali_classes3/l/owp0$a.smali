.class public Ll/owp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/owp0;->i(Lcom/p1/mobile/share_sdk/content/Content;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/j5f$e;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/owp0;


# direct methods
.method public constructor <init>(Ll/owp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/owp0$a;->a:Ll/owp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/j5f$e;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/owp0$a;->a:Ll/owp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/owp0;->a(Ll/owp0;)Ll/g3f0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/owp0$a;->a:Ll/owp0;

    .line 10
    .line 11
    iget p1, p1, Ll/j5f$e;->a:I

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Ll/owp0$a;->a:Ll/owp0;

    .line 18
    .line 19
    invoke-static {p0}, Ll/owp0;->a(Ll/owp0;)Ll/g3f0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v0, p1, p0}, Ll/owp0;->b(Ll/owp0;Ljava/lang/Integer;Ll/g3f0;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/j5f$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/owp0$a;->a(Ll/j5f$e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
