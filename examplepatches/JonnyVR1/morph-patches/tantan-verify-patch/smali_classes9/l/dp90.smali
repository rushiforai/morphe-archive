.class public final synthetic Ll/dp90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ep90;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/ep90;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dp90;->a:Ll/ep90;

    iput-object p2, p0, Ll/dp90;->b:Ll/y20;

    iput-object p3, p0, Ll/dp90;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dp90;->a:Ll/ep90;

    iget-object v1, p0, Ll/dp90;->b:Ll/y20;

    iget-object p0, p0, Ll/dp90;->c:Ll/x20;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/ep90;->y(Ll/ep90;Ll/y20;Ll/x20;Ljava/lang/String;)V

    return-void
.end method
