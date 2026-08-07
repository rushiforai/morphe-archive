.class public final synthetic Ll/po70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Ll/jic0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;Ll/jic0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/po70;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-object p2, p0, Ll/po70;->b:Ll/jic0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/po70;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-object p0, p0, Ll/po70;->b:Ll/jic0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/qo70$a;->b(Lcom/p1/mobile/putong/core/newui/home/d;Ll/jic0;Ljava/lang/Throwable;)V

    return-void
.end method
