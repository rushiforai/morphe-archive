.class public final synthetic Ll/opn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tpn0;


# direct methods
.method public synthetic constructor <init>(Ll/tpn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/opn0;->a:Ll/tpn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/opn0;->a:Ll/tpn0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/tpn0;->R2(Ll/tpn0;Ljava/util/List;)V

    return-void
.end method
