.class public final synthetic Ll/ru40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tu40$a;

.field public final synthetic b:Ll/zq90;


# direct methods
.method public synthetic constructor <init>(Ll/tu40$a;Ll/zq90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ru40;->a:Ll/tu40$a;

    iput-object p2, p0, Ll/ru40;->b:Ll/zq90;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ru40;->a:Ll/tu40$a;

    iget-object p0, p0, Ll/ru40;->b:Ll/zq90;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/tu40$a;->a(Ll/tu40$a;Ll/zq90;[I)V

    return-void
.end method
