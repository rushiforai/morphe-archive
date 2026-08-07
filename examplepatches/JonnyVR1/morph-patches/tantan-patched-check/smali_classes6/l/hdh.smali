.class public final synthetic Ll/hdh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/odh;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/odh;Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hdh;->a:Ll/odh;

    iput-object p2, p0, Ll/hdh;->b:Ll/xc00;

    iput-object p3, p0, Ll/hdh;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hdh;->a:Ll/odh;

    iget-object v1, p0, Ll/hdh;->b:Ll/xc00;

    iget-object p0, p0, Ll/hdh;->c:Ljava/lang/String;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Ll/odh;->P(Ll/odh;Ll/xc00;Ljava/lang/String;Ll/pf60;)V

    return-void
.end method
