.class public final synthetic Ll/oy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/py0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/AppealPostData;


# direct methods
.method public synthetic constructor <init>(Ll/py0;Lcom/p1/mobile/putong/data/AppealPostData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oy0;->a:Ll/py0;

    iput-object p2, p0, Ll/oy0;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oy0;->a:Ll/py0;

    iget-object p0, p0, Ll/oy0;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/py0;->e0(Ll/py0;Lcom/p1/mobile/putong/data/AppealPostData;Ljava/lang/Throwable;)V

    return-void
.end method
