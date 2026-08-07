.class public final synthetic Ll/yz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/c09;


# direct methods
.method public synthetic constructor <init>(Ll/c09;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yz8;->a:Ll/c09;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yz8;->a:Ll/c09;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/c09;->d3(Ll/c09;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
