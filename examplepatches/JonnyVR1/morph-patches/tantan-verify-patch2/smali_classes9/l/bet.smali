.class public final synthetic Ll/bet;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bft;


# direct methods
.method public synthetic constructor <init>(Ll/bft;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bet;->a:Ll/bft;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bet;->a:Ll/bft;

    invoke-static {p0}, Ll/bft;->K3(Ll/bft;)V

    return-void
.end method
