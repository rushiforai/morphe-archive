.class public final synthetic Ll/tvp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xvp;

.field public final synthetic b:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/xvp;Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tvp;->a:Ll/xvp;

    iput-object p2, p0, Ll/tvp;->b:Ll/xup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tvp;->a:Ll/xvp;

    iget-object p0, p0, Ll/tvp;->b:Ll/xup;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/xvp;->m0(Ll/xvp;Ll/xup;Ljava/util/List;)V

    return-void
.end method
