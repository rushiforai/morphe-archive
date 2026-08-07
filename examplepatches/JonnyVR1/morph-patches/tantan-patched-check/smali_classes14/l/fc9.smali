.class public final synthetic Ll/fc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/lc9;


# direct methods
.method public synthetic constructor <init>(Ll/lc9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fc9;->a:Ll/lc9;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fc9;->a:Ll/lc9;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/lc9;->g3(Ll/lc9;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
