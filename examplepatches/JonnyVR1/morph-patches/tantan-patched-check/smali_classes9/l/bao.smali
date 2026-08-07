.class public final synthetic Ll/bao;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eao;


# direct methods
.method public synthetic constructor <init>(Ll/eao;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bao;->a:Ll/eao;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bao;->a:Ll/eao;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/eao;->K3(Ll/eao;Ljava/lang/Long;)V

    return-void
.end method
