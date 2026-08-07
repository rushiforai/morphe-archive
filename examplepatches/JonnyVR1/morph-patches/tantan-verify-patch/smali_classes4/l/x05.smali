.class public final synthetic Ll/x05;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a15;


# direct methods
.method public synthetic constructor <init>(Ll/a15;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x05;->a:Ll/a15;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x05;->a:Ll/a15;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/a15;->e0(Ll/a15;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
