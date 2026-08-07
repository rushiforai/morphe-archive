.class public final synthetic Ll/qfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yfl;

.field public final synthetic b:Ll/f1g0;


# direct methods
.method public synthetic constructor <init>(Ll/yfl;Ll/f1g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qfl;->a:Ll/yfl;

    iput-object p2, p0, Ll/qfl;->b:Ll/f1g0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qfl;->a:Ll/yfl;

    iget-object p0, p0, Ll/qfl;->b:Ll/f1g0;

    check-cast p1, Ll/xql;

    invoke-static {v0, p0, p1}, Ll/yfl;->l(Ll/yfl;Ll/f1g0;Ll/xql;)V

    return-void
.end method
