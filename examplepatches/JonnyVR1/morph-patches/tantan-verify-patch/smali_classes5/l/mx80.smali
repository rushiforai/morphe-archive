.class public final synthetic Ll/mx80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wx80;


# direct methods
.method public synthetic constructor <init>(Ll/wx80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mx80;->a:Ll/wx80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mx80;->a:Ll/wx80;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/wx80;->h0(Ll/wx80;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
