.class public final synthetic Ll/aa30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/a;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aa30;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    iput-boolean p2, p0, Ll/aa30;->b:Z

    iput-object p3, p0, Ll/aa30;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aa30;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    iget-boolean v1, p0, Ll/aa30;->b:Z

    iget-object p0, p0, Ll/aa30;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a;->W4(Lcom/p1/mobile/putong/core/newui/main/a;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)V

    return-void
.end method
