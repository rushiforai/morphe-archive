.class public final synthetic Ll/yj20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w84;

.field public final synthetic b:Ll/ry3;


# direct methods
.method public synthetic constructor <init>(Ll/w84;Ll/ry3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yj20;->a:Ll/w84;

    iput-object p2, p0, Ll/yj20;->b:Ll/ry3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yj20;->a:Ll/w84;

    iget-object p0, p0, Ll/yj20;->b:Ll/ry3;

    check-cast p1, Ll/i5d0;

    invoke-static {v0, p0, p1}, Ll/zj20;->b(Ll/w84;Ll/ry3;Ll/i5d0;)V

    return-void
.end method
