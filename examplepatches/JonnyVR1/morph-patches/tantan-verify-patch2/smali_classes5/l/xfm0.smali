.class public final synthetic Ll/xfm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/xfm0;->a:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xfm0;->a:Z

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->q0(Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
