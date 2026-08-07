.class public final synthetic Ll/i1q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i1q0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/i1q0;->b:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i1q0;->a:Ll/v3q0;

    iget-object p0, p0, Ll/i1q0;->b:Lcom/p1/mobile/putong/data/SignUpData;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/v3q0;->j1(Ll/v3q0;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method
