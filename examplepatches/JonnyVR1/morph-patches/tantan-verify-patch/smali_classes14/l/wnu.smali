.class public final synthetic Ll/wnu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xnu;

.field public final synthetic b:Ll/ahu;


# direct methods
.method public synthetic constructor <init>(Ll/xnu;Ll/ahu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wnu;->a:Ll/xnu;

    iput-object p2, p0, Ll/wnu;->b:Ll/ahu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wnu;->a:Ll/xnu;

    iget-object p0, p0, Ll/wnu;->b:Ll/ahu;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/xnu;->i(Ll/xnu;Ll/ahu;Ljava/lang/Throwable;)V

    return-void
.end method
