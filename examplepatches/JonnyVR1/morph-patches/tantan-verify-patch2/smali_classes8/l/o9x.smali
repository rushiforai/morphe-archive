.class public final synthetic Ll/o9x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v9x;


# direct methods
.method public synthetic constructor <init>(Ll/v9x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o9x;->a:Ll/v9x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o9x;->a:Ll/v9x;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/v9x;->L0(Ll/v9x;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
