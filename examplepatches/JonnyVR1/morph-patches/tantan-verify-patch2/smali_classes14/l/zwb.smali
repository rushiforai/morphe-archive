.class public final synthetic Ll/zwb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fxb;


# direct methods
.method public synthetic constructor <init>(Ll/fxb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zwb;->a:Ll/fxb;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zwb;->a:Ll/fxb;

    check-cast p1, Lcom/p1/mobile/putong/data/SignupStage;

    invoke-static {p0, p1}, Ll/fxb;->p0(Ll/fxb;Lcom/p1/mobile/putong/data/SignupStage;)V

    return-void
.end method
