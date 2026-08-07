.class public final synthetic Ll/mii0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gji0;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/gji0;Ll/xc00;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mii0;->a:Ll/gji0;

    iput-object p2, p0, Ll/mii0;->b:Ll/xc00;

    iput-object p3, p0, Ll/mii0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/mii0;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mii0;->a:Ll/gji0;

    iget-object v1, p0, Ll/mii0;->b:Ll/xc00;

    iget-object v2, p0, Ll/mii0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/mii0;->d:Ljava/util/List;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, p0, p1}, Ll/gji0;->Z(Ll/gji0;Ll/xc00;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;)V

    return-void
.end method
