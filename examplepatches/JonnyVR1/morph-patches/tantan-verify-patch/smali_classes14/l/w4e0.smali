.class public final synthetic Ll/w4e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y4e0;

.field public final synthetic b:Ll/abe0;

.field public final synthetic c:Ljava/lang/Long;


# direct methods
.method public synthetic constructor <init>(Ll/y4e0;Ll/abe0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w4e0;->a:Ll/y4e0;

    iput-object p2, p0, Ll/w4e0;->b:Ll/abe0;

    iput-object p3, p0, Ll/w4e0;->c:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w4e0;->a:Ll/y4e0;

    iget-object v1, p0, Ll/w4e0;->b:Ll/abe0;

    iget-object p0, p0, Ll/w4e0;->c:Ljava/lang/Long;

    check-cast p1, Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/y4e0;->f(Ll/y4e0;Ll/abe0;Ljava/lang/Long;Lcom/p1/mobile/putong/core/data/FreeTrialEnvelope;)V

    return-void
.end method
