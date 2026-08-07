.class public final synthetic Ll/qfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sfn;


# direct methods
.method public synthetic constructor <init>(Ll/sfn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qfn;->a:Ll/sfn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfn;->a:Ll/sfn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    invoke-static {p0, p1}, Ll/sfn;->e0(Ll/sfn;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method
