.class public final synthetic Ll/b74;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d74;


# direct methods
.method public synthetic constructor <init>(Ll/d74;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b74;->a:Ll/d74;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b74;->a:Ll/d74;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/d74;->K3(Ll/d74;Ljava/util/List;)V

    return-void
.end method
