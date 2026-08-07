.class public final synthetic Ll/imf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kmf0;


# direct methods
.method public synthetic constructor <init>(Ll/kmf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/imf0;->a:Ll/kmf0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/imf0;->a:Ll/kmf0;

    check-cast p1, Lcom/p1/mobile/putong/data/SignupStage;

    invoke-static {p0, p1}, Ll/kmf0;->j0(Ll/kmf0;Lcom/p1/mobile/putong/data/SignupStage;)V

    return-void
.end method
