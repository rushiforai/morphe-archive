.class public final synthetic Ll/hrl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/krl0;


# direct methods
.method public synthetic constructor <init>(Ll/krl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hrl0;->a:Ll/krl0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrl0;->a:Ll/krl0;

    check-cast p1, Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {p0, p1}, Ll/krl0;->s(Ll/krl0;Lcom/p1/mobile/putong/data/MessageLocation;)V

    return-void
.end method
