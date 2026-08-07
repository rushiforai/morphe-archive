.class public final synthetic Ll/qhp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kip0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/kip0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qhp0;->a:Ll/kip0;

    iput-object p2, p0, Ll/qhp0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qhp0;->a:Ll/kip0;

    iget-object p0, p0, Ll/qhp0;->b:Ljava/lang/String;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {v0, p0, p1}, Ll/kip0;->a4(Ll/kip0;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-void
.end method
