.class public final synthetic Ll/mf4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qf4;


# direct methods
.method public synthetic constructor <init>(Ll/qf4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mf4;->a:Ll/qf4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mf4;->a:Ll/qf4;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {p0, p1}, Ll/qf4;->N3(Ll/qf4;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
