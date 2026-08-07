.class public final synthetic Ll/g0w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/google/common/base/Optional;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g0w;->a:Lcom/google/common/base/Optional;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g0w;->a:Lcom/google/common/base/Optional;

    check-cast p1, Ll/l0w$a;

    invoke-static {p0, p1}, Ll/l0w;->e(Lcom/google/common/base/Optional;Ll/l0w$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
