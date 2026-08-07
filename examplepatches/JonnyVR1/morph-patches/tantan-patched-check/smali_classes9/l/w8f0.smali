.class public final synthetic Ll/w8f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/Collection;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Collection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w8f0;->a:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w8f0;->a:Ljava/util/Collection;

    check-cast p1, Ll/wwt;

    invoke-static {p0, p1}, Ll/g9f0;->q(Ljava/util/Collection;Ll/wwt;)V

    return-void
.end method
