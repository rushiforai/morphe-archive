.class public final synthetic Ll/h41;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/j41;


# direct methods
.method public synthetic constructor <init>(Ll/j41;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h41;->a:Ll/j41;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h41;->a:Ll/j41;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/j41;->b(Ll/j41;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
