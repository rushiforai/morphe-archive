.class public final synthetic Ll/spj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vpj;


# direct methods
.method public synthetic constructor <init>(Ll/vpj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/spj;->a:Ll/vpj;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/spj;->a:Ll/vpj;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/vpj;->K3(Ll/vpj;Ljava/lang/Long;)V

    return-void
.end method
