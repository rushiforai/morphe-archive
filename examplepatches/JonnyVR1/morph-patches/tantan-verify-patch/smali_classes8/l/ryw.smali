.class public final synthetic Ll/ryw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/syw;


# direct methods
.method public synthetic constructor <init>(Ll/syw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ryw;->a:Ll/syw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ryw;->a:Ll/syw;

    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-static {p0, p1}, Ll/syw;->j0(Ll/syw;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V

    return-void
.end method
