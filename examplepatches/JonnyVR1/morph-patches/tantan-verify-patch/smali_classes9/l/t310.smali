.class public final synthetic Ll/t310;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u310;

.field public final synthetic b:Ll/pwl;


# direct methods
.method public synthetic constructor <init>(Ll/u310;Ll/pwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t310;->a:Ll/u310;

    iput-object p2, p0, Ll/t310;->b:Ll/pwl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t310;->a:Ll/u310;

    iget-object p0, p0, Ll/t310;->b:Ll/pwl;

    check-cast p1, Ll/cf80;

    invoke-static {v0, p0, p1}, Ll/u310;->h0(Ll/u310;Ll/pwl;Ll/cf80;)V

    return-void
.end method
