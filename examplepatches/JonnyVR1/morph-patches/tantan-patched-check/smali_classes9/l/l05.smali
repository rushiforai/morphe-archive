.class public final synthetic Ll/l05;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yql;


# direct methods
.method public synthetic constructor <init>(Ll/yql;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l05;->a:Ll/yql;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l05;->a:Ll/yql;

    check-cast p1, Ll/p9t;

    invoke-interface {p0, p1}, Ll/yql;->i(Ll/p9t;)V

    return-void
.end method
