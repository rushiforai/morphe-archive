.class public final synthetic Ll/tzj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p0k0$b;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzj0;->a:Ll/p0k0$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tzj0;->a:Ll/p0k0$b;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/p0k0;->C(Ll/p0k0$b;Ljava/util/List;)V

    return-void
.end method
