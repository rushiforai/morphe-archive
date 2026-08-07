.class public final synthetic Ll/xcg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/edg0;


# direct methods
.method public synthetic constructor <init>(Ll/edg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xcg0;->a:Ll/edg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcg0;->a:Ll/edg0;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ll/edg0;->e0(Ll/edg0;Ljava/util/ArrayList;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
