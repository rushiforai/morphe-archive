.class public final synthetic Ll/kjb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kjb;->a:Ll/dkb;

    iput-object p2, p0, Ll/kjb;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kjb;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kjb;->a:Ll/dkb;

    iget-object v1, p0, Ll/kjb;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/kjb;->c:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/dkb;->u5(Ll/dkb;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
