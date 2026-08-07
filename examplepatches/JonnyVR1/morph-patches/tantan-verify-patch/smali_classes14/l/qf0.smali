.class public final synthetic Ll/qf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Picture;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Picture;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qf0;->a:Lcom/p1/mobile/putong/data/Picture;

    iput-object p2, p0, Ll/qf0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qf0;->a:Lcom/p1/mobile/putong/data/Picture;

    iget-object p0, p0, Ll/qf0;->b:Ll/y20;

    invoke-static {v0, p0}, Ll/yf0;->o(Lcom/p1/mobile/putong/data/Picture;Ll/y20;)V

    return-void
.end method
