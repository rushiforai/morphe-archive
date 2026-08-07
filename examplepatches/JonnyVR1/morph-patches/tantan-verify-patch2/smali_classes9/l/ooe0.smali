.class public final synthetic Ll/ooe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/roe0;

.field public final synthetic b:Ll/uoe0;


# direct methods
.method public synthetic constructor <init>(Ll/roe0;Ll/uoe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ooe0;->a:Ll/roe0;

    iput-object p2, p0, Ll/ooe0;->b:Ll/uoe0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ooe0;->a:Ll/roe0;

    iget-object p0, p0, Ll/ooe0;->b:Ll/uoe0;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/roe0;->K3(Ll/roe0;Ll/uoe0;Ljava/util/List;)V

    return-void
.end method
