.class public final synthetic Ll/w680;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k780;


# direct methods
.method public synthetic constructor <init>(Ll/k780;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w680;->a:Ll/k780;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w680;->a:Ll/k780;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/k780;->Z3(Ll/k780;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
