.class public final synthetic Ll/qle0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vle0;


# direct methods
.method public synthetic constructor <init>(Ll/vle0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qle0;->a:Ll/vle0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qle0;->a:Ll/vle0;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/vle0;->g0(Ll/vle0;Ljava/util/List;)V

    return-void
.end method
