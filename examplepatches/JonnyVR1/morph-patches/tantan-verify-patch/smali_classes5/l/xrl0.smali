.class public final synthetic Ll/xrl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gsl0;


# direct methods
.method public synthetic constructor <init>(Ll/gsl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xrl0;->a:Ll/gsl0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xrl0;->a:Ll/gsl0;

    check-cast p1, Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {p0, p1}, Ll/gsl0;->A0(Ll/gsl0;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
