.class public final synthetic Ll/uro0;
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

    iput-object p1, p0, Ll/uro0;->a:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uro0;->a:Ljava/util/Collection;

    check-cast p1, Ll/isv;

    invoke-static {p0, p1}, Ll/zro0;->l(Ljava/util/Collection;Ll/isv;)V

    return-void
.end method
