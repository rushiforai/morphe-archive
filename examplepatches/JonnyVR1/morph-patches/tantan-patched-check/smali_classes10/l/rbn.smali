.class public final synthetic Ll/rbn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vbn;


# direct methods
.method public synthetic constructor <init>(Ll/vbn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rbn;->a:Ll/vbn;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rbn;->a:Ll/vbn;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/vbn;->K3(Ll/vbn;Ljava/util/List;)V

    return-void
.end method
