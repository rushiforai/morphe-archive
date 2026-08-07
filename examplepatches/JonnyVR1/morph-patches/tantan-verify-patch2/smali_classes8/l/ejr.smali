.class public final synthetic Ll/ejr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fjr;


# direct methods
.method public synthetic constructor <init>(Ll/fjr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ejr;->a:Ll/fjr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ejr;->a:Ll/fjr;

    check-cast p1, Lcom/p1/mobile/putong/data/Settings;

    invoke-static {p0, p1}, Ll/fjr;->m0(Ll/fjr;Lcom/p1/mobile/putong/data/Settings;)V

    return-void
.end method
