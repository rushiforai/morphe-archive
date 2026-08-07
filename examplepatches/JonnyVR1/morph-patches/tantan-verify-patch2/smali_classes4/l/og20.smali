.class public final synthetic Ll/og20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/pg20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/pg20;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/og20;->a:Ll/pg20;

    iput-object p2, p0, Ll/og20;->b:Lcom/p1/mobile/putong/data/User;

    iput p3, p0, Ll/og20;->c:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/og20;->a:Ll/pg20;

    iget-object v1, p0, Ll/og20;->b:Lcom/p1/mobile/putong/data/User;

    iget p0, p0, Ll/og20;->c:I

    invoke-static {v0, v1, p0}, Ll/pg20;->E(Ll/pg20;Lcom/p1/mobile/putong/data/User;I)V

    return-void
.end method
