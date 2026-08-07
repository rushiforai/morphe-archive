.class public final synthetic Ll/u5m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v5m0;


# direct methods
.method public synthetic constructor <init>(Ll/v5m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u5m0;->a:Ll/v5m0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5m0;->a:Ll/v5m0;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ll/v5m0;->l4(Ll/v5m0;Ljava/util/ArrayList;)V

    return-void
.end method
