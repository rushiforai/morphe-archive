.class public final synthetic Ll/fv5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nv5;


# direct methods
.method public synthetic constructor <init>(Ll/nv5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fv5;->a:Ll/nv5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fv5;->a:Ll/nv5;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/nv5;->V3(Ll/nv5;Ljava/lang/String;)V

    return-void
.end method
