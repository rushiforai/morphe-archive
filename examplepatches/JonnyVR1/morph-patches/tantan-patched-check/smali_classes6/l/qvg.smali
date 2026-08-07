.class public final synthetic Ll/qvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yvg;


# direct methods
.method public synthetic constructor <init>(Ll/yvg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qvg;->a:Ll/yvg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvg;->a:Ll/yvg;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/yvg;->f(Ll/yvg;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
