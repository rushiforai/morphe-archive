.class public final synthetic Ll/j9k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m9k0;


# direct methods
.method public synthetic constructor <init>(Ll/m9k0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9k0;->a:Ll/m9k0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j9k0;->a:Ll/m9k0;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ll/m9k0;->k4(Ll/m9k0;Ljava/util/ArrayList;)V

    return-void
.end method
