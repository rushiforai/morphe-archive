.class public final synthetic Ll/ito;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/vto;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/vto;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ito;->a:Ll/vto;

    iput-object p2, p0, Ll/ito;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/ito;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ito;->a:Ll/vto;

    iget-object v1, p0, Ll/ito;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/ito;->c:Ljava/util/List;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, p0, p1}, Ll/vto;->w(Ll/vto;Ljava/lang/String;Ljava/util/List;Ll/gcg0;)V

    return-void
.end method
