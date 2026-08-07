.class public final synthetic Ll/sfh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ogh;

.field public final synthetic b:Ll/yqg;


# direct methods
.method public synthetic constructor <init>(Ll/ogh;Ll/yqg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sfh;->a:Ll/ogh;

    iput-object p2, p0, Ll/sfh;->b:Ll/yqg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sfh;->a:Ll/ogh;

    iget-object p0, p0, Ll/sfh;->b:Ll/yqg;

    check-cast p1, Ljava/util/Map;

    invoke-static {v0, p0, p1}, Ll/ogh;->o(Ll/ogh;Ll/yqg;Ljava/util/Map;)V

    return-void
.end method
