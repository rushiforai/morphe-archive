.class public final synthetic Ll/fpe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ope0;


# direct methods
.method public synthetic constructor <init>(Ll/ope0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fpe0;->a:Ll/ope0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fpe0;->a:Ll/ope0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-static {p0, p1}, Ll/ope0;->o0(Ll/ope0;Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method
