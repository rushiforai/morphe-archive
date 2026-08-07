.class public final synthetic Ll/y39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/f49;

.field public final synthetic b:Lcom/p1/mobile/putong/data/PushMessageCustom;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/f49;Lcom/p1/mobile/putong/data/PushMessageCustom;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y39;->a:Ll/f49;

    iput-object p2, p0, Ll/y39;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iput-boolean p3, p0, Ll/y39;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y39;->a:Ll/f49;

    iget-object v1, p0, Ll/y39;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    iget-boolean p0, p0, Ll/y39;->c:Z

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Ll/f49;->o3(Ll/f49;Lcom/p1/mobile/putong/data/PushMessageCustom;ZLl/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
