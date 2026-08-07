.class public final synthetic Ll/ivl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qvl0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DoublePair;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/qvl0;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ivl0;->a:Ll/qvl0;

    iput-object p2, p0, Ll/ivl0;->b:Lcom/p1/mobile/putong/data/DoublePair;

    iput-object p3, p0, Ll/ivl0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ivl0;->a:Ll/qvl0;

    iget-object v1, p0, Ll/ivl0;->b:Lcom/p1/mobile/putong/data/DoublePair;

    iget-object p0, p0, Ll/ivl0;->c:Ljava/lang/String;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/qvl0;->o0(Ll/qvl0;Lcom/p1/mobile/putong/data/DoublePair;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
