.class public final synthetic Ll/z9d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/z9d;->a:Z

    iput-object p2, p0, Ll/z9d;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/z9d;->a:Z

    iget-object p0, p0, Ll/z9d;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->si(ZLcom/p1/mobile/putong/core/newui/home/b;Ljava/lang/String;)V

    return-void
.end method
