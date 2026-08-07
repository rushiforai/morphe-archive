.class public final synthetic Ll/wli;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cmi;


# direct methods
.method public synthetic constructor <init>(Ll/cmi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wli;->a:Ll/cmi;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wli;->a:Ll/cmi;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/cmi;->b(Ll/cmi;Ljava/util/List;)V

    return-void
.end method
