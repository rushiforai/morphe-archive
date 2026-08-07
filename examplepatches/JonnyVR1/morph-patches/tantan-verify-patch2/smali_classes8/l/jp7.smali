.class public final synthetic Ll/jp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qp7;


# direct methods
.method public synthetic constructor <init>(Ll/qp7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jp7;->a:Ll/qp7;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jp7;->a:Ll/qp7;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/qp7;->J(Ll/qp7;Ljava/lang/String;)V

    return-void
.end method
