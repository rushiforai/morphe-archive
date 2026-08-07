.class public final synthetic Ll/gfg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rfg;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/rfg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gfg;->a:Ll/rfg;

    iput-object p2, p0, Ll/gfg;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gfg;->a:Ll/rfg;

    iget-object p0, p0, Ll/gfg;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    invoke-static {v0, p0, p1}, Ll/rfg;->a4(Ll/rfg;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method
