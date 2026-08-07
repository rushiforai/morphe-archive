.class public final synthetic Ll/mig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pig;


# direct methods
.method public synthetic constructor <init>(Ll/pig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mig;->a:Ll/pig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mig;->a:Ll/pig;

    check-cast p1, Ll/jsv;

    invoke-static {p0, p1}, Ll/pig;->e4(Ll/pig;Ll/jsv;)V

    return-void
.end method
