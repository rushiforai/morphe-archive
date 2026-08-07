.class public final synthetic Ll/sc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cd9;


# direct methods
.method public synthetic constructor <init>(Ll/cd9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sc9;->a:Ll/cd9;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sc9;->a:Ll/cd9;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlVisitor;

    invoke-static {p0, p1}, Ll/cd9;->e3(Ll/cd9;Lcom/p1/mobile/putong/core/data/IntlVisitor;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
