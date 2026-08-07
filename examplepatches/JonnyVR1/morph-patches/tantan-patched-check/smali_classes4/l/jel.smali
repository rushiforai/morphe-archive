.class public final synthetic Ll/jel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tel;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/tel;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jel;->a:Ll/tel;

    iput-object p2, p0, Ll/jel;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/jel;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jel;->a:Ll/tel;

    iget-object v1, p0, Ll/jel;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/jel;->c:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Ll/tel;->u0(Ll/tel;Ljava/util/ArrayList;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
