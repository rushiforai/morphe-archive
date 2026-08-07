.class public final synthetic Ll/n7g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cm0;


# direct methods
.method public synthetic constructor <init>(Ll/cm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n7g;->a:Ll/cm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n7g;->a:Ll/cm0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    invoke-static {p0, p1}, Ll/x7g;->l(Ll/cm0;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;)Ll/yhg;

    move-result-object p0

    return-object p0
.end method
