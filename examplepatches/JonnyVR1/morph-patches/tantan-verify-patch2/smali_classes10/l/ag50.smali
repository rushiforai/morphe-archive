.class public final synthetic Ll/ag50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cg50;


# direct methods
.method public synthetic constructor <init>(Ll/cg50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ag50;->a:Ll/cg50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ag50;->a:Ll/cg50;

    check-cast p1, Ljava/util/Map;

    invoke-static {p0, p1}, Ll/cg50;->K3(Ll/cg50;Ljava/util/Map;)V

    return-void
.end method
