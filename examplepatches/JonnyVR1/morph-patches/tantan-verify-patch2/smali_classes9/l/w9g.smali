.class public final synthetic Ll/w9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x9g;

.field public final synthetic b:Ll/ycg;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/x9g;Ll/ycg;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w9g;->a:Ll/x9g;

    iput-object p2, p0, Ll/w9g;->b:Ll/ycg;

    iput-object p3, p0, Ll/w9g;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w9g;->a:Ll/x9g;

    iget-object v1, p0, Ll/w9g;->b:Ll/ycg;

    iget-object p0, p0, Ll/w9g;->c:Ll/y20;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/x9g;->l(Ll/x9g;Ll/ycg;Ll/y20;Ljava/lang/String;)V

    return-void
.end method
