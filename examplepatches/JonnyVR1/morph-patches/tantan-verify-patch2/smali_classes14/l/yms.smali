.class public final synthetic Ll/yms;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nns;


# direct methods
.method public synthetic constructor <init>(Ll/nns;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yms;->a:Ll/nns;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yms;->a:Ll/nns;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/nns;->a3(Ll/nns;Ljava/util/List;)V

    return-void
.end method
