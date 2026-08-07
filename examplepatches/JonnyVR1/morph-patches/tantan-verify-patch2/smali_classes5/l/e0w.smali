.class public final synthetic Ll/e0w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l0w;


# direct methods
.method public synthetic constructor <init>(Ll/l0w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e0w;->a:Ll/l0w;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e0w;->a:Ll/l0w;

    check-cast p1, Lcom/google/common/base/Optional;

    invoke-static {p0, p1}, Ll/l0w;->g(Ll/l0w;Lcom/google/common/base/Optional;)V

    return-void
.end method
