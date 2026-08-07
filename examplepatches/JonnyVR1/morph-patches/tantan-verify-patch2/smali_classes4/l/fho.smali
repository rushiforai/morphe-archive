.class public final synthetic Ll/fho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uho;


# direct methods
.method public synthetic constructor <init>(Ll/uho;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fho;->a:Ll/uho;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fho;->a:Ll/uho;

    check-cast p1, Lcom/google/common/base/Optional;

    invoke-static {p0, p1}, Ll/uho;->i0(Ll/uho;Lcom/google/common/base/Optional;)V

    return-void
.end method
