.class public final synthetic Ll/pqx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uqx;


# direct methods
.method public synthetic constructor <init>(Ll/uqx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pqx;->a:Ll/uqx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pqx;->a:Ll/uqx;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1}, Ll/uqx;->c(Ll/uqx;Ljava/lang/Integer;)V

    return-void
.end method
