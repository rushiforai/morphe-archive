.class public final synthetic Ll/brp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/erp;


# direct methods
.method public synthetic constructor <init>(Ll/erp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/brp;->a:Ll/erp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/brp;->a:Ll/erp;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/erp;->K3(Ll/erp;Ljava/util/List;)V

    return-void
.end method
