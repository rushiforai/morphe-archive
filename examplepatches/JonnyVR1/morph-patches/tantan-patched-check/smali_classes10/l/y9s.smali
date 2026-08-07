.class public final synthetic Ll/y9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aas;


# direct methods
.method public synthetic constructor <init>(Ll/aas;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y9s;->a:Ll/aas;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y9s;->a:Ll/aas;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    invoke-static {p0, p1}, Ll/aas;->f0(Ll/aas;Lcom/p1/mobile/putong/live/base/data/BLiveSummary;)V

    return-void
.end method
