.class public final synthetic Ll/ke6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ue6;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/c0$c;


# direct methods
.method public synthetic constructor <init>(Ll/ue6;Ljava/lang/String;Lcom/p1/mobile/putong/core/api/c0$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ke6;->a:Ll/ue6;

    iput-object p2, p0, Ll/ke6;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ke6;->c:Lcom/p1/mobile/putong/core/api/c0$c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ke6;->a:Ll/ue6;

    iget-object v1, p0, Ll/ke6;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/ke6;->c:Lcom/p1/mobile/putong/core/api/c0$c;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Ll/ue6;->i(Ll/ue6;Ljava/lang/String;Lcom/p1/mobile/putong/core/api/c0$c;Ll/pf60;)V

    return-void
.end method
